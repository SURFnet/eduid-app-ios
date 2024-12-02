import UIKit
import TinyConstraints

class CreateEduIDCreatedViewController: CreateEduIDBaseViewController {

    private let continueButton = EduIDButton(type: .primary, buttonTitle: L.NameUpdated.Continue.localization)
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ScreenType.isQrEnrolment = false
        screenType = .eduIDCreatedScreen
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        continueButton.isUserInteractionEnabled = true
    }
    
    //MARK: - setup ui
    func setupUI() {
        
        //poster label
        let posterParent = UIView()
        let posterLabel = UILabel.posterTextLabel(text: L.CreateEduID.Created.MainTitleLabel.localization)
        posterParent.addSubview(posterLabel)
        posterLabel.edges(to: posterParent)
        
        // text label
        let textParent = UIView()
        let textLabel = UILabel.plainTextLabelPartlyBold(text: L.CreateEduID.Created.MainText.localization, partBold: "")
        textParent.addSubview(textLabel)
        textLabel.edges(to: textParent)
        
        // image
        let imageParent = UIView()
        let imageView = UIImageView(image: .eduIDCreatedImage)
        imageView.contentMode = .scaleAspectFit
        imageParent.addSubview(imageView)
        imageView.center(in: imageParent)
        
        // stack
        let stack = BasicStackView(arrangedSubviews: [posterParent, textParent, imageParent, continueButton])
        view.addSubview(stack)
        
        // constraints
        stack.edgesToSuperview(insets: .uniform(24), usingSafeArea: true)
        imageView.width(to: view)
        imageParent.width(to: stack)
        imageView.width(to: view)
        posterParent.width(to: stack)
        continueButton.width(to: stack, offset: -24)
        
        // actions
        continueButton.addTarget(self, action: #selector(authorize), for: .touchUpInside)
    }
    
    @objc
    func authorize() {
        continueButton.isUserInteractionEnabled = false
        guard let navigationController else {
            assertionFailure("Navigation controller could not be found!")
            return
        }
        AppAuthController.shared.authorize(navigationController: navigationController)
        showNextScreen()
    }

}
