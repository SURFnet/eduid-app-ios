import UIKit
import TiqrCoreObjC
import LocalAuthentication
import OpenAPIClient

final class CreatePincodeAndBiometricAccessViewModel: NSObject {
    
    // - enrollment challenge object
    var enrollmentChallenge: EnrollmentChallenge?
    // - authentication challenge object
    let authenticationChallenge: AuthenticationChallenge?
    
    // - entered pincodes
    var firstEnteredPin: [Character] = []
    var secondEnteredPin: [Character] = []
    
    var showUseBiometricScreenClosure: (() -> Void)?
    var proceedWithoutBiometricClosure: (() -> Void)?
    var redoCreatePincodeClosure: (() -> Void)?
    
    // - show prompt for biometric access
    var showBiometricNotAvailableClosure: (() -> Void)?
    var showPromptUseBiometricAccessClosure: (() -> Void)?
    var biometricAccessSuccessClosure: (() -> Void)?
    var biometricAccessFailureClosure: ((Error) -> Void)?
    
    var nextScreenDelegate: ShowNextScreenDelegate?
    private let biometricService = BiometricService()
    private let keychain = KeyChainService()
    
    var isQrEnrolment: Bool?
    
    
    //MARK: - init
    init(enrollmentChallenge: EnrollmentChallenge? = nil, authenticationChallenge: AuthenticationChallenge? = nil, isQrEnrolment: Bool? = nil) {
        self.enrollmentChallenge = enrollmentChallenge
        self.authenticationChallenge = authenticationChallenge
        self.isQrEnrolment = isQrEnrolment
        super.init()
    }
    
    func verifyPinSimilarity() {
        if firstEnteredPin == secondEnteredPin {
            Task {
                await requestTiqrEnroll() { [weak self] success in
                    guard let self else { return }
                    if success {
                        self.showUseBiometricScreenClosure?()
                    }
                }
            }
        } else {
            // failure
            redoCreatePincodeClosure?()
        }
    }
    //MARK: - biometric access related methods
    
    func handleCreatePincodeSucces() {
        if ServiceContainer.sharedInstance().secretService.biometricIDAvailable {
            showUseBiometricScreenClosure?()
        } else {
            proceedWithoutBiometricClosure?()
        }
    }
    
    func pinToString(pinArray: [Character]) -> String {
        return pinArray.map { String($0) }.joined() as String
    }
    
    @objc func promptSetupBiometricAccess() {
        if ServiceContainer.sharedInstance().secretService.biometricIDAvailable {
            showPromptUseBiometricAccessClosure?()
        } else {
            showBiometricNotAvailableClosure?()
        }
    }
    
    //run After the second pin
    @MainActor
    func requestTiqrEnroll(completion: @escaping ((Bool) -> Void)) {
        if enrollmentChallenge == nil {
            Task {
                do{
                    let enrolment = try await TiqrControllerAPI.startEnrollmentWithRequestBuilder()
                        .execute()
                        .body
                    
                    ServiceContainer.sharedInstance().challengeService.startChallenge(fromScanResult: enrolment.url ?? "") { [weak self] type, object, error in
                        guard let self else { return }
                        self.createIdentity(for: object as? EnrollmentChallenge, completion: completion)
                    }
                } catch let error as NSError {
                    assertionFailure(error.description)
                    completion(false)
                }
            }
        } else {
            self.createIdentity(for: self.enrollmentChallenge, completion: completion)
        }
    }
    
    private func createIdentity(for challenge: EnrollmentChallenge?, completion: @escaping ((Bool) -> Void)) {
        if let enrolChallenge = challenge {
            self.secondEnteredPin.removeLast(2)
            ServiceContainer.sharedInstance().challengeService.complete(enrolChallenge, usingBiometricID: false, withPIN: self.pinToString(pinArray: self.secondEnteredPin)) { success, error in
                if success {
                    self.enrollmentChallenge = enrolChallenge
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}

extension CreatePincodeAndBiometricAccessViewModel {
    @objc func requestBiometricAccess() {
        biometricService.useOnDeviceBiometricFeature { [weak self] success, error in
            guard let self else { return }
            if success {
                
                guard let enrolment = self.enrollmentChallenge,
                      let identity = enrolment.identity,
                      let secret = enrolment.identitySecret else { return }
                
                ServiceContainer.sharedInstance()
                    .secretService.setSecret(secret, usingTouchIDforIdentity: identity) { success in
                        if success {
                            identity.usesOldBiometricFlow = NSNumber(false)
                            identity.shouldAskToEnrollInBiometricID = NSNumber(false)
                            identity.biometricIDEnabled = NSNumber(true)
                            identity.biometricIDAvailable = NSNumber(true)
                            if let managedObject = identity.managedObjectContext {
                                do {
                                    try managedObject.save()
                                    self.enrollmentChallenge = nil
                                    self.nextScreenDelegate?.nextScreen(
                                        for: self.isQrEnrolment != nil
                                        ? .registerWithoutRecovery
                                        : .none)
                                } catch let error {
                                    assertionFailure(error.localizedDescription)
                                }
                            }
                        }
                    }
            } else {
                self.handleBiometric(error)
            }
        }
    }
    
    private func handleBiometric(_ error: LAError?) {
        guard let err = error else { return }
        switch err.code {
        case .userCancel, .biometryNotAvailable:
            nextScreenDelegate?.nextScreen(for:
                                            self.isQrEnrolment != nil
                                           ? .registerWithoutRecovery
                                           : .none )
        default:
            break
        }
    }
}
