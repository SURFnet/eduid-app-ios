import UIKit
import TinyConstraints
import Combine

enum RegistrationCheckAlertMode {
    case error, deactivate
}

class CreateEduIDRegistrationCheckViewController: CreateEduIDBaseViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let viewModel: CreateEduIDRegistrationCheckViewModel = .init()
    private var cancellable : Set<AnyCancellable> = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AppAuthController.shared.isLoggedIn() {
            checkForAnyExistingUser()
        } else if AppAuthController.shared.hasPendingAuthFlow {
            AppAuthController.shared.pendingTaskUntilAuthCompletes = { [weak self] _ in
                self?.checkForAnyExistingUser()
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        activityIndicator.stopAnimating()
    }
    
    private func checkForAnyExistingUser() {
        Task {
            await viewModel.checkForAnyExistingUser()
        }
    }
    
    private func setupObservers() {
        viewModel.existingUserPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] snapShot in
                guard let self else { return }
                if let existingUser = snapShot {
                    if existingUser {
                        self.presentAlert(with: L.Security.Tiqr.AlreadyEnrolled.Title.localization,
                                          and: L.Security.Tiqr.AlreadyEnrolled.Description.localization, for: .deactivate)
                    } else {
                        self.showNextScreen()
                        // Exclude this screen from the stack
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                            guard let self, let navigationController else {
                                return
                            }
                            var viewControllers = navigationController.viewControllers
                            if let currentIndex = viewControllers.firstIndex(of: self) {
                                viewControllers.remove(at: currentIndex) // Remove the current view controller
                            }
                            navigationController.setViewControllers(viewControllers, animated: false)
                        }
                    }
                }
            }.store(in: &cancellable)
        
        viewModel.errorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] snapShot in
                if let snapShot {
                    let eduIdError = EduIdError.from(snapShot)
                    self?.presentAlert(with: eduIdError.title, and: eduIdError.message, for: .error)
                }
            }.store(in: &cancellable)
    }
    
    private func setupUI() {
        screenType = .registrationCheck
        
        let label = UILabel.posterTextLabelBicolor(frame: nil, text: L.RegistrationCheck.MainText.localization,
                                                   size: 24, primary: L.RegistrationCheck.HighLight.localization)
        view.addSubview(label)
        view.addSubview(activityIndicator)
        activityIndicator.center(in: view)
        label.top(to: view, offset: 130)
        label.leading(to: view, offset: 24)
        label.trailing(to: view, offset: -24)
    }
    
    private func presentAlert(with title: String, and message: String, for mode: RegistrationCheckAlertMode) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: L.Profile.RemoveServicePrompt.Cancel.localization, style: .cancel) { [weak self] _ in
            if mode == .deactivate {
                UserDefaults.standard.set(OnboardingFlowType.existingUserWithSecret.rawValue,
                                          forKey: OnboardingManager.userdefaultsFlowTypeKey)
                self?.dismiss(animated: true)
            } else {
                alertController.dismiss(animated: true)
            }
        }
        
        let deactivate = UIAlertAction(title: L.Security.Tiqr.Deactivate.localization, style: .destructive) { [weak self] _ in
            Task {
                await self?.viewModel.deactivate()
            }
            let smsVerification = CreateEduIDEnterSMSViewController(viewModel: PinViewModel(), isSecure: false)
            smsVerification.modalPresentationStyle = .fullScreen
            smsVerification.isDeactivationMode = true
            self?.present(smsVerification, animated: true)
        }
        
        switch mode {
        case .deactivate:
            alertController.addAction(deactivate)
            alertController.addAction(cancelAction)
        case .error: alertController.addAction(cancelAction)
        }
        
        present(alertController, animated: true)
    }
}
