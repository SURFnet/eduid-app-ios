import UIKit
import TinyConstraints
import OpenAPIClient

class ActivityViewController: BaseViewController {
    
    let viewModel: ActivityViewModel
    
    weak var delegate: ActivityViewControllerDelegate?
    weak var refreshDelegate: RefreshChildScreenDelegate?

    //MARK: - init
    init(viewModel: ActivityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
                        self.dismiss(animated: false)
                        self.refreshDelegate?.requestScreenRefresh(for: .activity)
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
        screenType = .activityLandingScreen
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func willEnterForeground() {
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if delegate?.shouldUpdate() == true {
            self.setupUI(model: nil)
            delegate?.didUpdate()
            viewModel.getData()
        }
        viewModel.dataAvailableClosure = { [weak self] model in
            self?.setupUI(model: model)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - setup UI
    func setupUI(model: PersonalInfoDataCallbackModel?) {
        view.subviews.forEach { $0.removeFromSuperview() }

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .always
        view.addSubview(scrollView)
        scrollView.edges(to: view)
        
        let posterParent = UIView()
        let posterLabel = UILabel.posterTextLabelBicolor(text: L.DataActivity.Title.localization, primary: L.DataActivity.Title.localization)
        posterParent.addSubview(posterLabel)
        posterLabel.edges(to: posterParent)
        
        let description = UILabel.plainTextLabelPartlyBold(text: L.DataActivity.Info.localization, partBold: "")
        
        let infoImageView = UIImageView(image: .info)
        infoImageView.contentMode = .scaleAspectFit
        infoImageView.size(CGSize(width: 24, height:  36))
        
        let infoExplanation = UILabel()
        infoExplanation.numberOfLines = 0
        infoExplanation.attributedText = NSAttributedString(
            string: L.DataActivity.ExplainIcon.localization,
            attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 15), color: .charcoalColor, lineSpacing: 6)
        )
        let infoExplanationContainer = UIStackView(arrangedSubviews: [infoImageView, infoExplanation])
        infoExplanationContainer.axis = .horizontal
        infoExplanationContainer.spacing = 11
        infoExplanationContainer.distribution = .fill
        infoExplanationContainer.alignment = .top
        
        let separator = UIView()
        separator.backgroundColor = .lightGray
        separator.height(1)
        
        let stack = AnimatedVStackView(arrangedSubviews: [posterParent, description, infoExplanationContainer, separator])
        
        if let model = model {
            var addedKeysCount = 0
            if let keys = model.userResponse.eduIdPerServiceProvider?.keys {
                for key in keys {
                    if let eduID = model.userResponse.eduIdPerServiceProvider?[key] {
                        let serviceRelatedTokens = model.tokensResponse.filter({ $0.clientId == eduID.serviceProviderEntityId })
                        let firstToken = serviceRelatedTokens.first(where: { $0.type == .refresh}) ?? serviceRelatedTokens.first(where: { $0.type == .access })
                        let tokens: [Token] = firstToken == nil ? [] : [firstToken!]
                        let control = ActivityControlCollapsible(
                            logoImageURL: eduID.serviceLogoUrl ?? "",
                            institutionTitle: eduID.serviceName ?? "",
                            date: Date(timeIntervalSince1970: Double((eduID.createdAt ?? 0) / 1000)),
                            uniqueId: eduID.serviceInstutionGuid ?? eduID.value ?? "",
                            accessTokens: tokens,
                            removeDetailsButtonAction: { [weak self] in
                                self?.delegate?.goToDeleteService(service: eduID)
                            },
                            revokeTokenButtonAction: { [weak self] token in
                                self?.delegate?.goToDeleteTokens(serviceName: eduID.serviceName ?? "eduID", tokensToDelete: serviceRelatedTokens)
                            }
                        )
                        addedKeysCount += 1
                        stack.addArrangedSubview(control)
                        control.widthToSuperview(offset: -48)
                    }
                }
            }
            if addedKeysCount == 0 {
                let noServicesLabel = UILabel.plainTextLabelPartlyBold(
                    text: L.DataActivity.NoServices.localization,
                    partBold: ""
                )
                stack.addArrangedSubview(noServicesLabel)
                noServicesLabel.textAlignment = .center
                noServicesLabel.height(160)
                noServicesLabel.widthToSuperview(offset: -48)
            }
        } else {
            let loadingIndicator = UIActivityIndicatorView()
            loadingIndicator.height(80)
            stack.addArrangedSubview(loadingIndicator)
            loadingIndicator.widthToSuperview()
            loadingIndicator.startAnimating()
        }
        stack.spacing = 16
        stack.setCustomSpacing(24, after: description)
        stack.setCustomSpacing(22, after: separator)
        stack.alignment = .center
        
        // - constraints
        scrollView.addSubview(stack)
        stack.edges(to: scrollView, insets: .vertical(24))
        stack.width(to: scrollView)
        posterParent.widthToSuperview(offset: -48)
        description.widthToSuperview(offset: -48)
        infoExplanationContainer.widthToSuperview(offset: -48)
        separator.widthToSuperview(offset: -48)
    }
    
    @objc
    func dismissActivityScreen() {
        delegate?.activityViewControllerDismissActivityFlow(viewController: self)
    }
    
    override func goBack() {
        delegate?.activityViewControllerDismissActivityFlow(viewController: self)
    }
}
