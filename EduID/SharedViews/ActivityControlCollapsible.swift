import UIKit
import SDWebImage
import TinyConstraints
import OpenAPIClient

class ActivityControlCollapsible: ExpandableControl {

    private var callbackRemoveDetailsButtonAction: () -> Void
    private var callbackRevokeTokenButtonAction: (Token) -> Void
    
    private var tokens: [Token]
    
    private var borderView: UIView!
        
    //MARK: - init
    init(
        logoImageURL: String,
        institutionTitle: String,
        date: Date,
        uniqueId: String,
        accessTokens: [Token],
        removeDetailsButtonAction: @escaping () -> Void,
        revokeTokenButtonAction: @escaping (Token) -> Void
    ) {
        self.callbackRemoveDetailsButtonAction = removeDetailsButtonAction
        self.callbackRevokeTokenButtonAction = revokeTokenButtonAction
        self.tokens = accessTokens
        super.init()
        
        setupUI(
            logoImageURL: logoImageURL,
            institutionTitle: institutionTitle,
            date: date,
            uniqueId: uniqueId,
            accessTokens: accessTokens
        )
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(expandOrContract)))
    }
            
    //MARK: - setup UI
    func setupUI(logoImageURL: String, institutionTitle: String, date: Date, uniqueId: String, accessTokens: [Token]) {        
        //body stackview
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIColor.lightGray.image()
        if !logoImageURL.isEmpty {
            imageView.sd_setImage(with: URL(string: logoImageURL), placeholderImage:  UIColor.lightGray.image())
        }
        imageView.size(CGSize(width: 42, height: 42))
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        
        let hourTimeFormatter = DateFormatter()
        hourTimeFormatter.dateFormat = "HH:mm"
        let attributedStringBody = NSMutableAttributedString()
        attributedStringBody.append(NSAttributedString(string: institutionTitle, attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 16), color: .grayGhost, lineSpacing: 0)))
        let bodyParent = UIView()
        let bodyLabel = UILabel()
        bodyParent.addSubview(bodyLabel)
        bodyLabel.edges(to: bodyParent)
        bodyLabel.numberOfLines = 0
        bodyLabel.attributedText = attributedStringBody
        
        self.chevronImage = UIImageView(image: UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate))
        self.chevronImage.tintColor = .grayGhost
        self.chevronImage.size(CGSize(width: 24, height: 24))
        
        let bodyStack = UIStackView(arrangedSubviews: [imageView, bodyParent, self.chevronImage])
        bodyStack.setCustomSpacing(10, after: imageView)
        bodyStack.alignment = .center
        bodyStack.height(50, relation: .equalOrGreater)
        
        // Login details
        let loginDetailsLabel = UILabel()
        loginDetailsLabel.numberOfLines = 0
        loginDetailsLabel.attributedText = NSAttributedString(string: L.DataActivity.Details.Login.localization, attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 14), color: .grayGhost, lineSpacing: 0))
        
        // line 2
        let line2 = UIView()
        line2.height(1)
        line2.backgroundColor = .backgroundColor
        
        // First login
        let firstLoginLabel = UILabel()
        let firstLoginString = NSMutableAttributedString()
        firstLoginString.append(NSAttributedString(string: L.DataActivity.Details.FirstLogin.localization, attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 0)))
        firstLoginString.append(NSAttributedString(string: VerifiedInformationControlCollapsible.dateFormatter.string(from: date), attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 0)))
        firstLoginLabel.attributedText = firstLoginString
        
        // Unique ID
        let uniqueIdLabel = UILabel()
        let uniqueIdString = NSMutableAttributedString()
        uniqueIdString.append(NSAttributedString(string: L.DataActivity.Details.UniqueEduID.localization, attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 0)))
        uniqueIdString.append(NSAttributedString(string: uniqueId, attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 12), color: .grayGhost, lineSpacing: 0)))
        uniqueIdLabel.attributedText = uniqueIdString
        
        let deleteLoginDetailsContainer = UIView()
        
        let deleteIcon = UIImageView(image: .bin)
        deleteIcon.size(CGSize(width: 16, height: 16))
        deleteLoginDetailsContainer.addSubview(deleteIcon)
        deleteIcon.centerYToSuperview()
        deleteIcon.leftToSuperview()
        
        let deleteLink = UIButton()
        let clickableTitle = NSMutableAttributedString()
        clickableTitle.append(NSAttributedString(
            string: L.DataActivity.Details.Delete.localization,
            attributes: AttributedStringHelper.attributes(font: .sourceSansProSemiBold(size: 12), color: .backgroundColor, lineSpacing: 6, underline: true)
        ))
        deleteLink.setAttributedTitle(clickableTitle, for: .normal)
        deleteLoginDetailsContainer.addSubview(deleteLink)
        deleteLink.leftToRight(of: deleteIcon, offset: 13)
        deleteLink.centerYToSuperview()
        deleteLink.heightToSuperview()
        deleteLink.addTarget(self, action: #selector(removeDetailsButtonAction), for: .touchUpInside)

        stack = UIStackView(arrangedSubviews: [bodyStack, line2, loginDetailsLabel, firstLoginLabel, uniqueIdLabel, deleteLoginDetailsContainer])
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 18
        
        stack.setCustomSpacing(4, after: loginDetailsLabel)
        stack.setCustomSpacing(4, after: firstLoginLabel)
        
        for accessToken in accessTokens {
            let tokenLine = UIView()
            tokenLine.height(1)
            tokenLine.backgroundColor = .backgroundColor
            
            let tokenDetailsLabel = UILabel()
            tokenDetailsLabel.numberOfLines = 0
            tokenDetailsLabel.attributedText = NSAttributedString(string: L.DataActivity.Details.Access.localization, attributes: AttributedStringHelper.attributes(font: .sourceSansProBold(size: 14), color: .grayGhost, lineSpacing: 0))
            
            // Scopes
            let scopesLabel = UILabel()
            var scopesString = ""
            for scope in (accessToken.scopes ?? []) {
                let language: String
                if #available(iOS 16, *) {
                    language = Locale.current.language.languageCode?.identifier ?? "en"
                } else {
                    language = Locale.current.languageCode ?? "en"
                }
                let description = scope.descriptions?[language] ?? scope.descriptions?["en"] ?? scope.name ?? ""
                if description.count > 0 {
                    scopesString += "“\(description)”\n"
                }
                scopesString = scopesString.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            let scopesAttributedString = NSAttributedString(
                string: scopesString,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProSemiBold(size: 12), color: .grayGhost, lineSpacing: 0)
            )
            scopesLabel.attributedText = scopesAttributedString
            scopesLabel.numberOfLines = .zero
            
            // Consent given on
            let createdAtDateString: String
            if let createdAt = accessToken.createdAt,
               let createdAtDate = ActivityControlCollapsible.isoDateFormatter.date(from: createdAt) {
                createdAtDateString = VerifiedInformationControlCollapsible.dateFormatter.string(from: createdAtDate)
            } else {
                createdAtDateString = "-"
            }
            let consentGivenLabel = UILabel()
            let consentGivenString = NSMutableAttributedString()
            consentGivenString.append(NSAttributedString(string: L.DataActivity.Details.Consent.localization, attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 0)))
            consentGivenString.append(NSAttributedString(string: createdAtDateString, attributes: AttributedStringHelper.attributes(font: .sourceSansProSemiBold(size: 12), color: .grayGhost, lineSpacing: 0)))
            consentGivenLabel.attributedText = consentGivenString
            
            let expireDateString: String
            if let expiresIn = accessToken.expiresIn,
               let expiresInDate = ActivityControlCollapsible.isoDateFormatter.date(from: expiresIn) {
                expireDateString = VerifiedInformationControlCollapsible.dateFormatter.string(from: expiresInDate)
            } else {
                expireDateString = "-"
            }
            let accessExpiresLabel = UILabel()
            let accessExpiresString = NSMutableAttributedString()
            accessExpiresString.append(NSAttributedString(string: L.DataActivity.Details.Expires.localization, attributes: AttributedStringHelper.attributes(font: .sourceSansProRegular(size: 12), color: .grayGhost, lineSpacing: 0)))
            accessExpiresString.append(NSAttributedString(string: expireDateString, attributes: AttributedStringHelper.attributes(font: .sourceSansProSemiBold(size: 12), color: .grayGhost, lineSpacing: 0)))
            accessExpiresLabel.attributedText = accessExpiresString
            
            let revokeContainer = UIView()
            
            let revokeIcon = UIImageView(image: .bin)
            revokeIcon.size(CGSize(width: 16, height: 16))
            revokeContainer.addSubview(revokeIcon)
            revokeIcon.centerYToSuperview()
            revokeIcon.leftToSuperview()
            
            let revokeLink = UIButton()
            let clickableTitle = NSMutableAttributedString()
            clickableTitle.append(NSAttributedString(
                string: L.DataActivity.Details.Revoke.localization,
                attributes: AttributedStringHelper.attributes(font: .sourceSansProSemiBold(size: 12), color: .backgroundColor, lineSpacing: 6, underline: true)
            ))
            revokeLink.setAttributedTitle(clickableTitle, for: .normal)
            revokeContainer.addSubview(revokeLink)
            revokeLink.leftToRight(of: revokeIcon, offset: 13)
            revokeLink.centerYToSuperview()
            revokeLink.heightToSuperview()
            revokeLink.tag = accessTokens.firstIndex(of: accessToken)!
            revokeLink.addTarget(self, action: #selector(revokeButtonAction(sender:)), for: .touchUpInside)
            
            stack.addArrangedSubview(tokenLine)
            stack.addArrangedSubview(tokenDetailsLabel)
            stack.addArrangedSubview(consentGivenLabel)
            stack.addArrangedSubview(accessExpiresLabel)
            stack.addArrangedSubview(revokeContainer) 
        }
        
        addSubview(stack)
        stack.edges(to: self, insets: TinyEdgeInsets(top: 12, left: 18, bottom: 12, right: 18))
        
        // Border
        borderView = UIView()
        addSubview(borderView)
        borderView.edgesToSuperview()
        borderView.layer.borderWidth = 2
        borderView.isUserInteractionEnabled = false
        borderView.layer.borderColor = UIColor.grayGhost.cgColor
        borderView.layer.cornerRadius = 6
        
        // Info icon
        if !accessTokens.isEmpty {
            let infoIcon = UIImageView(image: .info)
            let infoContainer = UIView()
            infoContainer.size(CGSize(width: 24, height: 24))
            infoContainer.backgroundColor = .white
            infoContainer.layer.masksToBounds = true
            infoContainer.layer.cornerRadius = 12
            infoContainer.addSubview(infoIcon)
            infoIcon.edgesToSuperview(insets: .uniform(1.5))
            addSubview(infoIcon)
            infoIcon.rightToSuperview(offset: 12)
            infoIcon.topToSuperview(offset: -12)
        }
        
        // initially hide elements
        for i in (1..<stack.arrangedSubviews.count) {
            stack.arrangedSubviews[i].isHidden = true
            stack.arrangedSubviews[i].alpha = 0
        }
    }
    
    override func animateViewsOnExpandOrContract(_ isExpanded: Bool) {
        let chevronColorCollapsed: UIColor = .grayGhost
        let chevronColorExpanded: UIColor = .backgroundColor
        self.chevronImage.tintColor = isExpanded ? chevronColorExpanded : chevronColorCollapsed
        self.borderView.layer.borderColor = isExpanded ? UIColor.backgroundColor.cgColor : UIColor.grayGhost.cgColor
    }
    
    @objc
    func removeDetailsButtonAction() {
        self.callbackRemoveDetailsButtonAction()
    }
    
    @objc
    func revokeButtonAction(sender: UIButton) {
        let tokenToDelete = tokens[sender.tag]
        self.callbackRevokeTokenButtonAction(tokenToDelete)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    static var isoDateFormatter = CodableHelper.dateFormatter    
}
