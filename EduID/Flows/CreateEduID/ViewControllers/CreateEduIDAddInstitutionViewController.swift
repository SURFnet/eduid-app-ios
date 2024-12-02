import UIKit
import TinyConstraints

class CreateEduIDAddInstitutionViewController: CreateEduIDBaseViewController {
    
    // - view model
    var viewModel: PersonalInfoViewModel

    // - verify button
    let continueButton = EduIDButton(type: .primary, buttonTitle: L.NameUpdated.Continue.localization)
    
    // - views
    let scrollView = UIScrollView()
    private var stack: UIStackView!
    
    //MARK: - init
    init(viewModel: PersonalInfoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.viewController = self
        viewModel.dataAvailableClosure = { [weak self] model in
            self?.setupUI(model: model)
        }
        
        viewModel.dataFetchErrorClosure = { [weak self] eduidError in
            guard let self else { return }
            let alert = UIAlertController(title: eduidError.title, message: eduidError.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: L.PinAndBioMetrics.OKButton.localization, style: .default) { _ in
                alert.dismiss(animated: true) {
                    if eduidError.statusCode == 401 {
                        guard let navigationController = self.navigationController else {
                            assertionFailure("Navigation controller could not be found!")
                            return
                        }
                        AppAuthController.shared.authorize(navigationController: navigationController)
                    } else if eduidError.statusCode == -1 {
                        self.dismiss(animated: true)
                    }
                }
            })
            self.present(alert, animated: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        screenType = .addInstitutionScreen        
        continueButton.addTarget(viewModel, action: #selector(viewModel.createAccount), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func willEnterForeground() {
        viewModel.getData()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - setup UI
    func setupUI(model: PersonalInfoDataCallbackModel) {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.edges(to: view)
        
        // - posterLabel
        let posterLabel = UILabel.posterTextLabelBicolor(text: L.CreateEduID.AddInstitution.MainTitle.localization, size: 24, primary: L.CreateEduID.AddInstitution.MainTitleBoldPart.localization)
        
        // - create the textView
        let textLabelParent = UIView()
        let textLabel = UILabel.plainTextLabelPartlyBold(text: L.CreateEduID.AddInstitution.MainText.localization, partBold: "")
        textLabelParent.addSubview(textLabel)
        textLabel.edges(to: textLabelParent)
        
        // - create the stackview
        stack = UIStackView(arrangedSubviews: [posterLabel, textLabelParent])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 20
        scrollView.addSubview(stack)
        
        if let linkedAccount = model.userResponse.linkedAccounts?.last {
            if let givenName = linkedAccount.givenName {
                let givenNameControl = VerifiedInformationControlCollapsible(
                    title: givenName,
                    subtitle: L.Profile.VerifiedGivenName.localization,
                    model: VerifiedInformationModel(linkedAccount: linkedAccount),
                    manageVerifiedInformationAction: nil,
                    expandable: false
                )
                stack.addArrangedSubview(givenNameControl)
                givenNameControl.widthToSuperview()
            }
            if let familyName = linkedAccount.familyName {
                let familyNameControl = VerifiedInformationControlCollapsible(
                    title: familyName,
                    subtitle: L.Profile.VerifiedFamilyName.localization,
                    model: VerifiedInformationModel(linkedAccount: linkedAccount),
                    manageVerifiedInformationAction: nil,
                    expandable: false
                )
                stack.addArrangedSubview(familyNameControl)
                familyNameControl.widthToSuperview()
            }
        }
        
        
        let spaceView = UIView()
        
        stack.addArrangedSubview(spaceView)
        stack.addArrangedSubview(continueButton)
        
        // - add constraints
        stack.edges(to: scrollView, insets: TinyEdgeInsets(top: 24, left: 24, bottom: 24, right: -24))
        stack.width(to: scrollView, offset: -48)
        textLabel.width(to: stack)
        posterLabel.width(to: stack)
        posterLabel.height(68)
        continueButton.width(to: stack)
    }
}
