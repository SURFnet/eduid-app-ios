//
//  MyAccountViewController.swift
//  eduID
//
//  Created by Dániel Zolnai on 2023. 06. 14..
//

import Foundation
import UIKit
import TinyConstraints

class MyAccountViewController: UIViewController, ScreenWithScreenType {
    
    // - screen type
    var screenType: ScreenType = .yourAccountScreen
     
     // - delegate
    weak var delegate: PersonalInfoViewControllerDelegate?
    
    private let viewModel: MyAccountViewModel
    
    private var loadingIndicator: UIActivityIndicatorView!
    private var downloadDataButton: EduIDButton!
    
    private var documentController: UIDocumentInteractionController? = nil
    
    init(viewModel: MyAccountViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        screenType.configureNavigationItem(item: navigationItem, target: self, action: #selector(dismissInfoScreen))
        // Remove any previous views
        view.subviews.forEach {
            $0.removeFromSuperview()
        }
        
        let mainTitle = UILabel.posterTextLabelBicolor(text: L.MyAccount.Title.localization, size: 24, primary: L.MyAccount.Title.localization)
        
        let createdDate: String
        let createdTime: String
        if let apiCreated = viewModel.personalInfo.created {
            let createdAtDate = Date(timeIntervalSince1970: Double(apiCreated))
            createdDate = VerifiedInformationControlCollapsible.dateFormatter.string(from: createdAtDate)
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            createdTime = timeFormatter.string(from: createdAtDate)
        } else {
            createdDate = "?"
            createdTime = "?"
        }
        
        let description = "\(L.MyAccount.AccountCreatedOn.localization)\n\(createdDate) \(L.MyAccount.AccountCreatedAt.localization) \(createdTime)"
        let mainDescription = UILabel.plainTextLabelPartlyBold(text: description, partBold: createdDate)
        
        let disclaimerContainer = UIView()
        let disclaimerLabel = UILabel()
        disclaimerLabel.attributedText = NSMutableAttributedString(
            string: L.MyAccount.PersonalDataDisclaimer.localization,
            attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 14), color: .charcoalColor, lineSpacing: 6)
        )
        disclaimerContainer.addSubview(disclaimerLabel)
        disclaimerLabel.edgesToSuperview(insets: .uniform(12))
        disclaimerLabel.numberOfLines = 0
        disclaimerContainer.backgroundColor = UIColor.yellowColor
        
        let downloadDataButtonContainer = UIView()
        downloadDataButton = EduIDButton(type: .primary, buttonTitle: L.MyAccount.DownloadDataButton.localization)
        downloadDataButtonContainer.addSubview(downloadDataButton)
        downloadDataButton.edgesToSuperview()
        
        loadingIndicator = UIActivityIndicatorView()
        downloadDataButtonContainer.addSubview(loadingIndicator)
        loadingIndicator.heightToSuperview()
        loadingIndicator.widthToHeight(of: loadingIndicator)
        loadingIndicator.centerXToSuperview(offset: 115)
        loadingIndicator.isHidden = true
        
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        let deleteAccountButton = EduIDButton(type: .borderedRed, buttonTitle: L.MyAccount.DeleteAccountButton.localization)
        
        let topStackView = UIStackView(arrangedSubviews: [
            mainTitle,
            mainDescription,
            disclaimerContainer,
            downloadDataButtonContainer,
            spacer,
            deleteAccountButton
        ])
        
        mainTitle.widthToSuperview()
        mainDescription.widthToSuperview()
        disclaimerContainer.widthToSuperview()
        downloadDataButtonContainer.widthToSuperview()
        spacer.widthToSuperview()
        deleteAccountButton.widthToSuperview()

        topStackView.alignment = .leading
        topStackView.axis = .vertical
        topStackView.distribution = .fill
        topStackView.spacing = 20
        
        view.addSubview(topStackView)
        topStackView.edgesToSuperview(insets: .uniform(24), usingSafeArea: true)
        
        downloadDataButton.addTarget(self, action: #selector(downloadDataClicked), for: .touchUpInside)
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountClicked), for: .touchUpInside)
    }
    
    @objc func downloadDataClicked() {
        Task {
            downloadDataButton.isEnabled = false
            loadingIndicator.isHidden = false
            loadingIndicator.startAnimating()
            do {
                let tempFileUrl = try await viewModel.downloadData()
                DispatchQueue.main.async { [weak self] in
                    self?.shareFileUrl(tempFileUrl)
                }
            } catch {
                NSLog("Unable to download user data: \(error)")
                showError(error)
            }
            downloadDataButton.isEnabled = true
            loadingIndicator.isHidden = true
            loadingIndicator.stopAnimating()
        }
    }
    
    func shareFileUrl(_ url: URL) {
        documentController = UIDocumentInteractionController(url: url)
        if let controller = documentController {
            controller.uti = "nl.eduid"
            controller.name = url.lastPathComponent
            controller.presentOpenInMenu(from: .zero, in: view, animated: true)
        }
    }
    
    
    private func showError(_ error: Error) {
        let alert = UIAlertController(
            title: L.MyAccount.DownloadError.localization,
            message: L.Generic.RequestError.Description(args: error.localizedFromApi).localization,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L.Generic.RequestError.CloseButton.localization, style: .default) { _ in
            alert.dismiss(animated: true)
        })
        self.present(alert, animated: true)
    }
    
    @objc func deleteAccountClicked() {
        delegate?.goToDeleteAccount(viewController: self, personalInfo: viewModel.personalInfo)
    }
    
    @objc func dismissInfoScreen() {
        delegate?.goBack(viewController: self)
    }
}
