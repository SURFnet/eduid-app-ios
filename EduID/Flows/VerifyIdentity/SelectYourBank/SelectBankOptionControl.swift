//
//  SelectBankOptionControl.swift
//  eduID
//
//  Created by Dániel Zolnai on 01/10/2024.
//
import UIKit
import TinyConstraints
import OpenAPIClient
import SVGKit


class SelectBankOptionControl: UIControl {
    
    private var delegate: () -> ()
    
    init(
        issuer: VerifyIssuer,
        clickDelegate: @escaping () -> ()
    ) {
        self.delegate = clickDelegate
        super.init(frame: .zero)
        
        // icon on the left
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        if let svgString = issuer.logo,
           let svgData = svgString.data(using: .utf8) {
            // Initialize an SVGKImage from the data
            if let svgImage = SVGKImage(data: svgData) {
                // Use the Swift extension to get a UIImageView directly
                iconView.image = svgImage.uiImage
            } else {
                NSLog("Failed to create SVGKImage from data for issuer: \(issuer.name ?? "")")
            }
        } else {
            NSLog("Failed to convert SVG string to data for issuer: \(issuer.name ?? "")")
        }
        iconView.size(CGSize(width: 72, height: 72))
        
        // name on the right
        let nameLabel = UILabel()
        nameLabel.numberOfLines = 0
        nameLabel.attributedText = NSAttributedString(
            string: issuer.name ?? "",
            attributes: [
                .font: UIFont.sourceSansProSemiBold(size: 16),
                .foregroundColor: UIColor.backgroundColor
            ]
        )
        
        // - the master stack
        let stack = UIStackView(arrangedSubviews: [iconView, nameLabel])
        stack.axis = .horizontal
        stack.spacing = 32
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        stack.edges(to: self, insets: .horizontal(8))
        stack.alignment = .center
        stack.height(72)
        
        self.addTarget(self, action: #selector(onSelfTouchUpInside), for: .touchUpInside)
        
        layer.borderColor = UIColor.backgroundColor.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 6
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onSelfTouchUpInside() {
        self.delegate()
    }

}
