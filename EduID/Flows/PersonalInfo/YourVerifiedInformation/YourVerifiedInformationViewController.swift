//
//  YourVerifiedInformationViewController.swift
//  eduID
//
//  Created by Dániel Zolnai on 11/04/2024.
//
import UIKit
import TinyConstraints
import OpenAPIClient

class YourVerifiedInformationViewController: UIViewController, ScreenWithScreenType {
    
    // - screen type
    var screenType: ScreenType = .personalInfoYourVerifiedInformationScreen
    
    // - delegate
    weak var delegate: PersonalInfoViewControllerDelegate?
    
    private var viewModel: YourVerifiedInformationViewModel
    
    private var stack: UIStackView!
    
    private var accountToRemove: VerifiedInformationModel?
    
    //MARK: - init
    init(viewModel: YourVerifiedInformationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI(userResponse: viewModel.userResponse)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screenType.configureNavigationItem(item: navigationItem, target: self, action: #selector(dismissInfoScreen))
    }
    
    //MARK: - setup UI
    func setupUI(userResponse: UserResponse?) {
        // Try to remember scroll position
        var previousScrollPosition: CGFloat = 0
        // Remove any previous views
        view.subviews.forEach {
            if let scrollView = $0 as? UIScrollView {
                previousScrollPosition = scrollView.contentOffset.y
            }
            $0.removeFromSuperview()
        }
        // - scroll view
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .always
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()

        // - Main title
        let mainTitle = UILabel.posterTextLabelBicolor(text: L.YourVerifiedInformation.Title.localization, size: 24, primary:  L.Profile.Title.localization)
        
        // - Description below title
        let mainDescriptionParent = UIView()
        let mainDescription = UILabel.plainTextLabelPartlyBold(text: L.YourVerifiedInformation.Subtitle.localization, partBold: "")
        mainDescriptionParent.addSubview(mainDescription)
        mainDescription.edges(to: mainDescriptionParent)
        
        let walletImageView = UIImageView(image: .wallet)
        walletImageView.size(CGSize(width: 16, height:  16))
        
        let walletExplanation = UILabel()
        walletExplanation.numberOfLines = 0
        walletExplanation.attributedText = NSAttributedString(
            string: L.YourVerifiedInformation.ExplainIcon.localization,
            attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 15), color: .charcoalColor, lineSpacing: 6)
        )
        let walletExplanationContainer = UIStackView(arrangedSubviews: [walletImageView, walletExplanation])
        walletExplanationContainer.axis = .horizontal
        walletExplanationContainer.spacing = 11
        walletExplanationContainer.distribution = .fill
        walletExplanationContainer.alignment = .top
        
        
        // - create the stackview
        stack = UIStackView(arrangedSubviews: [mainTitle, mainDescriptionParent, walletExplanationContainer])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 20
        scrollView.addSubview(stack)
        
        stack.edges(to: scrollView, insets: TinyEdgeInsets(top: 24, left: 0, bottom: 240, right: 0))
        stack.width(to: scrollView, offset: 0)
        
        mainTitle.widthToSuperview(offset: -48)
        mainDescriptionParent.widthToSuperview(offset: -48)
        walletExplanationContainer.widthToSuperview(offset: -48)
        
        let selectedGivenName = userResponse?.givenName
        let selectedFamilyName = userResponse?.familyName
        
