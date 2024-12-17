//
//  SelectYourBankViewController.swift
//  eduID
//
//  Created by Dániel Zolnai on 30/09/2024.
//
import UIKit
import TinyConstraints
import OpenAPIClient

class SelectYourBankViewController: BaseViewController {
    
    var delegate: PersonalInfoViewControllerDelegate?
    
    var viewModel = SelectYourBankViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenType = .selectYourBankScreen
        setupUI(issuers: viewModel.issuers)
        viewModel.dataHandler = { [weak self] result in
            guard let self else { return }
            if let data = try? result.get() {
                self.setupUI(issuers: try! result.get())
                return
            }
            _ = result.inspectError { error in
                self.handleError(error)
            }
        }
        viewModel.urlHandler = { [weak self] url in
            guard let delegate = self?.delegate else { return }
            delegate.openInWebView(url)
        }
        viewModel.fetchIssuerList()
    }
    
    private func handleError(_ error: Error) {
        let errorTitle = (error as? SelectYourBankError)?.title ?? error.localizedFromApi
        let errorMessage = (error as? SelectYourBankError)?.message ?? error.localizedDescription
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L.PinAndBioMetrics.OKButton.localization, style: .default) { _ in
            alert.dismiss(animated: true) {
                self.dismiss(animated: true)
            }
        })
        self.present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        screenType.configureNavigationItem(item: navigationItem, target: self, action: #selector(dismissInfoScreen))
    }
    
    func setupUI(issuers: [VerifyIssuer]?) {
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
            text: L.SelectYourBank.Title.localization,
            size: 24,
            primary: L.SelectYourBank.Title.localization
        )
        
        // - Description below title
        let mainDescriptionParent = UIView()
        let mainDescription = UILabel.subtitleLabel(
            text: L.SelectYourBank.Subtitle.Full.localization,
            partBold: L.SelectYourBank.Subtitle.HighlightedPart.localization
        )
        mainDescriptionParent.addSubview(mainDescription)
        mainDescription.edges(to: mainDescriptionParent)
        
        // Link to iDIN support
        let supportLabel = UILabel()
        supportLabel.attributedText = NSAttributedString(
            string: L.SelectYourBank.MoreAboutIdin.localization,
            attributes: [
                .font: UIFont.sourceSansProRegular(size: 16),
                .foregroundColor: UIColor.textColor,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        supportLabel.isUserInteractionEnabled = true
        supportLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openIdinLink)))
        
        // - create the stackview
        let stack = UIStackView(arrangedSubviews: [mainTitle, mainDescriptionParent, supportLabel])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 24
        scrollView.addSubview(stack)
        
        stack.edges(to: scrollView, insets: TinyEdgeInsets(top: 24, left: 0, bottom: 0, right: 0))
        stack.width(to: scrollView, offset: 0)
        stack.setCustomSpacing(4, after: mainDescriptionParent)
        
        mainTitle.widthToSuperview(offset: -48)
        mainDescriptionParent.widthToSuperview(offset: -48)
        supportLabel.widthToSuperview(offset: -48)
        
        if let issuers {
            for issuer in issuers {
                let control = SelectBankOptionControl(issuer: issuer, clickHandler: { [weak self] control in
                    self?.viewModel.openIssuerLink(with: issuer, control: control)
                })
                stack.addArrangedSubview(control)
                control.widthToSuperview(offset: -48)
            }
            
            // Add disclaimer
            let disclaimerContainer = UIView()
            let disclaimerLabel = UILabel()
            let warningImage = UIImageView()
            warningImage.image = .warning
            warningImage.size(CGSize(width: 22.5, height: 21))
            let disclaimerString = NSMutableAttributedString(
                string: L.SelectYourBank.BankNotInList.Full.localization,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 16), color: .charcoalColor, lineSpacing: 6)
            )
            disclaimerString.setAttributes([
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: UIFont.sourceSansProRegular(size: 16),
                .foregroundColor: UIColor.backgroundColor
            ], range: disclaimerString.nsRange(of: L.SelectYourBank.BankNotInList.HighlightedPart.localization)!)
            
            disclaimerContainer.addSubview(disclaimerLabel)
            disclaimerContainer.addSubview(warningImage)
            warningImage.leftToSuperview(offset: 12)
            warningImage.topToSuperview(offset: 18)
            disclaimerLabel.attributedText = disclaimerString
            disclaimerLabel.leftToRight(of: warningImage, offset: 12)
            disclaimerLabel.rightToSuperview(offset: -12)
            disclaimerLabel.verticalToSuperview(insets: .vertical(12))
            disclaimerLabel.numberOfLines = 0
            disclaimerContainer.backgroundColor = UIColor.yellowColor
            stack.addArrangedSubview(disclaimerContainer)
            disclaimerContainer.widthToSuperview(offset: -48)
            disclaimerLabel.isUserInteractionEnabled = true
            disclaimerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openAnotherMethod)))
        } else {
            let loadingIndicator = UIActivityIndicatorView()
            stack.addArrangedSubview(loadingIndicator)
            loadingIndicator.height(80)
            loadingIndicator.widthToSuperview()
            loadingIndicator.startAnimating()
        }
    }
    
    @objc func dismissInfoScreen() {
        delegate?.goBack(viewController: self)
    }
    
    @objc func openIdinLink() {
        if let url = URL(string: L.SelectYourBank.IdinkLink.localization) {
            delegate?.openInWebView(url)
        }
    }
    
    @objc func openAnotherMethod() {
        delegate?.goBack(viewController: self)
    }
}
