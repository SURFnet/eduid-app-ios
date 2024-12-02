import UIKit
import TinyConstraints

class CreateEduIDLandingPageViewController: CreateEduIDBaseViewController {
    
    private var stack: AnimatedVStackView!
    private let signInButton = EduIDButton(type: .primary, buttonTitle: L.CreateEduID.LandingPage.SignInButton.localization)
    private let scanQRButton = EduIDButton(type: .primary, buttonTitle: L.CreateEduID.LandingPage.ScanQrButton.localization)
    private let noEduIDYetButton = EduIDButton(type: .naked, buttonTitle:  L.CreateEduID.LandingPage.NoEduIdButton.localization)
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        screenType = .landingScreen
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        stack?.animate(onlyThese: [3, 4, 5])
        screenType.configureNavigationItem(item: navigationItem, target: self, action: #selector(showScanScreen))
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        noEduIDYetButton.isUserInteractionEnabled = true
    }
    
    //MARK: - setupUI
    private func setupUI() {
                
        // - add logo
        let logo = UIImageView(image: .eduIDLogo)
        logo.height(60)
        logo.width(150)
        
        // - add label
        let posterLabel = UILabel.posterTextLabel(text: L.CreateEduID.LandingPage.MainText.localization, size: 24, alignment: .center)
        
        // - add image
        let imageView = UIImageView(image: .landingPageImage)
        imageView.contentMode = .scaleAspectFit
        
        // - space
        let lowerSpaceView = UIView()
        
        // - buttons
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        scanQRButton.addTarget(self, action: #selector(showScanScreen), for: .touchUpInside)
        
        //the action for this button is on CreateEduIDBaseViewController superclass
        noEduIDYetButton.addTarget(self, action: #selector(noEduIdTapped), for: .touchUpInside)
        
        // - create the stackview
        stack = AnimatedVStackView(arrangedSubviews: [logo, posterLabel, imageView, lowerSpaceView, signInButton, scanQRButton])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        view.addSubview(stack)
        stack.edgesToSuperview(insets: .uniform(24), usingSafeArea: true)
        signInButton.width(to: stack, offset: -24)
        scanQRButton.width(to: stack, offset: -24)
        posterLabel.width(to: stack)
        imageView.topToBottom(of: posterLabel, offset: 10)
        imageView.width(to: stack)
        imageView.bottomToTop(of: signInButton, offset: -24)
        
        stack.setCustomSpacing(24, after: signInButton)
        stack.setCustomSpacing(24, after: scanQRButton)
        
        if (Bundle.main.infoDictionary?["EnvironmentSwitcherEnabled"] as? String) == "YES" {
            let envSwitcherButton = EduIDButton(type: .naked, buttonTitle:  L.EnvironmentSwitcher.Button.localization)
            envSwitcherButton.addTarget(self, action: #selector(openEnvironmentSwitcher), for: .touchUpInside)
            let horizontalStack = UIStackView(arrangedSubviews: [noEduIDYetButton, envSwitcherButton])
            horizontalStack.axis = .horizontal
            horizontalStack.distribution = .fillEqually
            stack.addArrangedSubview(horizontalStack)
            horizontalStack.widthToSuperview(offset: -24)
        } else {
            stack.addArrangedSubview(noEduIDYetButton)
            noEduIDYetButton.width(to: stack, offset: -24)
        }
        
        stack.hideAndTriggerAll(onlyThese: [3, 4, 5])
    }
    
    //MARK: - button actions
    @objc func openEnvironmentSwitcher() {
        let switcher = EnvironmentSwitcherController()
        present(switcher, animated: true)
    }
    
    @objc func signInTapped() {
        guard let navigationController else {
            assertionFailure("Navigation controller could not be found!")
            return
        }
        AppAuthController.shared.authorize(navigationController: navigationController, isRegistrationFlow: false)
    }
    
    @objc func noEduIdTapped() {
        guard let navigationController else {
            assertionFailure("Navigation controller could not be found!")
            return
        }
        AppAuthController.shared.authorize(navigationController: navigationController, isRegistrationFlow: true)
    }
}
