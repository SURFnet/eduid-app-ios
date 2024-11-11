//
//  RemovalConfirmationDialogViewController.swift
//  eduID
//
//  Created by Dániel Zolnai on 2024. 11. 11..
//
import Foundation
import UIKit
import TinyConstraints

protocol RemovalConfirmationDialogViewControllerDelegate: NSObject {
    func onConfirm() -> Void
    func onCancel() -> Void
    func dismiss(viewController: UIViewController)
}

class RemovalConfirmationDialogViewController : UIViewController {

    var delegate: RemovalConfirmationDialogViewControllerDelegate?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .popover
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setupUI()
    }
    
    private func setupUI() {
        let innerView = UIView()
        innerView.backgroundColor = .white
        innerView.layer.masksToBounds = true
        innerView.layer.cornerRadius = 10
        let titleString = L.YourVerifiedInformation.ConfirmRemoval.Title.localization
        let mainTitle = UILabel.posterTextLabelBicolor(text: titleString, size: 24, primary: "")
        
        let descriptionLabel = UILabel.plainTextLabelPartlyBold(text: L.YourVerifiedInformation.ConfirmRemoval.Description.localization)
        
        let stackView = UIStackView(arrangedSubviews: [
            mainTitle,
            descriptionLabel,
        ])
        
        
        let cancelButton = EduIDButton(type: .ghost, buttonTitle: L.YourVerifiedInformation.ConfirmRemoval.Button.Cancel.localization)
        let confirmButton = EduIDButton(type: .filledRed, buttonTitle: L.YourVerifiedInformation.ConfirmRemoval.Button.YesDelete.localization)
           
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
        
        let buttonStackView = UIStackView(arrangedSubviews: [
            cancelButton,
            confirmButton
        ])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 16
        
        stackView.addArrangedSubview(buttonStackView)
        innerView.addSubview(stackView)
        buttonStackView.widthToSuperview()
        stackView.edgesToSuperview(insets: .uniform(22))
        
        // Add click targets
        cancelButton.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(onConfirm), for: .touchUpInside)
        
        view.addSubview(innerView)
        innerView.widthToSuperview(offset: -48)
        innerView.centerInSuperview()
    }
    
    @objc func onCancel() {
        delegate?.dismiss(viewController: self)
        delegate?.onCancel()
        delegate = nil
    }
    
    @objc func onConfirm() {
        delegate?.dismiss(viewController: self)
        delegate?.onConfirm()
        delegate = nil
    }
}