        // From institution header
        for linkedAccount in (userResponse?.getAllModels() ?? []) {
            let separator = UIView()
            separator.backgroundColor = .lightGray
            separator.height(1)
            let institutionContainer = UIView()
            let institutionHeader = UILabel()
            let institutionString = NSAttributedString(
                string: L.YourVerifiedInformation.FromInstitution(args: linkedAccount.providerName).localization,
                attributes: AttributedStringHelper.attributes(
                    font: UIFont.nunitoBold(size: 18),
                    color: .primaryColor,
                    lineSpacing: 10)
            )
            institutionHeader.attributedText = institutionString
            institutionContainer.addSubview(institutionHeader)
            institutionHeader.edgesToSuperview()
            
            
            let verifiedByLabel = UILabel()
            verifiedByLabel.numberOfLines = 0
            let verifiedByString = NSMutableAttributedString()
            if let createdAt = linkedAccount.createdAt {
                verifiedByString.append(NSAttributedString(
                    string: L.YourVerifiedInformation.ReceivedOn.localization,
                    attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 6)
                ))
                let createdAtDate = Date(timeIntervalSince1970: TimeInterval(createdAt / 1000))
                verifiedByString.append(NSAttributedString(
                    string: VerifiedInformationControlCollapsible.dateFormatter.string(from: createdAtDate) + "\n",
                    attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 6)
                ))
            }
            if let expiresAt = linkedAccount.expiresAt {
                let expiresAtDate = Date(timeIntervalSince1970: TimeInterval(expiresAt / 1000))
                verifiedByString.append(NSAttributedString(
                    string: L.YourVerifiedInformation.ValidUntil.localization,
                    attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 6)
                ))
                verifiedByString.append(NSAttributedString(
                    string: VerifiedInformationControlCollapsible.dateFormatter.string(from: expiresAtDate),
                    attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 6)
                ))
            }
            verifiedByLabel.attributedText = verifiedByString
            stack.addArrangedSubview(separator)
            stack.addArrangedSubview(institutionContainer)
            stack.addArrangedSubview(verifiedByLabel)
            // Given name
            if let givenName = linkedAccount.givenName {
                let verifiedFirstNameControl = VerifiedInformationControlCollapsible(
                    title: givenName,
                    subtitle: L.Profile.VerifiedGivenName.localization,
                    model: linkedAccount,
                    manageVerifiedInformationAction: nil,
                    expandable: false,
                    rightIcon: givenName == selectedGivenName ? .wallet : nil
                )
                stack.addArrangedSubview(verifiedFirstNameControl)
                verifiedFirstNameControl.widthToSuperview(offset: -48)
            }
            // Family name
            if let familyName = linkedAccount.familyName {
                let verifiedFamilyNameControl = VerifiedInformationControlCollapsible(
                    title: familyName,
                    subtitle: L.Profile.VerifiedFamilyName.localization,
                    model: linkedAccount,
                    manageVerifiedInformationAction: nil,
                    expandable: false,
                    rightIcon: familyName == selectedFamilyName ? .wallet : nil
                )
                stack.addArrangedSubview(verifiedFamilyNameControl)
                verifiedFamilyNameControl.widthToSuperview(offset: -48)
            }
            // Affiliations
            for affiliation in linkedAccount.eduPersonAffiliations ?? [] {
                let role: String
                if affiliation.contains("@") {
                    role = affiliation.components(separatedBy: "@")[0]
                } else {
                    role = affiliation
                }
                let iconEmoji = role.lowercased() == L.Profile.Employee.localization ? "🏢️" : "🧑‍🎓"
                let subtitle = L.YourVerifiedInformation.AtInstitution(args: linkedAccount.providerName).localization
                let affiliationControl = VerifiedInformationControlCollapsible(
                    title: role.capitalized,
                    subtitle: subtitle,
                    model: linkedAccount,
                    manageVerifiedInformationAction: nil,
                    expandable: false,
                    leftIcon: VerifiedInformationControlCollapsible.LeftIconType.emoji(iconEmoji),
                    rightIcon: .wallet
                )
                stack.addArrangedSubview(affiliationControl)
                affiliationControl.widthToSuperview(offset: -48)
            }
            
            let removeLinkedAccountContainer = UIView()
            
            let removeIcon = UIImageView(image: .bin)
            removeIcon.size(CGSize(width: 16, height: 16))
            removeLinkedAccountContainer.addSubview(removeIcon)
            removeIcon.centerYToSuperview()
            removeIcon.leftToSuperview()
            
            let removeLink = UIButton()
            let clickableTitle = NSMutableAttributedString()
            clickableTitle.append(NSAttributedString(
                string: L.YourVerifiedInformation.RemoveThisInformation.localization,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProSemiBold(size: 12), color: .backgroundColor, lineSpacing: 6, underline: true)
            ))
            clickableTitle.append(NSAttributedString(
                string: L.YourVerifiedInformation.FromYourEduID.localization,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 6)
            ))
            removeLink.setAttributedTitle(clickableTitle, for: .normal)
            removeLink.tag = (viewModel.userResponse.getAllModels().firstIndex(of: linkedAccount))!
            removeLinkedAccountContainer.addSubview(removeLink)
            removeLink.leftToRight(of: removeIcon, offset: 13)
            removeLink.centerYToSuperview()
            removeLink.heightToSuperview()
            
            stack.addArrangedSubview(removeLinkedAccountContainer)
            removeLink.addTarget(self, action: #selector(removeLinkedAccount(sender:)), for: .touchUpInside)
            
            verifiedByLabel.widthToSuperview(offset: -48)
            separator.widthToSuperview(offset: -48)
            institutionContainer.widthToSuperview(offset: -48)
            removeLinkedAccountContainer.widthToSuperview(offset: -48)
            stack.setCustomSpacing(0, after: institutionContainer)
        }
        
        if previousScrollPosition > 0 {
            DispatchQueue.main.async { [weak scrollView] in
                scrollView?.setContentOffset(CGPoint(x: 0, y: previousScrollPosition), animated: false)
            }
        }
    }
    
    @objc func removeLinkedAccount(sender: Any) {
        let index = (sender as! UIButton).tag
        accountToRemove = viewModel.userResponse.getAllModels()[index]
        // - alert to confirm service removal
        let alert = RemovalConfirmationDialogViewController()
        alert.delegate = self
        navigationController?.present(alert, animated: true)
    }
    
    @objc func dismissInfoScreen() {
        delegate?.goBack(viewController: self)
    }
}

extension YourVerifiedInformationViewController: RemovalConfirmationDialogViewControllerDelegate {
    func onConfirm() {
        guard let accountToRemove else {
            assertionFailure("Could not find account to remove!")
            return
        }
    
        viewModel.removeLinkedAccount(
            request: accountToRemove.updateRequest,
            onRemoved: { [weak self] in
                guard let self else {
                    return
                }
                self.delegate?.goBack(viewController: self)
            },
            onError: { [weak self] error in
                guard let self else {
                    return
                }
                let alert = UIAlertController(
                    title: L.Generic.RequestError.Title.localization,
                    message: L.Generic.RequestError.Description(args: error.localizedFromApi).localization,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: L.Generic.RequestError.CloseButton.localization, style: .default) { _ in
                    alert.dismiss(animated: true)
                })
                self.present(alert, animated: true)
            }
        )
        self.accountToRemove = nil
    }
    
    func onCancel() {
        accountToRemove = nil
    }
    
    func dismiss(viewController: UIViewController) {
        self.navigationController?.dismiss(animated: true)
    }
}
