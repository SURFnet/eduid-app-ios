//
//  VerifyIdentityViewController.swift
//  eduID
//
//  Created by Dániel Zolnai on 30/09/2024.
//
import UIKit
import TinyConstraints

class VerifyIdentityViewController: BaseViewController {
        
    private var stack: UIStackView!
    
    private var moreOptionsExpanded = false
    
    private var viewModel = VerifyIdentityViewModel()
    
    var delegate: PersonalInfoViewControllerDelegate?
    
    //MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenType = .verifyIdentityScreen
        
        view.backgroundColor = .white
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screenType.configureNavigationItem(item: navigationItem, target: self, action: #selector(dismissInfoScreen))
    }
    
    //MARK: - setup UI
    func setupUI() {
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
        let firstLine = L.VerifyIdentity.Title.FirstLine.localization
        let secondLine = L.VerifyIdentity.Title.SecondLine.localization
        let fullTitle = "\(firstLine)\n\(secondLine)"
        let mainTitle = UILabel.posterTextLabelBicolor(text: fullTitle, size: 24, primary:  firstLine)
        
        // - Description below title
        let mainDescriptionParent = UIView()
        let mainDescription = UILabel.subtitleLabel(text: L.VerifyIdentity.Subtitle.localization)
        mainDescriptionParent.addSubview(mainDescription)
        mainDescription.edges(to: mainDescriptionParent)
        
        // Verify via dutch institution
        let verifyViaDutchInstitution = VerifyIdentityControl(
            title: L.VerifyIdentity.VerifyViaDutchInstitution.Title.localization,
            icon: .verifyIdentityInstitution,
            buttonTitle: L.VerifyIdentity.VerifyViaDutchInstitution.Button.localization,
            buttonIcon: nil,
            buttonDelegate: { [weak self] control in
                self?.viewModel.startLinkingInstitution(control)
            })
        
        
        // - create the stackview
        stack = UIStackView(arrangedSubviews: [mainTitle, mainDescriptionParent, verifyViaDutchInstitution])
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
        verifyViaDutchInstitution.widthToSuperview(offset: -48)
        
        if moreOptionsExpanded {
            // Verify with banking app
            let verifyWithBankingApp = VerifyIdentityControl(
                title: L.VerifyIdentity.VerifyWithBankingApp.Title.localization,
                icon: .verifyIdentityBankingApp,
                buttonTitle: L.VerifyIdentity.VerifyWithBankingApp.Button.localization,
                buttonIcon: .verifyButtonIdin,
                buttonDelegate: { [weak self] _ in
                    guard let self else {
                        return
                    }
                    self.delegate?.goToSelectYourBankScreen(viewController: self)
                    
                })
            // Verify via EU ID
            let verifyWithEuId = VerifyIdentityControl(
                title: L.VerifyIdentity.VerifyWithAEuropianId.Title.localization,
                icon: .verifyIdentityEuId,
                buttonTitle: L.VerifyIdentity.VerifyWithAEuropianId.Button.localization,
                buttonIcon: .verifyButtonEidas,
                buttonDelegate: { [weak self] control in
                    guard let self else {
                        return
                    }
                    self.viewModel.openEidasLink(control)
                })
            
            // Support link
            let supportLabel = UILabel()
            supportLabel.numberOfLines = 0
            let supportString = NSMutableAttributedString(
                string: L.VerifyIdentity.VisitSupport.Full.localization,
                attributes: [
                    .foregroundColor: UIColor.grayGhost,
                    .font: UIFont.sourceSansProRegular(size: 16)
                ])
            supportString.setAttributes([
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: UIFont.sourceSansProRegular(size: 16),
                .foregroundColor: UIColor.backgroundColor
            ], range: supportString.nsRange(of: L.VerifyIdentity.VisitSupport.HighlightedPart.localization)!)
            supportLabel.attributedText = supportString
            supportLabel.isUserInteractionEnabled = true
            supportLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onVisitSupportTapped)))
            
            stack.addArrangedSubview(verifyWithBankingApp)
            stack.addArrangedSubview(verifyWithEuId)
            stack.addArrangedSubview(supportLabel)
            verifyWithBankingApp.widthToSuperview(offset: -48)
            verifyWithEuId.widthToSuperview(offset: -48)
            supportLabel.widthToSuperview(offset: -48)
        } else {
            let moreOptionsButton = EduIDButton(type: .ghost, buttonTitle: L.VerifyIdentity.OtherOptions.localization)
            moreOptionsButton.addTarget(self, action: #selector(expandMoreOptions), for: .touchUpInside)
            stack.addArrangedSubview(moreOptionsButton)
            moreOptionsButton.widthToSuperview(offset: -48)
        }

    }
    
    @objc func expandMoreOptions() {
        moreOptionsExpanded = true
        setupUI()
    }
    
    @objc func dismissInfoScreen() {
        delegate?.goBack(viewController: self)
    }
    
    @objc func onVisitSupportTapped() {
        if let supportUrl = URL(string: L.VerifyIdentity.VisitSupport.Link.localization) {
            UIApplication.shared.open(supportUrl)
        }
    }
}
