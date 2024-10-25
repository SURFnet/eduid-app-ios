//
//  VerifyIdentityControl.swift
//  eduID
//
//  Created by Dániel Zolnai on 30/09/2024.
//
import UIKit
import TinyConstraints

class VerifyIdentityControl: UIControl {
    
    private var clickHandler: (VerifyIdentityControl) -> ()
    private var loadingIndicator: UIActivityIndicatorView
    
    var isLoading: Bool {
        didSet {
            loadingIndicator.isHidden = !isLoading
            self.isUserInteractionEnabled = !isLoading
            if isLoading {
                loadingIndicator.startAnimating()
            } else {
                loadingIndicator.stopAnimating()
            }
        }
    }
    
    init(title: String,
         icon: UIImage,
         buttonTitle: String,
         subtitle: String? = nil,
         subtitleBoldPart: String? = nil,
         buttonIcon: UIImage? = nil,
         clickHandler: @escaping (VerifyIdentityControl) -> ()
    ) {
        self.clickHandler = clickHandler
        self.isLoading = false
        self.loadingIndicator = UIActivityIndicatorView(style: .medium)
        super.init(frame: .zero)
        
        // - top title
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.3
        titleLabel.attributedText = NSAttributedString(
            string: title,
            attributes: [
                .font: UIFont.proximaNovaSoftSemiBold(size: 20),
                .foregroundColor: UIColor.textColor,
                .paragraphStyle: paragraphStyle
            ]
        )
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.image = icon
        // - top horizontal stack
        let topHorizontalStack = UIStackView(arrangedSubviews: [titleLabel, iconView])
        topHorizontalStack.axis = .horizontal
        topHorizontalStack.alignment = .top
        topHorizontalStack.spacing = 28
        topHorizontalStack.distribution = .fill
        
        iconView.width(40)
        iconView.height(40)
        
        let button = EduIDButton(type: .primary, buttonTitle: buttonTitle)
        let buttonContainer = UIView()
        buttonContainer.addSubview(button)
        button.edgesToSuperview()
        
        if buttonIcon != nil {
            let buttonIconView = UIImageView()
            buttonContainer.addSubview(buttonIconView)
            buttonIconView.image = buttonIcon
            buttonIconView.contentMode = .scaleAspectFit
            buttonIconView.size(CGSize(width: 30, height: 30))
            buttonIconView.leftToSuperview(offset: 20)
            buttonIconView.centerYToSuperview()
        }
        
        buttonContainer.addSubview(loadingIndicator)
        loadingIndicator.centerYToSuperview()
        loadingIndicator.rightToSuperview(offset: -12)
        
        // - the master stack
        let stack = UIStackView(arrangedSubviews: [topHorizontalStack, buttonContainer])
        stack.axis = .vertical
        stack.spacing = 22
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        stack.edges(to: self, insets: .uniform(20))
        button.widthToSuperview()
        button.addTarget(self, action: #selector(onButtonTouchUpInside), for: .touchUpInside)
        
        if let subtitle {
            let subtitleLabel = UILabel()
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            subtitleLabel.numberOfLines = 0
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.lineSpacing = 6
            let attributedString = NSMutableAttributedString(string: subtitle, attributes: [.font: UIFont.sourceSansProRegular(size: 14), .foregroundColor: UIColor.charcoalColor, .paragraphStyle: paragraphStyle])
            if let subtitleBoldPart {
                attributedString.setAttributeTo(part: subtitleBoldPart, attributes: [.font: UIFont.sourceSansProBold(size: 14), .foregroundColor: UIColor.charcoalColor, .paragraphStyle: paragraphStyle])
            }
            subtitleLabel.attributedText = attributedString
            subtitleLabel.sizeToFit()
            stack.insertArrangedSubview(subtitleLabel, at: 1)
            stack.setCustomSpacing(8, after: topHorizontalStack)
        }
        
        layer.borderColor = UIColor.grayGhost.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onButtonTouchUpInside() {
        self.clickHandler(self)
    }
}
