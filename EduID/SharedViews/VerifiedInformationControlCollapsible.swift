//
//  VerifiedInformationControlCollapsible.swift
//  eduID
//
//  Created by Dániel Zolnai on 11/04/2024.
//
import UIKit
import TinyConstraints
import OpenAPIClient

class VerifiedInformationControlCollapsible: ExpandableControl {

    private var manageVerifiedInformationAction: (() -> Void)?
    
    enum LeftIconType {
        case emoji(String)
        case image(UIImage, UIColor?)
        case url(URL)
    }
    
    //MARK: - init
    init(title: String,
         subtitle: String,
         model: VerifiedInformationModel,
         manageVerifiedInformationAction: (() -> Void)?,
         expandable: Bool = true,
         leftIcon: LeftIconType? = nil,
         rightIcon: UIImage? = nil
    ) {
        self.manageVerifiedInformationAction = manageVerifiedInformationAction
        super.init()
        setupUI(
            title: title,
            subtitle: subtitle,
            model: model,
            expandable: expandable,
            leftIcon: leftIcon,
            rightIcon: rightIcon
        )
        if !expandable {
            self.gestureRecognizers?.forEach { removeGestureRecognizer($0) }
        }
    }
    
    //MARK: - setup UI
    private func setupUI(
        title: String,
        subtitle: String,
        model: VerifiedInformationModel,
        expandable: Bool,
        leftIcon: LeftIconType?,
        rightIcon: UIImage?
    ) {
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.masksToBounds = false
        //body stackview
        let attributedStringBody = NSMutableAttributedString()
        attributedStringBody.append(NSAttributedString(string: title, attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 16), color: .backgroundColor, lineSpacing: 6)))
        attributedStringBody.append(NSAttributedString(string: "\n"))
        attributedStringBody.append(NSAttributedString(string: subtitle, attributes:AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 6)))
        let bodyParent = UIView()
        let bodyLabel = UILabel()
        bodyParent.addSubview(bodyLabel)
        bodyLabel.edges(to: bodyParent)
        bodyLabel.numberOfLines = 0
        bodyLabel.attributedText = attributedStringBody
        
        let leftIconView: UIView
        if let leftIcon, case let LeftIconType.emoji(emoji) = leftIcon {
            let emojiLabel = UILabel()
            emojiLabel.text = emoji
            emojiLabel.font = .sourceSansProRegular(size: 30)
            leftIconView = emojiLabel
        } else if let leftIcon, case let LeftIconType.url(url) = leftIcon {
            let iconImageView = UIImageView()
            iconImageView.downloadImage(from: url)
            iconImageView.size(CGSize(width: 24, height: 28))
            leftIconView = iconImageView
        } else if let leftIcon, case let LeftIconType.image(image, tintColor) = leftIcon {
            let iconImageView = UIImageView()
            iconImageView.image = image
            iconImageView.size(CGSize(width: 28, height: 28))
            if let tintColor {
                iconImageView.tintColor = tintColor
            }
            leftIconView = iconImageView
        } else {
            let shieldImageView = UIImageView()
            shieldImageView.image = .shield
            shieldImageView.size(CGSize(width: 24, height: 28))
            leftIconView = shieldImageView
        }
        
        let rightIconView: UIView
        if expandable {
            self.chevronImage = UIImageView(image: UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate))
            self.chevronImage.tintColor = .backgroundColor
            self.chevronImage.size(CGSize(width: 24, height: 24))
            rightIconView = self.chevronImage
        } else if let rightIcon {
            rightIconView = UIImageView(image: rightIcon)
            rightIconView.size(CGSize(width: 24, height: 24))
        } else {
            rightIconView = UIView(frame: .zero)
        }
        
        let bodyStack = UIStackView(arrangedSubviews: [leftIconView, bodyParent, rightIconView])
        bodyStack.setCustomSpacing(12, after: leftIconView)
        bodyStack.alignment = .center
        bodyStack.height(50)
        
        // Line 1
        let line1 = UIView()
        line1.height(2)
        line1.backgroundColor = .backgroundColor
        
        // Verified by
        let verifiedByLabel = UILabel()
        let verifiedByString = NSMutableAttributedString(
            string: L.Profile.VerifiedBy(args: model.providerName).localization,
            attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 6)
        )
        if let createdAt = model.createdAt {
            let createdAtDate = Date(timeIntervalSince1970: TimeInterval(createdAt / 1000))
            verifiedByString.append(NSAttributedString(
                string: "\n" + L.Profile.LinkedAccountCreatedAt.localization,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 6)
            ))
            verifiedByString.append(NSAttributedString(
                string: VerifiedInformationControlCollapsible.dateFormatter.string(from: createdAtDate),
                attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 6)
            ))
        }
        if let expiresAt = model.expiresAt {
            let expiresAtDate = Date(timeIntervalSince1970: TimeInterval(expiresAt / 1000))
            verifiedByString.append(NSAttributedString(
                string: "\n" + L.Profile.LinkedAccountValidUntil.localization,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 6)
            ))
            verifiedByString.append(NSAttributedString(
                string: VerifiedInformationControlCollapsible.dateFormatter.string(from: expiresAtDate),
                attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 6)
            ))
        }
        
        // Line 2
        let line2 = UIView()
        line2.height(2)
        line2.backgroundColor = .backgroundColor
        
        // Manage your verified information
        let manageLabel = UIButton()
        manageLabel.setAttributedTitle(NSAttributedString(
            string: L.Profile.ManageYourVerifiedInformation.localization,
            attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .backgroundColor, lineSpacing: 6, underline: true)
        ), for: .normal)
        manageLabel.addTarget(self, action: #selector(manageVerifiedInformation), for: .touchUpInside)
        manageLabel.contentHorizontalAlignment = .left
        
        verifiedByLabel.attributedText = verifiedByString
        verifiedByLabel.numberOfLines = 0
        let bottomStack = UIStackView(arrangedSubviews: [line1, verifiedByLabel, line2, manageLabel])
        bottomStack.axis = .vertical
        bottomStack.spacing = 18
        bottomStack.distribution = .equalSpacing
        bottomStack.isLayoutMarginsRelativeArrangement = true
        bottomStack.layoutMargins = .left(36) + .bottom(8)
                        
        stack = UIStackView(arrangedSubviews: [bodyStack, bottomStack])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 18
        
        addSubview(stack)
        stack.edges(to: self, insets: TinyEdgeInsets(top: 12, left: 18, bottom: 12, right: 18))
        
        //border
        layer.borderWidth = 2
        layer.borderColor = UIColor.backgroundColor.cgColor
        layer.cornerRadius = 6
        
        // initially hide elements
        for i in (1..<stack.arrangedSubviews.count) {
            stack.arrangedSubviews[i].isHidden = true
            stack.arrangedSubviews[i].alpha = 0
        }
    }
    

    @objc
    func manageVerifiedInformation() {
        self.manageVerifiedInformationAction?()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
    
}

