import UIKit
import OpenAPIClient
import TiqrCoreObjC

class PersonalInfoCoordinator: CoordinatorType, PersonalInfoViewControllerDelegate {
    
    weak var viewControllerToPresentOn: UIViewController?
    
    weak var delegate: PersonalInfoCoordinatorDelegate?
    weak var navigationController: UINavigationController?
    
    private var didUpdateData = false
    
    //MARK: - init
    required init(viewControllerToPresentOn: UIViewController?) {
        self.viewControllerToPresentOn = viewControllerToPresentOn
    }
    
    func start(refreshDelegate: RefreshChildScreenDelegate ,loadData: Bool, animated: Bool) {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        let editPersonalInfoViewcontroller = PersonalInfoViewController(viewModel: PersonalInfoViewModel(loadData))
        editPersonalInfoViewcontroller.refreshDelegate = refreshDelegate
        editPersonalInfoViewcontroller.delegate = self
        navigationController.isModalInPresentation = false
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(editPersonalInfoViewcontroller, animated: false)
        viewControllerToPresentOn?.present(navigationController, animated: animated)
    }
    
    func personalInfoViewControllerDismissPersonalInfoFlow(viewController: UIViewController) {
        delegate?.personalInfoCoordinatorDismissPersonalInfoFlow(coordinator: self)
    }
    
    func goToEmailEditor(viewController: UIViewController) {
        let emailEditorViewController = EmailEditorViewController(viewModel: EmailEditorViewModel())
        emailEditorViewController.delegate = self
        navigationController!.pushViewController(emailEditorViewController, animated: true)
    }
    
    func showConfirmEmailScreen(viewController: UIViewController, emailToVerify: String?) {
        let checkEmailViewController = CheckEmailViewController()
        checkEmailViewController.emailToCheck = emailToVerify
        checkEmailViewController.subtitleOverride = L.Email.OpenLinkToConfirm(args: emailToVerify ?? "").localization
        checkEmailViewController.delegate = self
        navigationController!.pushViewController(checkEmailViewController, animated: true)
    }
    
    func goBackToInfoScreen(updateData: Bool) {
        navigationController?.popToRootViewController(animated: true)
        self.didUpdateData = updateData
    }
    
    func goToNameUpdated(viewController: UIViewController, linkedAccount: LinkedAccount) {
        self.didUpdateData = true
        let nameUpdatedViewController = NameUpdatedViewController(viewModel: NameUpdatedViewModel(linkedAccount: linkedAccount))
        nameUpdatedViewController.delegate = self
        navigationController!.pushViewController(nameUpdatedViewController, animated: true)
    }
    
    func goToNameEditor(viewController: UIViewController, personalInfo: UserResponse) {
        let nameEditorViewController = NameEditorViewController(viewModel: NameEditorViewModel(personalInfo: personalInfo))
        nameEditorViewController.delegate = self
        navigationController!.pushViewController(nameEditorViewController, animated: true)
    }
    
    func goToMyAccount(viewController: UIViewController, personalInfo: UserResponse) {
        let myAccountViewController = MyAccountViewController(viewModel: MyAccountViewModel(personalInfo: personalInfo))
        myAccountViewController.delegate = self
        navigationController!.pushViewController(myAccountViewController, animated: true)
    }
    
    func goToDeleteAccount(viewController: UIViewController, personalInfo: UserResponse) {
        let deleteAccountViewController = DeleteAccountViewController(viewModel: DeleteAccountViewModel(personalInfo:  personalInfo))
        deleteAccountViewController.delegate = self
        navigationController!.pushViewController(deleteAccountViewController, animated: true)
    }
    
    func goToConfirmDeleteAccount(viewController: UIViewController, personalInfo: UserResponse) {
        let confirmDeleteViewController = ConfirmDeleteViewController(viewModel: ConfirmDeleteViewModel(personalInfo: personalInfo))
        confirmDeleteViewController.delegate = self
        navigationController!.pushViewController(confirmDeleteViewController, animated: true)
    }
    
    func goToYourVerifiedInformationScreen(userResponse: UserResponse) {
        let yourVerifiedInformationViewController = YourVerifiedInformationViewController(viewModel: YourVerifiedInformationViewModel(userResponse: userResponse))
        yourVerifiedInformationViewController.delegate = self
        navigationController!.pushViewController(yourVerifiedInformationViewController, animated: true)
    }
    
    func goToAccountLinkingErrorScreen(linkedAccountEmail: String?) {
        let accountLinkingErrorViewController = AccountLinkingErrorViewController(viewModel: AccountLinkingErrorViewModel(linkedAccountEmail: linkedAccountEmail))
        accountLinkingErrorViewController.delegate = self
        navigationController?.pushViewController(accountLinkingErrorViewController, animated: true)
    }
    
    func goToVerifyYourIdentityScreen(viewController: UIViewController, userResponse: UserResponse) {
        let verifyYourIdentityViewController = VerifyIdentityViewController()
        let viewModel = VerifyIdentityViewModel(userResponse: userResponse)
        verifyYourIdentityViewController.viewModel = viewModel
        verifyYourIdentityViewController.delegate = self
        navigationController?.pushViewController(verifyYourIdentityViewController, animated: true)
    }
    
    func goToSelectYourBankScreen(viewController: UIViewController) {
        let selectYourBankViewController = SelectYourBankViewController()
        selectYourBankViewController.delegate = self
        navigationController?.pushViewController(selectYourBankViewController, animated: true)
    }
    
    func deleteStateAndGoToHome() {
        AppAuthController.shared.clearAuthState()
        navigationController!.dismiss(animated: true)
    }
    
    func shouldUpdateData() -> Bool {
        return self.didUpdateData
    }
    
    @objc
    func goBack(viewController: UIViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func goBackToVerifyIdentityScreen() {
        if let verifyIdentityController = navigationController?.viewControllers.first(where: { $0 is VerifyIdentityViewController }) {
            navigationController?.popToViewController(verifyIdentityController, animated: true)
        } else {
            goBackToInfoScreen(updateData: false)
        }
    }
    
    func goToLinkingSuccessScreen(linkedInstitution: String?, previousUserInfo: UserResponse?) {
        let linkingSuccessViewController = LinkingSuccessViewController()
        linkingSuccessViewController.viewModel = LinkingSuccessViewModel(linkedInstitution: linkedInstitution, previousUserResponse: previousUserInfo)
        linkingSuccessViewController.delegate = self
        navigationController?.pushViewController(linkingSuccessViewController, animated: true)
    }
    
    func goToExternalAccountLinkingErrorScreen() {
        let externalAccountLinkingErrorViewController = ExternalAccountLinkingErrorViewController()
        externalAccountLinkingErrorViewController.delegate = self
        navigationController?.pushViewController(externalAccountLinkingErrorViewController, animated: true)
    }
}

extension PersonalInfoCoordinator: AccountLinkingErrorDelegate {
    func accountLinkingErrorGoBack(viewController: UIViewController) {
        self.goBack(viewController: viewController)
    }
    
    func accountLinkingErrorRetryLinking(viewController: UIViewController) {
        self.goBack(viewController: viewController)
        if let personalInfoVc = navigationController?.topViewController as? PersonalInfoViewController {
            personalInfoVc.addInstitutionClicked()
        }
    }
}
