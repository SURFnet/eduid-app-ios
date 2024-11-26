//
//  LinkingSuccessViewController.swift
//  eduID
//
//  Created by Dániel Zolnai on 2024. 10. 10..
//
import OpenAPIClient
import UIKit
import TinyConstraints

class LinkingSuccessViewController: BaseViewController {
    
    var delegate: PersonalInfoViewControllerDelegate?
    
    var viewModel: LinkingSuccessViewModel!
    
    private var buttonStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenType = .linkingSuccessScreen
        setupUI(viewModel.userResponse)
        viewModel.dataHandler = { [weak self] result in
            if case .success(let userResponse) = result {
                self?.setupUI(userResponse)
            } else if case .failure(let error) = result {
                self?.handleError(error)
                self?.setButtonsLoading(false)
            }
        }
        viewModel.linkingSuccessHandler = { [weak self] in
            self?.delegate?.goBackToInfoScreen(updateData: true)
        }
        viewModel.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screenType.configureNavigationItem(item: navigationItem, target: self, action: #selector(dismissInfoScreen))
    }
    
    private func handleError(_ error: Error) {
        let errorTitle = (error as? EduIdError)?.title ?? error.localizedFromApi
        let errorMessage = (error as? EduIdError)?.message ?? error.localizedDescription
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L.PinAndBioMetrics.OKButton.localization, style: .default) { _ in
            alert.dismiss(animated: true) {
                self.dismiss(animated: true)
            }
        })
        self.present(alert, animated: true)
      }
    
    func setupUI(_ userResponse: UserResponse?) {
        // Remove any previous views
        view.subviews.forEach {
            $0.removeFromSuperview()
        }
        // - scroll view
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .always
        view.addSubview(scrollView)
        scrollView.edgesToSuperview()

        // - Main title
        let mainTitle = UILabel.posterTextLabelBicolor(
            text: L.LinkingSuccess.Title.localization,
            size: 24,
            primary: L.LinkingSuccess.Title.localization
        )
        
        // - Description below title
        let mainDescriptionParent = UIView()
        let mainDescription = UILabel.subtitleLabel(text: L.LinkingSuccess.Subtitle.localization)
        mainDescriptionParent.addSubview(mainDescription)
        mainDescription.edges(to: mainDescriptionParent)
        
        let spacerTop = UIView()
        spacerTop.height(4)
        
        // - create the stackview
        let stack = UIStackView(arrangedSubviews: [mainTitle, mainDescriptionParent, spacerTop])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 24
        scrollView.addSubview(stack)
        
        buttonStack = UIStackView()
        view.addSubview(buttonStack)
        buttonStack.widthToSuperview(offset: -48)
        buttonStack.centerXToSuperview()
        buttonStack.spacing = 24
        buttonStack.bottomToSuperview(usingSafeArea: true)
        
        stack.edges(to: scrollView, excluding: .bottom, insets: TinyEdgeInsets(top: 24, left: 0, bottom: 0, right: 0))
        stack.bottomToTop(of: buttonStack)
        stack.width(to: scrollView, offset: 0)
        stack.setCustomSpacing(4, after: mainDescriptionParent)
        
        mainTitle.widthToSuperview(offset: -48)
        mainDescriptionParent.widthToSuperview(offset: -48)
        spacerTop.widthToSuperview(offset: -48)
        
        
        if let userResponse {
            let addedAccount = viewModel.getAddedAccount()
            let isFirstLinkedAccount = (userResponse.linkedAccounts?.count ?? 0) + (userResponse.externalLinkedAccounts?.count ?? 0) < 2
            buttonStack.axis = .vertical
            if let addedAccount {
                if !addedAccount.isExternal {
                    let role: String
                    let affiliation = addedAccount.eduPersonAffiliations?.first ?? ""
                    if affiliation.contains("@") {
                        role = affiliation.components(separatedBy: "@")[0]
                    } else {
                        role = affiliation
                    }
                    let leftIcon: VerifiedInformationControlCollapsible.LeftIconType
                    if let id = addedAccount.id, let logoUrl = URL(string: Constants.Urls.OrganizationLogo + id) {
                        leftIcon = VerifiedInformationControlCollapsible.LeftIconType.url(logoUrl)
                    } else {
                        let defaultImage = UIImage.defaultInstitution.withRenderingMode(.alwaysTemplate)
                        leftIcon = VerifiedInformationControlCollapsible.LeftIconType.image(defaultImage, UIColor.backgroundColor)
                    }
                    let control = VerifiedInformationControlCollapsible(
                        title: addedAccount.providerName,
                        subtitle: role.capitalized,
                        model: addedAccount,
                        manageVerifiedInformationAction: nil,
                        expandable: false,
                        leftIcon: leftIcon,
                        rightIcon: nil
                    )
                    stack.addArrangedSubview(control)
                    control.widthToSuperview(offset: -48)
                    
                    if !isFirstLinkedAccount {
                        // Add divider
                        let divider = UIView()
                        divider.backgroundColor = .dividerColor
                        stack.addArrangedSubview(divider)
                        divider.height(1)
                        divider.widthToSuperview(offset: -48)
                        
                        let questionSubtitle = UILabel.subtitleLabel(text: L.LinkingSuccess.SubtitlePreferInstitution.localization)
                        stack.addArrangedSubview(questionSubtitle)
                        questionSubtitle.widthToSuperview(offset: -48)
                    }
                }
                if let verifiedFirstname = addedAccount.givenName {
                    let control = VerifiedInformationControlCollapsible(
                        title: verifiedFirstname,
                        subtitle: L.Profile.VerifiedGivenName.localization,
                        model: addedAccount,
                        manageVerifiedInformationAction: nil,
                        expandable: false,
                        rightIcon: nil
                    )
                    stack.addArrangedSubview(control)
                    control.widthToSuperview(offset: -48)
                }
                if let verifiedFamilyName = addedAccount.familyName {
                    let control = VerifiedInformationControlCollapsible(
                        title: verifiedFamilyName,
                        subtitle: L.Profile.VerifiedFamilyName.localization,
                        model: addedAccount,
                        manageVerifiedInformationAction: nil,
                        expandable: false,
                        rightIcon: nil
                    )
                    stack.addArrangedSubview(control)
                    control.widthToSuperview(offset: -48)
                }
                if let dateOfBirth = addedAccount.dateOfBirth {
                    let birthdayDate = Date(timeIntervalSince1970: TimeInterval(integerLiteral: dateOfBirth / 1000))
                    let birthdayString = VerifiedInformationControlCollapsible.dateFormatter.string(from: birthdayDate)
                    let control = VerifiedInformationControlCollapsible(
                        title: birthdayString,
                        subtitle: L.Profile.VerifiedDateOfBirth.localization,
                        model: addedAccount,
                        manageVerifiedInformationAction: nil,
                        expandable: false,
                        rightIcon: nil
                    )
                    stack.addArrangedSubview(control)
                    control.widthToSuperview(offset: -48)
                }
            }
            if isFirstLinkedAccount || addedAccount == nil {
                let continueButton = EduIDButton(type: .primary, buttonTitle: L.LinkingSuccess.Button.Continue.localization)
                buttonStack.addArrangedSubview(continueButton)
                continueButton.addTarget(self, action: #selector(dismissInfoScreen), for: .touchUpInside)
            } else {
                let yesButton = EduIDButton(type: .primary, buttonTitle: L.LinkingSuccess.Button.YesPlease.localization)
                buttonStack.addArrangedSubview(yesButton)
                yesButton.addTarget(self, action: #selector(preferLinkedInstitution), for: .touchUpInside)
                
                let noButton = EduIDButton(type: .naked, buttonTitle: L.LinkingSuccess.Button.NoThanks.localization)
                buttonStack.addArrangedSubview(noButton)
                noButton.addTarget(self, action: #selector(dismissInfoScreen), for: .touchUpInside)
            }
        } else {
            let loadingIndicator = UIActivityIndicatorView()
            stack.addArrangedSubview(loadingIndicator)
            loadingIndicator.height(80)
            loadingIndicator.widthToSuperview()
            loadingIndicator.startAnimating()
        }
        
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stack.addArrangedSubview(spacer)
    }
    
    func setButtonsLoading(_ isLoading: Bool) {
        buttonStack.arrangedSubviews.forEach {
            $0.isUserInteractionEnabled = !isLoading
            $0.alpha = isLoading ? 0.2 : 1
        }
    }
    
    @objc func preferLinkedInstitution() {
        setButtonsLoading(true)
        viewModel.preferLinkedInstitution()
    }
    
    @objc func dismissInfoScreen() {
        self.delegate?.goBackToInfoScreen(updateData: true)
    }
}
    
    
