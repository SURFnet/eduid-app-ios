import UIKit

@objc
enum ScreenType: Int, CaseIterable {
    
    static var isQrEnrolment: Bool = false
    
    // home screen
    case homeScreen
    
    // onboarding screens
    case landingScreen
    case explanationScreen
    case enterInfoScreen
    case checkMailScreen
    case enterPhoneScreen
    case enterEmail
    case registrationCheck
    case redirect
    case smsChallengeScreen
    case welcomeScreen
    case createPincodefirstEntryScreen
    case createPincodeSecondEntryScreen
    case firstTimeDialogScreen
    case addInstitutionScreen
    case biometricApprovalScreen
    case eduIDCreatedScreen
    case returnToBrowser
    
    // scan screens
    case scanScreen
    case verifyLoginScreen
    
    // personal info screens
    case personalInfoLandingScreen
    case personalInfoEditEmailScreen
    case personalInfoNameUpdatedScreen
    case personalInfoNameEditorScreen
    case personalInfoYourVerifiedInformationScreen
    case accountLinkingError
    
    case yourAccountScreen
    case deleteAccountScreen
    case confirmDeleteAccountScreen
    case confirmDeleteServiceScreen
    case confirmDeleteTokensScreen
    
    case verifyIdentityScreen
    case selectYourBankScreen
    case linkingSuccessScreen
    case externalAccountLinkingError
    
    // security screens
    case securityOverviewScreen
    case securityEnterEmailScreen
    case securityChangePasswordScreen
    case securityPasswordResetLinkScreen
    case securityTwoFactorKeys
    case securityDeleteKeyConfirmation
    
    // activity screens
    case activityLandingScreen
    
    case confirmScreen
    case pincodeScreen
    case oneTimeCodeScreen
    
    case webView
    
    case none
    
    func nextCreateEduIDScreen() -> ScreenType {
        switch self {
        case .landingScreen:
            return .explanationScreen
        case .explanationScreen:
            return .enterInfoScreen
        case .enterInfoScreen:
            return .checkMailScreen
        case .checkMailScreen:
            return .eduIDCreatedScreen
        case .redirect:
            return .registrationCheck
        case .eduIDCreatedScreen, .registrationCheck:
            return .createPincodefirstEntryScreen
        case .createPincodefirstEntryScreen:
            return .createPincodeSecondEntryScreen
        case .createPincodeSecondEntryScreen:
            return .biometricApprovalScreen
        case .biometricApprovalScreen:
            if ScreenType.isQrEnrolment {
                return .welcomeScreen
            } else if AppAuthController.shared.isLoggedIn() {
                return .enterPhoneScreen
            } else {
                return .returnToBrowser
            }
        case .enterPhoneScreen:
            return .smsChallengeScreen
        case .smsChallengeScreen:
            return .welcomeScreen
        case .welcomeScreen:
            if AppAuthController.shared.isLoggedIn() {
                return .firstTimeDialogScreen
            } else {
                return .none
            }
        case .firstTimeDialogScreen:
            return .addInstitutionScreen
        default:
            return .none
        }
    }
    
    func viewController() -> UIViewController? {
        switch self {
        case .landingScreen:
            return CreateEduIDLandingPageViewController()
        case .explanationScreen:
            return CreateEduIDExplanationViewController()
        case .enterInfoScreen:
            return CreateEduIDEnterPersonalInfoViewController(viewModel: CreateEduIDEnterPersonalInfoViewModel())
        case .checkMailScreen:
            return CheckEmailViewController()
        case .registrationCheck:
            return CreateEduIDRegistrationCheckViewController()
        case .enterPhoneScreen:
            return CreateEduIDEnterPhoneNumberViewController(viewModel: CreateEduIDEnterPhoneNumberViewModel())
        case .smsChallengeScreen:
            return CreateEduIDEnterSMSViewController(viewModel: PinViewModel(), isSecure: false)
        case .welcomeScreen:
            return CreateEduIDWelcomeViewController()
        case .addInstitutionScreen:
            return CreateEduIDAddInstitutionViewController(viewModel: PersonalInfoViewModel(true))
        case .homeScreen:
            return HomeViewController()
        case .scanScreen:
            return ScanViewController(viewModel: ScanViewModel())
        case .personalInfoLandingScreen:
            return PersonalInfoViewController(viewModel: PersonalInfoViewModel(false))
        case .personalInfoEditEmailScreen:
            return EmailEditorViewController(viewModel: EmailEditorViewModel())
        case .firstTimeDialogScreen:
            return CreateEduIDFirstTimeDialogViewController(viewModel: CreateEduIDFirstTimeDialogViewViewModel())
        case .securityOverviewScreen:
            return SecurityOverviewViewController(viewModel: SecurityOverviewViewModel())
        case .createPincodefirstEntryScreen:
            return CreatePincodeFirstEntryViewController(viewModel: CreatePincodeAndBiometricAccessViewModel())
        case.createPincodeSecondEntryScreen:
            return CreatePincodeSecondEntryViewController(viewModel: CreatePincodeAndBiometricAccessViewModel())
        case .eduIDCreatedScreen:
            return CreateEduIDCreatedViewController()
        case .returnToBrowser:
            return CreateReturnToBrowserViewController()
            
        default:
            return nil
        }
    }
    
    func configureNavigationItem(item: UINavigationItem, target: Any? = nil, action: Selector? = nil, secondaryAction: Selector? = nil) {
        switch self {
            // logo and cross to dismiss
        case .personalInfoLandingScreen, .securityOverviewScreen, .activityLandingScreen:
            addLogoTo(item: item)
            item.hidesBackButton = true
            item.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: target, action: action)
            item.rightBarButtonItem?.tintColor = .backgroundColor
        
            // logo and white back arrow
        case .scanScreen:
            addLogoTo(item: item)
            item.hidesBackButton = true
            item.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: target, action: action)
            item.rightBarButtonItem?.tintColor = .white
            
            // Just logo, no back button
        case .homeScreen, .confirmScreen, .verifyLoginScreen, .createPincodefirstEntryScreen,
                .createPincodeSecondEntryScreen,.biometricApprovalScreen,
                .firstTimeDialogScreen, .eduIDCreatedScreen, .registrationCheck,
                .enterPhoneScreen, .addInstitutionScreen, .welcomeScreen, .returnToBrowser,
                .externalAccountLinkingError:
            addLogoTo(item: item)
            item.hidesBackButton = true
            
            // Back button with logo
        default:
            addLogoTo(item: item)
            item.hidesBackButton = true
            item.leftBarButtonItem = UIBarButtonItem(image: UIImage.arrowBack, style: .plain, target: target, action: action)
            item.leftBarButtonItem?.tintColor = .backgroundColor
        }
    }
    
    func addLogoTo(item: UINavigationItem) {
        let logo = UIImageView(image: .eduIDLogo)
        logo.width(92)
        logo.height(36)
        item.titleView = logo
    }
}
