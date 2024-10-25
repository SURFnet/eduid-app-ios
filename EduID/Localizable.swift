// DO NOT EDIT. This file is auto-generated using Localicious (https://github.com/PicnicSupermarket/localicious).

import UIKit

public protocol LocalizationProvider {
    var translationKey: String? { get }
    var accessibilityHintKey: String? { get }
    var accessibilityLabelKey: String? { get }
    var accessibilityValueKey: String? { get }
    var translationArgs: [CVarArg]? { get }
}

public struct LocaliciousData: LocalizationProvider {
    public let accessibilityIdentifier: String
    public let accessibilityHintKey: String?
    public let accessibilityLabelKey: String?
    public let accessibilityValueKey: String?
    public let translationKey: String?
    public let translationArgs: [CVarArg]?
}

public enum LocaliciousQuantity: String {
    case zero = "ZERO"
    case one = "ONE"
    case other = "OTHER"

    init(quantity: Int) {
        switch true {
        case quantity == 0:
            self = .zero
        case quantity == 1:
            self = .one
        default:
            self = .other
        }
    }
}

public extension LocalizationProvider {
    var translation: String? {
        return translationKey.map { translation(forKey: $0) } ?? nil
    }

    var accessibilityHint: String? {
        return accessibilityHintKey.map { translation(forKey: $0) } ?? nil
    }

    var accessibilityLabel: String? {
        return accessibilityLabelKey.map { translation(forKey: $0) } ?? nil
    }

    var accessibilityValue: String? {
        return accessibilityValueKey.map { translation(forKey: $0) } ?? nil
    }

    func translation(forKey key: String, withBundle bundle: Bundle = Bundle.main) -> String? {
        let value = bundle.localizedString(forKey: key, value: nil, table: nil)

        guard value != key else {
            return nil
        }

        let translationArgs = self.translationArgs ?? []
        guard translationArgs.count > 0 else { return value }

        return String(format: value, arguments: translationArgs)
    }
}

public extension UIButton {
    func setLocalicious(_ data: LocaliciousData, for controlState: UIControl.State) {
        setTitle(data.translation, for: controlState)
        self.accessibilityIdentifier = data.accessibilityIdentifier
        self.accessibilityValue = data.accessibilityValue
        self.accessibilityHint = data.accessibilityHint
        self.accessibilityLabel = data.accessibilityLabel
    }
}

public extension UILabel {
    func setLocalicious(_ data: LocaliciousData) {
        self.text = data.translation
        self.accessibilityIdentifier = data.accessibilityIdentifier
        self.accessibilityValue = data.accessibilityValue
        self.accessibilityHint = data.accessibilityHint
        self.accessibilityLabel = data.accessibilityLabel
    }
}

public struct L {
    public struct About {
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "About.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "About.Info.COPY",
            translationArgs: []
        )
    }
    public struct Sidebar {
        public static let Home = LocaliciousData(
            accessibilityIdentifier: "Sidebar.Home",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sidebar.Home.COPY",
            translationArgs: []
        )
        public static let PersonalInfo = LocaliciousData(
            accessibilityIdentifier: "Sidebar.PersonalInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sidebar.PersonalInfo.COPY",
            translationArgs: []
        )
        public static let DataActivity = LocaliciousData(
            accessibilityIdentifier: "Sidebar.DataActivity",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sidebar.DataActivity.COPY",
            translationArgs: []
        )
        public static let Security = LocaliciousData(
            accessibilityIdentifier: "Sidebar.Security",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sidebar.Security.COPY",
            translationArgs: []
        )
        public static let Account = LocaliciousData(
            accessibilityIdentifier: "Sidebar.Account",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sidebar.Account.COPY",
            translationArgs: []
        )
    }
    public struct Start {
        public static func Hi(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Start.Hi",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Start.Hi.COPY",
            translationArgs: args
        )
        }
        public static let Manage = LocaliciousData(
            accessibilityIdentifier: "Start.Manage",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Start.Manage.COPY",
            translationArgs: []
        )
    }
    public struct EnvironmentSwitcher {
        public static let Button = LocaliciousData(
            accessibilityIdentifier: "EnvironmentSwitcher.Button",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EnvironmentSwitcher.Button.COPY",
            translationArgs: []
        )
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "EnvironmentSwitcher.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EnvironmentSwitcher.Title.COPY",
            translationArgs: []
        )
        public static let Subtitle = LocaliciousData(
            accessibilityIdentifier: "EnvironmentSwitcher.Subtitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EnvironmentSwitcher.Subtitle.COPY",
            translationArgs: []
        )
    }
    public struct FeatureFlags {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "FeatureFlags.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "FeatureFlags.Title.COPY",
            translationArgs: []
        )
        public static let IdentityVerification = LocaliciousData(
            accessibilityIdentifier: "FeatureFlags.IdentityVerification",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "FeatureFlags.IdentityVerification.COPY",
            translationArgs: []
        )
    }
    public struct PromptForOAuth {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "PromptForOAuth.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PromptForOAuth.Title.COPY",
            translationArgs: []
        )
        public static let Description = LocaliciousData(
            accessibilityIdentifier: "PromptForOAuth.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PromptForOAuth.Description.COPY",
            translationArgs: []
        )
    }
    public struct HomeView {
        public struct MainText {
            public static let FirstPart = LocaliciousData(
                accessibilityIdentifier: "HomeView.MainText.FirstPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "HomeView.MainText.FirstPart.COPY",
                translationArgs: []
            )
            public static let SecondPart = LocaliciousData(
                accessibilityIdentifier: "HomeView.MainText.SecondPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "HomeView.MainText.SecondPart.COPY",
                translationArgs: []
            )
        }
        public static let SecurityButton = LocaliciousData(
            accessibilityIdentifier: "HomeView.SecurityButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "HomeView.SecurityButton.COPY",
            translationArgs: []
        )
        public static let PersonalInfoButton = LocaliciousData(
            accessibilityIdentifier: "HomeView.PersonalInfoButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "HomeView.PersonalInfoButton.COPY",
            translationArgs: []
        )
        public static let ActivityButton = LocaliciousData(
            accessibilityIdentifier: "HomeView.ActivityButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "HomeView.ActivityButton.COPY",
            translationArgs: []
        )
        public static let ScanQRButton = LocaliciousData(
            accessibilityIdentifier: "HomeView.ScanQRButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "HomeView.ScanQRButton.COPY",
            translationArgs: []
        )
    }
    public struct ScanView {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "ScanView.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ScanView.Title.COPY",
            translationArgs: []
        )
        public static let MainText = LocaliciousData(
            accessibilityIdentifier: "ScanView.MainText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ScanView.MainText.COPY",
            translationArgs: []
        )
        public static let MainTextBoldPart = LocaliciousData(
            accessibilityIdentifier: "ScanView.MainTextBoldPart",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ScanView.MainTextBoldPart.COPY",
            translationArgs: []
        )
        public struct Flashlight {
            public static let NotAvailable = LocaliciousData(
                accessibilityIdentifier: "ScanView.Flashlight.NotAvailable",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ScanView.Flashlight.NotAvailable.COPY",
                translationArgs: []
            )
            public static let TurnOn = LocaliciousData(
                accessibilityIdentifier: "ScanView.Flashlight.TurnOn",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ScanView.Flashlight.TurnOn.COPY",
                translationArgs: []
            )
        }
        public static let Error = LocaliciousData(
            accessibilityIdentifier: "ScanView.Error",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ScanView.Error.COPY",
            translationArgs: []
        )
    }
    public struct Header {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Header.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Header.Title.COPY",
            translationArgs: []
        )
        public static let Logout = LocaliciousData(
            accessibilityIdentifier: "Header.Logout",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Header.Logout.COPY",
            translationArgs: []
        )
        public static let LogOff = LocaliciousData(
            accessibilityIdentifier: "Header.LogOff",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Header.LogOff.COPY",
            translationArgs: []
        )
    }
    public struct Landing {
        public static let LogoutTitle = LocaliciousData(
            accessibilityIdentifier: "Landing.LogoutTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Landing.LogoutTitle.COPY",
            translationArgs: []
        )
    }
    public struct RegistrationCheck {
        public static let MainText = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.MainText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.MainText.COPY",
            translationArgs: []
        )
        public static let HighLight = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.HighLight",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.HighLight.COPY",
            translationArgs: []
        )
        public static let LogoutStatus = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.LogoutStatus",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.LogoutStatus.COPY",
            translationArgs: []
        )
        public static let LoginAgain = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.LoginAgain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.LoginAgain.COPY",
            translationArgs: []
        )
        public static let DeleteTitle = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.DeleteTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.DeleteTitle.COPY",
            translationArgs: []
        )
        public static let DeleteStatus = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.DeleteStatus",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.DeleteStatus.COPY",
            translationArgs: []
        )
        public static let RegisterAgain = LocaliciousData(
            accessibilityIdentifier: "RegistrationCheck.RegisterAgain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegistrationCheck.RegisterAgain.COPY",
            translationArgs: []
        )
    }
    public struct NotFound {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "NotFound.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NotFound.Title.COPY",
            translationArgs: []
        )
        public static let Title2 = LocaliciousData(
            accessibilityIdentifier: "NotFound.Title2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NotFound.Title2.COPY",
            translationArgs: []
        )
    }
    public struct YourVerifiedInformation {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.Title.COPY",
            translationArgs: []
        )
        public static let Subtitle = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.Subtitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.Subtitle.COPY",
            translationArgs: []
        )
        public static let ExplainIcon = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.ExplainIcon",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.ExplainIcon.COPY",
            translationArgs: []
        )
        public static func FromInstitution(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.FromInstitution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.FromInstitution.COPY",
            translationArgs: args
        )
        }
        public static func AtInstitution(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.AtInstitution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.AtInstitution.COPY",
            translationArgs: args
        )
        }
        public static let ReceivedOn = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.ReceivedOn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.ReceivedOn.COPY",
            translationArgs: []
        )
        public static let ValidUntil = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.ValidUntil",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.ValidUntil.COPY",
            translationArgs: []
        )
        public static let RemoveThisInformation = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.RemoveThisInformation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.RemoveThisInformation.COPY",
            translationArgs: []
        )
        public static let FromYourEduID = LocaliciousData(
            accessibilityIdentifier: "YourVerifiedInformation.FromYourEduID",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "YourVerifiedInformation.FromYourEduID.COPY",
            translationArgs: []
        )
    }
    public struct Profile {
        public static let YouAreLoggedIn = LocaliciousData(
            accessibilityIdentifier: "Profile.YouAreLoggedIn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.YouAreLoggedIn.COPY",
            translationArgs: []
        )
        public static let ManageYourAccount = LocaliciousData(
            accessibilityIdentifier: "Profile.ManageYourAccount",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ManageYourAccount.COPY",
            translationArgs: []
        )
        public struct AccountLinkError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "Profile.AccountLinkError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.AccountLinkError.Title.COPY",
                translationArgs: []
            )
        }
        public static let AddViaSurfconext = LocaliciousData(
            accessibilityIdentifier: "Profile.AddViaSurfconext",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.AddViaSurfconext.COPY",
            translationArgs: []
        )
        public static let AddRoleAndInstitution = LocaliciousData(
            accessibilityIdentifier: "Profile.AddRoleAndInstitution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.AddRoleAndInstitution.COPY",
            translationArgs: []
        )
        public static let RoleAndInstitution = LocaliciousData(
            accessibilityIdentifier: "Profile.RoleAndInstitution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.RoleAndInstitution.COPY",
            translationArgs: []
        )
        public static let Me = LocaliciousData(
            accessibilityIdentifier: "Profile.Me",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Me.COPY",
            translationArgs: []
        )
        public static let ShareableInformation = LocaliciousData(
            accessibilityIdentifier: "Profile.ShareableInformation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ShareableInformation.COPY",
            translationArgs: []
        )
        public struct RemoveServicePrompt {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "Profile.RemoveServicePrompt.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.RemoveServicePrompt.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "Profile.RemoveServicePrompt.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.RemoveServicePrompt.Description.COPY",
                translationArgs: []
            )
            public static let Delete = LocaliciousData(
                accessibilityIdentifier: "Profile.RemoveServicePrompt.Delete",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.RemoveServicePrompt.Delete.COPY",
                translationArgs: []
            )
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "Profile.RemoveServicePrompt.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.RemoveServicePrompt.Cancel.COPY",
                translationArgs: []
            )
        }
        public static let ProvidedBy = LocaliciousData(
            accessibilityIdentifier: "Profile.ProvidedBy",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ProvidedBy.COPY",
            translationArgs: []
        )
        public static let ProvidedByYou = LocaliciousData(
            accessibilityIdentifier: "Profile.ProvidedByYou",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ProvidedByYou.COPY",
            translationArgs: []
        )
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Profile.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Profile.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Info.COPY",
            translationArgs: []
        )
        public static let YourIdentity = LocaliciousData(
            accessibilityIdentifier: "Profile.YourIdentity",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.YourIdentity.COPY",
            translationArgs: []
        )
        public static let Verified = LocaliciousData(
            accessibilityIdentifier: "Profile.Verified",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Verified.COPY",
            translationArgs: []
        )
        public static let NotVerified = LocaliciousData(
            accessibilityIdentifier: "Profile.NotVerified",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.NotVerified.COPY",
            translationArgs: []
        )
        public static let VerifiedGivenName = LocaliciousData(
            accessibilityIdentifier: "Profile.VerifiedGivenName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.VerifiedGivenName.COPY",
            translationArgs: []
        )
        public static let VerifiedFamilyName = LocaliciousData(
            accessibilityIdentifier: "Profile.VerifiedFamilyName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.VerifiedFamilyName.COPY",
            translationArgs: []
        )
        public static let VerifiedDateOfBirth = LocaliciousData(
            accessibilityIdentifier: "Profile.VerifiedDateOfBirth",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.VerifiedDateOfBirth.COPY",
            translationArgs: []
        )
        public static let LinkedAccountCreatedAt = LocaliciousData(
            accessibilityIdentifier: "Profile.LinkedAccountCreatedAt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.LinkedAccountCreatedAt.COPY",
            translationArgs: []
        )
        public static let LinkedAccountValidUntil = LocaliciousData(
            accessibilityIdentifier: "Profile.LinkedAccountValidUntil",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.LinkedAccountValidUntil.COPY",
            translationArgs: []
        )
        public static let ManageYourVerifiedInformation = LocaliciousData(
            accessibilityIdentifier: "Profile.ManageYourVerifiedInformation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ManageYourVerifiedInformation.COPY",
            translationArgs: []
        )
        public struct VerifyNow {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyNow.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyNow.Title.COPY",
                translationArgs: []
            )
            public static let Button = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyNow.Button",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyNow.Button.COPY",
                translationArgs: []
            )
        }
        public static let FirstName = LocaliciousData(
            accessibilityIdentifier: "Profile.FirstName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.FirstName.COPY",
            translationArgs: []
        )
        public static let LastName = LocaliciousData(
            accessibilityIdentifier: "Profile.LastName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.LastName.COPY",
            translationArgs: []
        )
        public static let ContactDetails = LocaliciousData(
            accessibilityIdentifier: "Profile.ContactDetails",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ContactDetails.COPY",
            translationArgs: []
        )
        public static let Basic = LocaliciousData(
            accessibilityIdentifier: "Profile.Basic",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Basic.COPY",
            translationArgs: []
        )
        public static let Email = LocaliciousData(
            accessibilityIdentifier: "Profile.Email",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Email.COPY",
            translationArgs: []
        )
        public static let VerifyEmail = LocaliciousData(
            accessibilityIdentifier: "Profile.VerifyEmail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.VerifyEmail.COPY",
            translationArgs: []
        )
        public static let Name = LocaliciousData(
            accessibilityIdentifier: "Profile.Name",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Name.COPY",
            translationArgs: []
        )
        public static let Validated = LocaliciousData(
            accessibilityIdentifier: "Profile.Validated",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Validated.COPY",
            translationArgs: []
        )
        public static let FirstAndLastName = LocaliciousData(
            accessibilityIdentifier: "Profile.FirstAndLastName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.FirstAndLastName.COPY",
            translationArgs: []
        )
        public static let FirstAndLastNameInfo = LocaliciousData(
            accessibilityIdentifier: "Profile.FirstAndLastNameInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.FirstAndLastNameInfo.COPY",
            translationArgs: []
        )
        public static let Verify = LocaliciousData(
            accessibilityIdentifier: "Profile.Verify",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Verify.COPY",
            translationArgs: []
        )
        public static let Student = LocaliciousData(
            accessibilityIdentifier: "Profile.Student",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Student.COPY",
            translationArgs: []
        )
        public static let StudentInfo = LocaliciousData(
            accessibilityIdentifier: "Profile.StudentInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.StudentInfo.COPY",
            translationArgs: []
        )
        public static let Prove = LocaliciousData(
            accessibilityIdentifier: "Profile.Prove",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Prove.COPY",
            translationArgs: []
        )
        public static let Trusted = LocaliciousData(
            accessibilityIdentifier: "Profile.Trusted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Trusted.COPY",
            translationArgs: []
        )
        public static let TrustedInfo = LocaliciousData(
            accessibilityIdentifier: "Profile.TrustedInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.TrustedInfo.COPY",
            translationArgs: []
        )
        public static let Link = LocaliciousData(
            accessibilityIdentifier: "Profile.Link",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Link.COPY",
            translationArgs: []
        )
        public static let Institution = LocaliciousData(
            accessibilityIdentifier: "Profile.Institution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Institution.COPY",
            translationArgs: []
        )
        public static let InstitutionAt = LocaliciousData(
            accessibilityIdentifier: "Profile.InstitutionAt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.InstitutionAt.COPY",
            translationArgs: []
        )
        public static let Employee = LocaliciousData(
            accessibilityIdentifier: "Profile.Employee",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Employee.COPY",
            translationArgs: []
        )
        public static let Affiliations = LocaliciousData(
            accessibilityIdentifier: "Profile.Affiliations",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Affiliations.COPY",
            translationArgs: []
        )
        public static let Expires = LocaliciousData(
            accessibilityIdentifier: "Profile.Expires",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Expires.COPY",
            translationArgs: []
        )
        public static func ExpiresValue(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Profile.ExpiresValue",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.ExpiresValue.COPY",
            translationArgs: args
        )
        }
        public static func VerifiedBy(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Profile.VerifiedBy",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.VerifiedBy.COPY",
            translationArgs: args
        )
        }
        public static func VerifiedOn(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Profile.VerifiedOn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.VerifiedOn.COPY",
            translationArgs: args
        )
        }
        public static let Proceed = LocaliciousData(
            accessibilityIdentifier: "Profile.Proceed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Profile.Proceed.COPY",
            translationArgs: []
        )
        public struct VerifyFirstAndLastName {
            public static let AddInstitution = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyFirstAndLastName.AddInstitution",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyFirstAndLastName.AddInstitution.COPY",
                translationArgs: []
            )
            public static let AddInstitutionConfirmation = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyFirstAndLastName.AddInstitutionConfirmation",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyFirstAndLastName.AddInstitutionConfirmation.COPY",
                translationArgs: []
            )
        }
        public struct VerifyStudent {
            public static let AddInstitution = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyStudent.AddInstitution",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyStudent.AddInstitution.COPY",
                translationArgs: []
            )
            public static let AddInstitutionConfirmation = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyStudent.AddInstitutionConfirmation",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyStudent.AddInstitutionConfirmation.COPY",
                translationArgs: []
            )
        }
        public struct VerifyParty {
            public static let AddInstitution = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyParty.AddInstitution",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyParty.AddInstitution.COPY",
                translationArgs: []
            )
            public static let AddInstitutionConfirmation = LocaliciousData(
                accessibilityIdentifier: "Profile.VerifyParty.AddInstitutionConfirmation",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Profile.VerifyParty.AddInstitutionConfirmation.COPY",
                translationArgs: []
            )
        }
    }
    public struct EppnAlreadyLinked {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.Title.COPY",
            translationArgs: []
        )
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.Info.COPY",
            translationArgs: args
        )
        }
        public static let RetryButton = LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.RetryButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.RetryButton.COPY",
            translationArgs: []
        )
    }
    public struct Edit {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Edit.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Edit.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.Info.COPY",
            translationArgs: []
        )
        public static let GivenName = LocaliciousData(
            accessibilityIdentifier: "Edit.GivenName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.GivenName.COPY",
            translationArgs: []
        )
        public static let FamilyName = LocaliciousData(
            accessibilityIdentifier: "Edit.FamilyName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.FamilyName.COPY",
            translationArgs: []
        )
        public static let Update = LocaliciousData(
            accessibilityIdentifier: "Edit.Update",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.Update.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Edit.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.Cancel.COPY",
            translationArgs: []
        )
        public static let Updated = LocaliciousData(
            accessibilityIdentifier: "Edit.Updated",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.Updated.COPY",
            translationArgs: []
        )
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Edit.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Edit.Back.COPY",
            translationArgs: []
        )
    }
    public struct Email {
        public static func OpenLinkToConfirm(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Email.OpenLinkToConfirm",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.OpenLinkToConfirm.COPY",
            translationArgs: args
        )
        }
        public static func UpdateError(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Email.UpdateError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.UpdateError.COPY",
            translationArgs: args
        )
        }
        public struct Title {
            public static let Edit = LocaliciousData(
                accessibilityIdentifier: "Email.Title.Edit",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Email.Title.Edit.COPY",
                translationArgs: []
            )
            public static let EmailAddress = LocaliciousData(
                accessibilityIdentifier: "Email.Title.EmailAddress",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Email.Title.EmailAddress.COPY",
                translationArgs: []
            )
        }
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Email.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Info.COPY",
            translationArgs: []
        )
        public static let NewEmail = LocaliciousData(
            accessibilityIdentifier: "Email.NewEmail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.NewEmail.COPY",
            translationArgs: []
        )
        public static let Placeholder = LocaliciousData(
            accessibilityIdentifier: "Email.Placeholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Placeholder.COPY",
            translationArgs: []
        )
        public static let Update = LocaliciousData(
            accessibilityIdentifier: "Email.Update",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Update.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Email.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Cancel.COPY",
            translationArgs: []
        )
        public static let Save = LocaliciousData(
            accessibilityIdentifier: "Email.Save",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Save.COPY",
            translationArgs: []
        )
        public static func Updated(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Email.Updated",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Updated.COPY",
            translationArgs: args
        )
        }
        public static func Confirmed(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Email.Confirmed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Confirmed.COPY",
            translationArgs: args
        )
        }
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Email.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.Back.COPY",
            translationArgs: []
        )
        public static let EmailEquality = LocaliciousData(
            accessibilityIdentifier: "Email.EmailEquality",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.EmailEquality.COPY",
            translationArgs: []
        )
        public static let DuplicateEmail = LocaliciousData(
            accessibilityIdentifier: "Email.DuplicateEmail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.DuplicateEmail.COPY",
            translationArgs: []
        )
        public static let OutstandingPasswordForgotten = LocaliciousData(
            accessibilityIdentifier: "Email.OutstandingPasswordForgotten",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.OutstandingPasswordForgotten.COPY",
            translationArgs: []
        )
        public static let OutstandingPasswordForgottenConfirmation = LocaliciousData(
            accessibilityIdentifier: "Email.OutstandingPasswordForgottenConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.OutstandingPasswordForgottenConfirmation.COPY",
            translationArgs: []
        )
    }
    public struct NameUpdated {
        public struct Title {
            public static let YourSchool = LocaliciousData(
                accessibilityIdentifier: "NameUpdated.Title.YourSchool",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "NameUpdated.Title.YourSchool.COPY",
                translationArgs: []
            )
            public static let ContactedSuccessfully = LocaliciousData(
                accessibilityIdentifier: "NameUpdated.Title.ContactedSuccessfully",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "NameUpdated.Title.ContactedSuccessfully.COPY",
                translationArgs: []
            )
            public static let ContactedError = LocaliciousData(
                accessibilityIdentifier: "NameUpdated.Title.ContactedError",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "NameUpdated.Title.ContactedError.COPY",
                translationArgs: []
            )
            public struct FailReason {
                public static func AlreadyLinked(args: CVarArg...) -> LocaliciousData {
                    return LocaliciousData(
                    accessibilityIdentifier: "NameUpdated.Title.FailReason.AlreadyLinked",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "NameUpdated.Title.FailReason.AlreadyLinked.COPY",
                    translationArgs: args
                )
                }
                public static let SessionExpired = LocaliciousData(
                    accessibilityIdentifier: "NameUpdated.Title.FailReason.SessionExpired",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "NameUpdated.Title.FailReason.SessionExpired.COPY",
                    translationArgs: []
                )
            }
        }
        public static let Description = LocaliciousData(
            accessibilityIdentifier: "NameUpdated.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NameUpdated.Description.COPY",
            translationArgs: []
        )
        public static let FullName = LocaliciousData(
            accessibilityIdentifier: "NameUpdated.FullName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NameUpdated.FullName.COPY",
            translationArgs: []
        )
        public static let Continue = LocaliciousData(
            accessibilityIdentifier: "NameUpdated.Continue",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NameUpdated.Continue.COPY",
            translationArgs: []
        )
    }
    public struct EditName {
        public struct Title {
            public static let Edit = LocaliciousData(
                accessibilityIdentifier: "EditName.Title.Edit",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "EditName.Title.Edit.COPY",
                translationArgs: []
            )
            public static let YourName = LocaliciousData(
                accessibilityIdentifier: "EditName.Title.YourName",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "EditName.Title.YourName.COPY",
                translationArgs: []
            )
        }
        public static let FirstName = LocaliciousData(
            accessibilityIdentifier: "EditName.FirstName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.FirstName.COPY",
            translationArgs: []
        )
        public static let LastName = LocaliciousData(
            accessibilityIdentifier: "EditName.LastName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.LastName.COPY",
            translationArgs: []
        )
        public struct Button {
            public static let Save = LocaliciousData(
                accessibilityIdentifier: "EditName.Button.Save",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "EditName.Button.Save.COPY",
                translationArgs: []
            )
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "EditName.Button.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "EditName.Button.Cancel.COPY",
                translationArgs: []
            )
        }
    }
    public struct DeleteAccount {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "DeleteAccount.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteAccount.Title.COPY",
            translationArgs: []
        )
        public static let Disclaimer = LocaliciousData(
            accessibilityIdentifier: "DeleteAccount.Disclaimer",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteAccount.Disclaimer.COPY",
            translationArgs: []
        )
        public static let LongDescription = LocaliciousData(
            accessibilityIdentifier: "DeleteAccount.LongDescription",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteAccount.LongDescription.COPY",
            translationArgs: []
        )
        public static let DeleteAccountButton = LocaliciousData(
            accessibilityIdentifier: "DeleteAccount.DeleteAccountButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteAccount.DeleteAccountButton.COPY",
            translationArgs: []
        )
    }
    public struct OneTimePassword {
        public struct GenerateError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "OneTimePassword.GenerateError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "OneTimePassword.GenerateError.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "OneTimePassword.GenerateError.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "OneTimePassword.GenerateError.Description.COPY",
                translationArgs: []
            )
        }
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "OneTimePassword.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "OneTimePassword.Title.COPY",
            translationArgs: []
        )
        public static let Description = LocaliciousData(
            accessibilityIdentifier: "OneTimePassword.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "OneTimePassword.Description.COPY",
            translationArgs: []
        )
        public static let YourId = LocaliciousData(
            accessibilityIdentifier: "OneTimePassword.YourId",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "OneTimePassword.YourId.COPY",
            translationArgs: []
        )
        public static let OneTimePassword = LocaliciousData(
            accessibilityIdentifier: "OneTimePassword.OneTimePassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "OneTimePassword.OneTimePassword.COPY",
            translationArgs: []
        )
        public struct PinNotVerified {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "OneTimePassword.PinNotVerified.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "OneTimePassword.PinNotVerified.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "OneTimePassword.PinNotVerified.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "OneTimePassword.PinNotVerified.Description.COPY",
                translationArgs: []
            )
        }
        public static let CloseButton = LocaliciousData(
            accessibilityIdentifier: "OneTimePassword.CloseButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "OneTimePassword.CloseButton.COPY",
            translationArgs: []
        )
    }
    public struct ConfirmDelete {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "ConfirmDelete.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDelete.Title.COPY",
            translationArgs: []
        )
        public static let Disclaimer = LocaliciousData(
            accessibilityIdentifier: "ConfirmDelete.Disclaimer",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDelete.Disclaimer.COPY",
            translationArgs: []
        )
        public static let TypeNameToConfirm = LocaliciousData(
            accessibilityIdentifier: "ConfirmDelete.TypeNameToConfirm",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDelete.TypeNameToConfirm.COPY",
            translationArgs: []
        )
        public static let YourFullNameLabel = LocaliciousData(
            accessibilityIdentifier: "ConfirmDelete.YourFullNameLabel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDelete.YourFullNameLabel.COPY",
            translationArgs: []
        )
        public static let Placeholder = LocaliciousData(
            accessibilityIdentifier: "ConfirmDelete.Placeholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDelete.Placeholder.COPY",
            translationArgs: []
        )
        public struct Button {
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "ConfirmDelete.Button.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDelete.Button.Cancel.COPY",
                translationArgs: []
            )
            public static let Confirm = LocaliciousData(
                accessibilityIdentifier: "ConfirmDelete.Button.Confirm",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDelete.Button.Confirm.COPY",
                translationArgs: []
            )
        }
        public struct NameDoesNotMatchError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ConfirmDelete.NameDoesNotMatchError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDelete.NameDoesNotMatchError.Title.COPY",
                translationArgs: []
            )
            public static func Description(args: CVarArg...) -> LocaliciousData {
                return LocaliciousData(
                accessibilityIdentifier: "ConfirmDelete.NameDoesNotMatchError.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDelete.NameDoesNotMatchError.Description.COPY",
                translationArgs: args
            )
            }
        }
        public struct DeleteError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ConfirmDelete.DeleteError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDelete.DeleteError.Title.COPY",
                translationArgs: []
            )
        }
    }
    public struct MyAccount {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "MyAccount.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.Title.COPY",
            translationArgs: []
        )
        public static let AccountCreatedOn = LocaliciousData(
            accessibilityIdentifier: "MyAccount.AccountCreatedOn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.AccountCreatedOn.COPY",
            translationArgs: []
        )
        public static let AccountCreatedAt = LocaliciousData(
            accessibilityIdentifier: "MyAccount.AccountCreatedAt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.AccountCreatedAt.COPY",
            translationArgs: []
        )
        public static let PersonalDataDisclaimer = LocaliciousData(
            accessibilityIdentifier: "MyAccount.PersonalDataDisclaimer",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.PersonalDataDisclaimer.COPY",
            translationArgs: []
        )
        public static let DownloadDataButton = LocaliciousData(
            accessibilityIdentifier: "MyAccount.DownloadDataButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.DownloadDataButton.COPY",
            translationArgs: []
        )
        public static let DeleteAccountButton = LocaliciousData(
            accessibilityIdentifier: "MyAccount.DeleteAccountButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.DeleteAccountButton.COPY",
            translationArgs: []
        )
        public static let DownloadSuccess = LocaliciousData(
            accessibilityIdentifier: "MyAccount.DownloadSuccess",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.DownloadSuccess.COPY",
            translationArgs: []
        )
        public static let DownloadError = LocaliciousData(
            accessibilityIdentifier: "MyAccount.DownloadError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MyAccount.DownloadError.COPY",
            translationArgs: []
        )
    }
    public struct Security {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Security.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.Title.COPY",
            translationArgs: []
        )
        public static let SubTitle = LocaliciousData(
            accessibilityIdentifier: "Security.SubTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.SubTitle.COPY",
            translationArgs: []
        )
        public static let OtherMethods = LocaliciousData(
            accessibilityIdentifier: "Security.OtherMethods",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.OtherMethods.COPY",
            translationArgs: []
        )
        public static let AddPassword = LocaliciousData(
            accessibilityIdentifier: "Security.AddPassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.AddPassword.COPY",
            translationArgs: []
        )
        public static let PasswordPlaceholder = LocaliciousData(
            accessibilityIdentifier: "Security.PasswordPlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.PasswordPlaceholder.COPY",
            translationArgs: []
        )
        public static let ChangePassword = LocaliciousData(
            accessibilityIdentifier: "Security.ChangePassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.ChangePassword.COPY",
            translationArgs: []
        )
        public static let TwoFAKey = LocaliciousData(
            accessibilityIdentifier: "Security.TwoFAKey",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.TwoFAKey.COPY",
            translationArgs: []
        )
        public static let ProvidedBy = LocaliciousData(
            accessibilityIdentifier: "Security.ProvidedBy",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.ProvidedBy.COPY",
            translationArgs: []
        )
        public static let NotAddedYet = LocaliciousData(
            accessibilityIdentifier: "Security.NotAddedYet",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.NotAddedYet.COPY",
            translationArgs: []
        )
        public static let NotSupported = LocaliciousData(
            accessibilityIdentifier: "Security.NotSupported",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.NotSupported.COPY",
            translationArgs: []
        )
        public static let UseMagicLink = LocaliciousData(
            accessibilityIdentifier: "Security.UseMagicLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.UseMagicLink.COPY",
            translationArgs: []
        )
        public static let AddSecurityKeyInfo = LocaliciousData(
            accessibilityIdentifier: "Security.AddSecurityKeyInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.AddSecurityKeyInfo.COPY",
            translationArgs: []
        )
        public static let RememberMeInfo = LocaliciousData(
            accessibilityIdentifier: "Security.RememberMeInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.RememberMeInfo.COPY",
            translationArgs: []
        )
        public static let NoRememberMeInfo = LocaliciousData(
            accessibilityIdentifier: "Security.NoRememberMeInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.NoRememberMeInfo.COPY",
            translationArgs: []
        )
        public static let ForgetMe = LocaliciousData(
            accessibilityIdentifier: "Security.ForgetMe",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.ForgetMe.COPY",
            translationArgs: []
        )
        public struct Tiqr {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Title.COPY",
                translationArgs: []
            )
            public static let Info = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Info",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Info.COPY",
                translationArgs: []
            )
            public static let Fetch = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Fetch",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Fetch.COPY",
                translationArgs: []
            )
            public static let Deactivate = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Deactivate",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Deactivate.COPY",
                translationArgs: []
            )
            public static let BackupCodes = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.BackupCodes",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.BackupCodes.COPY",
                translationArgs: []
            )
            public static let App = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.App",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.App.COPY",
                translationArgs: []
            )
            public static let PhoneId = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.PhoneId",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.PhoneId.COPY",
                translationArgs: []
            )
            public static let APNS = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.APNS",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.APNS.COPY",
                translationArgs: []
            )
            public static let APNS_DIRECT = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.APNS_DIRECT",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.APNS_DIRECT.COPY",
                translationArgs: []
            )
            public static let FCM = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.FCM",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.FCM.COPY",
                translationArgs: []
            )
            public static let GCM = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.GCM",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.GCM.COPY",
                translationArgs: []
            )
            public static let FCM_DIRECT = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.FCM_DIRECT",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.FCM_DIRECT.COPY",
                translationArgs: []
            )
            public static let AppCode = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.AppCode",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.AppCode.COPY",
                translationArgs: []
            )
            public static let LastLogin = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.LastLogin",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.LastLogin.COPY",
                translationArgs: []
            )
            public static let Activated = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Activated",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Activated.COPY",
                translationArgs: []
            )
            public static let DateTimeOn = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.DateTimeOn",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.DateTimeOn.COPY",
                translationArgs: []
            )
            public static let BackupMethod = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.BackupMethod",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.BackupMethod.COPY",
                translationArgs: []
            )
            public static let Sms = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Sms",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Sms.COPY",
                translationArgs: []
            )
            public static let Code = LocaliciousData(
                accessibilityIdentifier: "Security.Tiqr.Code",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Security.Tiqr.Code.COPY",
                translationArgs: []
            )
            public struct EnrollmentCompleted {
                public static let Title = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.EnrollmentCompleted.Title",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.EnrollmentCompleted.Title.COPY",
                    translationArgs: []
                )
                public static let Description = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.EnrollmentCompleted.Description",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.EnrollmentCompleted.Description.COPY",
                    translationArgs: []
                )
            }
            public struct MissingAccountDetails {
                public static let Title = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.MissingAccountDetails.Title",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.MissingAccountDetails.Title.COPY",
                    translationArgs: []
                )
                public static let Description = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.MissingAccountDetails.Description",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.MissingAccountDetails.Description.COPY",
                    translationArgs: []
                )
            }
            public struct EnrollmentIncomplete {
                public static let Title = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.EnrollmentIncomplete.Title",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.EnrollmentIncomplete.Title.COPY",
                    translationArgs: []
                )
                public static let Description = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.EnrollmentIncomplete.Description",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.EnrollmentIncomplete.Description.COPY",
                    translationArgs: []
                )
            }
            public struct AlreadyEnrolled {
                public static let Title = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.AlreadyEnrolled.Title",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.AlreadyEnrolled.Title.COPY",
                    translationArgs: []
                )
                public static let Description = LocaliciousData(
                    accessibilityIdentifier: "Security.Tiqr.AlreadyEnrolled.Description",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "Security.Tiqr.AlreadyEnrolled.Description.COPY",
                    translationArgs: []
                )
            }
        }
    }
    public struct PasswordResetLink {
        public struct Title {
            public static let AddPassword = LocaliciousData(
                accessibilityIdentifier: "PasswordResetLink.Title.AddPassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PasswordResetLink.Title.AddPassword.COPY",
                translationArgs: []
            )
            public static let ChangePassword = LocaliciousData(
                accessibilityIdentifier: "PasswordResetLink.Title.ChangePassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PasswordResetLink.Title.ChangePassword.COPY",
                translationArgs: []
            )
        }
        public struct Description {
            public static let AddPassword = LocaliciousData(
                accessibilityIdentifier: "PasswordResetLink.Description.AddPassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PasswordResetLink.Description.AddPassword.COPY",
                translationArgs: []
            )
            public static let ChangePassword = LocaliciousData(
                accessibilityIdentifier: "PasswordResetLink.Description.ChangePassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PasswordResetLink.Description.ChangePassword.COPY",
                translationArgs: []
            )
        }
        public struct Button {
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "PasswordResetLink.Button.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PasswordResetLink.Button.Cancel.COPY",
                translationArgs: []
            )
            public static let SendEmail = LocaliciousData(
                accessibilityIdentifier: "PasswordResetLink.Button.SendEmail",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PasswordResetLink.Button.SendEmail.COPY",
                translationArgs: []
            )
        }
    }
    public struct ChangePassword {
        public struct Title {
            public static let AddPassword = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Title.AddPassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Title.AddPassword.COPY",
                translationArgs: []
            )
            public static let ChangePassword = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Title.ChangePassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Title.ChangePassword.COPY",
                translationArgs: []
            )
        }
        public struct Description {
            public static let NewPassword = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Description.NewPassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Description.NewPassword.COPY",
                translationArgs: []
            )
            public static let BoldPart = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Description.BoldPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Description.BoldPart.COPY",
                translationArgs: []
            )
        }
        public static let MissingHashError = LocaliciousData(
            accessibilityIdentifier: "ChangePassword.MissingHashError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ChangePassword.MissingHashError.COPY",
            translationArgs: []
        )
        public struct Label {
            public static let NewPassword = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Label.NewPassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Label.NewPassword.COPY",
                translationArgs: []
            )
            public static let RepeatPassword = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Label.RepeatPassword",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Label.RepeatPassword.COPY",
                translationArgs: []
            )
            public static let MismatchError = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Label.MismatchError",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Label.MismatchError.COPY",
                translationArgs: []
            )
            public static let Placeholder = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Label.Placeholder",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Label.Placeholder.COPY",
                translationArgs: []
            )
        }
        public struct DeleteHeader {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.DeleteHeader.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.DeleteHeader.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.DeleteHeader.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.DeleteHeader.Description.COPY",
                translationArgs: []
            )
        }
        public struct Button {
            public static let Reset = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Button.Reset",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Button.Reset.COPY",
                translationArgs: []
            )
            public static let Add = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Button.Add",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Button.Add.COPY",
                translationArgs: []
            )
            public static let Delete = LocaliciousData(
                accessibilityIdentifier: "ChangePassword.Button.Delete",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ChangePassword.Button.Delete.COPY",
                translationArgs: []
            )
        }
    }
    public struct TwoFactorKeys {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "TwoFactorKeys.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "TwoFactorKeys.Title.COPY",
            translationArgs: []
        )
        public static let Description = LocaliciousData(
            accessibilityIdentifier: "TwoFactorKeys.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "TwoFactorKeys.Description.COPY",
            translationArgs: []
        )
        public static let YourKeys = LocaliciousData(
            accessibilityIdentifier: "TwoFactorKeys.YourKeys",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "TwoFactorKeys.YourKeys.COPY",
            translationArgs: []
        )
        public static let NoKeys = LocaliciousData(
            accessibilityIdentifier: "TwoFactorKeys.NoKeys",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "TwoFactorKeys.NoKeys.COPY",
            translationArgs: []
        )
        public struct Label {
            public static let Account = LocaliciousData(
                accessibilityIdentifier: "TwoFactorKeys.Label.Account",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "TwoFactorKeys.Label.Account.COPY",
                translationArgs: []
            )
            public static let UniqueKeyId = LocaliciousData(
                accessibilityIdentifier: "TwoFactorKeys.Label.UniqueKeyId",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "TwoFactorKeys.Label.UniqueKeyId.COPY",
                translationArgs: []
            )
            public static let UseBiometrics = LocaliciousData(
                accessibilityIdentifier: "TwoFactorKeys.Label.UseBiometrics",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "TwoFactorKeys.Label.UseBiometrics.COPY",
                translationArgs: []
            )
        }
        public static let DeleteKey = LocaliciousData(
            accessibilityIdentifier: "TwoFactorKeys.DeleteKey",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "TwoFactorKeys.DeleteKey.COPY",
            translationArgs: []
        )
    }
    public struct ConfirmDeleteKey {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "ConfirmDeleteKey.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDeleteKey.Title.COPY",
            translationArgs: []
        )
        public static let Subtitle = LocaliciousData(
            accessibilityIdentifier: "ConfirmDeleteKey.Subtitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDeleteKey.Subtitle.COPY",
            translationArgs: []
        )
        public static let Description = LocaliciousData(
            accessibilityIdentifier: "ConfirmDeleteKey.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmDeleteKey.Description.COPY",
            translationArgs: []
        )
        public struct Button {
            public static let Confirm = LocaliciousData(
                accessibilityIdentifier: "ConfirmDeleteKey.Button.Confirm",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDeleteKey.Button.Confirm.COPY",
                translationArgs: []
            )
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "ConfirmDeleteKey.Button.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ConfirmDeleteKey.Button.Cancel.COPY",
                translationArgs: []
            )
        }
    }
    public struct Home {
        public static let Home = LocaliciousData(
            accessibilityIdentifier: "Home.Home",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Home.COPY",
            translationArgs: []
        )
        public static func Welcome(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Home.Welcome",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Welcome.COPY",
            translationArgs: args
        )
        }
        public static let DataAndActivity = LocaliciousData(
            accessibilityIdentifier: "Home.DataAndActivity",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.DataAndActivity.COPY",
            translationArgs: []
        )
        public static let Personal = LocaliciousData(
            accessibilityIdentifier: "Home.Personal",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Personal.COPY",
            translationArgs: []
        )
        public static let Security = LocaliciousData(
            accessibilityIdentifier: "Home.Security",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Security.COPY",
            translationArgs: []
        )
        public static let Account = LocaliciousData(
            accessibilityIdentifier: "Home.Account",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Account.COPY",
            translationArgs: []
        )
        public static let Institutions = LocaliciousData(
            accessibilityIdentifier: "Home.Institutions",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Institutions.COPY",
            translationArgs: []
        )
        public static let Services = LocaliciousData(
            accessibilityIdentifier: "Home.Services",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Services.COPY",
            translationArgs: []
        )
        public static let Favorites = LocaliciousData(
            accessibilityIdentifier: "Home.Favorites",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Favorites.COPY",
            translationArgs: []
        )
        public static let Settings = LocaliciousData(
            accessibilityIdentifier: "Home.Settings",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Home.Settings.COPY",
            translationArgs: []
        )
        public struct Links {
            public static let Teams = LocaliciousData(
                accessibilityIdentifier: "Home.Links.Teams",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Home.Links.Teams.COPY",
                translationArgs: []
            )
            public static func TeamsHref(args: CVarArg...) -> LocaliciousData {
                return LocaliciousData(
                accessibilityIdentifier: "Home.Links.TeamsHref",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Home.Links.TeamsHref.COPY",
                translationArgs: args
            )
            }
        }
    }
    public struct Account {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Account.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Title.COPY",
            translationArgs: []
        )
        public static let TitleDelete = LocaliciousData(
            accessibilityIdentifier: "Account.TitleDelete",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.TitleDelete.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Account.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Info.COPY",
            translationArgs: []
        )
        public static let Created = LocaliciousData(
            accessibilityIdentifier: "Account.Created",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Created.COPY",
            translationArgs: []
        )
        public static let Delete = LocaliciousData(
            accessibilityIdentifier: "Account.Delete",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Delete.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Account.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Cancel.COPY",
            translationArgs: []
        )
        public static let DeleteInfo = LocaliciousData(
            accessibilityIdentifier: "Account.DeleteInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DeleteInfo.COPY",
            translationArgs: []
        )
        public static let Data = LocaliciousData(
            accessibilityIdentifier: "Account.Data",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Data.COPY",
            translationArgs: []
        )
        public static let PersonalInfo = LocaliciousData(
            accessibilityIdentifier: "Account.PersonalInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.PersonalInfo.COPY",
            translationArgs: []
        )
        public static let DownloadData = LocaliciousData(
            accessibilityIdentifier: "Account.DownloadData",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DownloadData.COPY",
            translationArgs: []
        )
        public static let DownloadDataConfirmation = LocaliciousData(
            accessibilityIdentifier: "Account.DownloadDataConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DownloadDataConfirmation.COPY",
            translationArgs: []
        )
        public static let DeleteTitle = LocaliciousData(
            accessibilityIdentifier: "Account.DeleteTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DeleteTitle.COPY",
            translationArgs: []
        )
        public static let Info1 = LocaliciousData(
            accessibilityIdentifier: "Account.Info1",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Info1.COPY",
            translationArgs: []
        )
        public static let Info2 = LocaliciousData(
            accessibilityIdentifier: "Account.Info2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Info2.COPY",
            translationArgs: []
        )
        public static let Info3 = LocaliciousData(
            accessibilityIdentifier: "Account.Info3",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Info3.COPY",
            translationArgs: []
        )
        public static let Info4 = LocaliciousData(
            accessibilityIdentifier: "Account.Info4",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Info4.COPY",
            translationArgs: []
        )
        public static let DeleteAccount = LocaliciousData(
            accessibilityIdentifier: "Account.DeleteAccount",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DeleteAccount.COPY",
            translationArgs: []
        )
        public static let DeleteAccountConfirmation = LocaliciousData(
            accessibilityIdentifier: "Account.DeleteAccountConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DeleteAccountConfirmation.COPY",
            translationArgs: []
        )
        public static let DeleteAccountSure = LocaliciousData(
            accessibilityIdentifier: "Account.DeleteAccountSure",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DeleteAccountSure.COPY",
            translationArgs: []
        )
        public static let DeleteAccountWarning = LocaliciousData(
            accessibilityIdentifier: "Account.DeleteAccountWarning",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.DeleteAccountWarning.COPY",
            translationArgs: []
        )
        public static let Proceed = LocaliciousData(
            accessibilityIdentifier: "Account.Proceed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Proceed.COPY",
            translationArgs: []
        )
        public static let Name = LocaliciousData(
            accessibilityIdentifier: "Account.Name",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.Name.COPY",
            translationArgs: []
        )
        public static let NamePlaceholder = LocaliciousData(
            accessibilityIdentifier: "Account.NamePlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Account.NamePlaceholder.COPY",
            translationArgs: []
        )
    }
    public struct DataActivity {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Info.COPY",
            translationArgs: []
        )
        public static let ExplainIcon = LocaliciousData(
            accessibilityIdentifier: "DataActivity.ExplainIcon",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.ExplainIcon.COPY",
            translationArgs: []
        )
        public static let AppsHeader = LocaliciousData(
            accessibilityIdentifier: "DataActivity.AppsHeader",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.AppsHeader.COPY",
            translationArgs: []
        )
        public static let NoServices = LocaliciousData(
            accessibilityIdentifier: "DataActivity.NoServices",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.NoServices.COPY",
            translationArgs: []
        )
        public static let Name = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Name",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Name.COPY",
            translationArgs: []
        )
        public static let Add = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Add",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Add.COPY",
            translationArgs: []
        )
        public static let Access = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Access",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Access.COPY",
            translationArgs: []
        )
        public struct Details {
            public static let On = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.On",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.On.COPY",
                translationArgs: []
            )
            public static let Login = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Login",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Login.COPY",
                translationArgs: []
            )
            public static let Delete = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Delete",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Delete.COPY",
                translationArgs: []
            )
            public static let FirstLogin = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.FirstLogin",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.FirstLogin.COPY",
                translationArgs: []
            )
            public static let UniqueEduID = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.UniqueEduID",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.UniqueEduID.COPY",
                translationArgs: []
            )
            public static let HomePage = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.HomePage",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.HomePage.COPY",
                translationArgs: []
            )
            public static let DeleteDisclaimer = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.DeleteDisclaimer",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.DeleteDisclaimer.COPY",
                translationArgs: []
            )
            public static let Access = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Access",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Access.COPY",
                translationArgs: []
            )
            public static let Details = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Details",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Details.COPY",
                translationArgs: []
            )
            public static let Consent = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Consent",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Consent.COPY",
                translationArgs: []
            )
            public static let Expires = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Expires",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Expires.COPY",
                translationArgs: []
            )
            public static let Revoke = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.Revoke",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.Revoke.COPY",
                translationArgs: []
            )
        }
    }
    public struct DeleteService {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "DeleteService.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteService.Title.COPY",
            translationArgs: []
        )
        public static let Description = LocaliciousData(
            accessibilityIdentifier: "DeleteService.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteService.Description.COPY",
            translationArgs: []
        )
        public struct Button {
            public static let Confirm = LocaliciousData(
                accessibilityIdentifier: "DeleteService.Button.Confirm",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DeleteService.Button.Confirm.COPY",
                translationArgs: []
            )
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "DeleteService.Button.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DeleteService.Button.Cancel.COPY",
                translationArgs: []
            )
        }
        public static let Error = LocaliciousData(
            accessibilityIdentifier: "DeleteService.Error",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DeleteService.Error.COPY",
            translationArgs: []
        )
    }
    public struct RevokeAccessToken {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "RevokeAccessToken.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RevokeAccessToken.Title.COPY",
            translationArgs: []
        )
        public static func Description(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "RevokeAccessToken.Description",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RevokeAccessToken.Description.COPY",
            translationArgs: args
        )
        }
        public struct Button {
            public static let Confirm = LocaliciousData(
                accessibilityIdentifier: "RevokeAccessToken.Button.Confirm",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "RevokeAccessToken.Button.Confirm.COPY",
                translationArgs: []
            )
            public static let Cancel = LocaliciousData(
                accessibilityIdentifier: "RevokeAccessToken.Button.Cancel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "RevokeAccessToken.Button.Cancel.COPY",
                translationArgs: []
            )
        }
        public static let Error = LocaliciousData(
            accessibilityIdentifier: "RevokeAccessToken.Error",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RevokeAccessToken.Error.COPY",
            translationArgs: []
        )
    }
    public struct Institution {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Institution.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Title.COPY",
            translationArgs: []
        )
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Institution.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Info.COPY",
            translationArgs: args
        )
        }
        public static let Name = LocaliciousData(
            accessibilityIdentifier: "Institution.Name",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Name.COPY",
            translationArgs: []
        )
        public static let Eppn = LocaliciousData(
            accessibilityIdentifier: "Institution.Eppn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Eppn.COPY",
            translationArgs: []
        )
        public static let DisplayName = LocaliciousData(
            accessibilityIdentifier: "Institution.DisplayName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.DisplayName.COPY",
            translationArgs: []
        )
        public static let Affiliations = LocaliciousData(
            accessibilityIdentifier: "Institution.Affiliations",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Affiliations.COPY",
            translationArgs: []
        )
        public static let Expires = LocaliciousData(
            accessibilityIdentifier: "Institution.Expires",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Expires.COPY",
            translationArgs: []
        )
        public static func ExpiresValue(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Institution.ExpiresValue",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.ExpiresValue.COPY",
            translationArgs: args
        )
        }
        public static let Delete = LocaliciousData(
            accessibilityIdentifier: "Institution.Delete",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Delete.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Institution.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Cancel.COPY",
            translationArgs: []
        )
        public static func Deleted(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Institution.Deleted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Deleted.COPY",
            translationArgs: args
        )
        }
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Institution.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.Back.COPY",
            translationArgs: []
        )
        public static let DeleteInstitution = LocaliciousData(
            accessibilityIdentifier: "Institution.DeleteInstitution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.DeleteInstitution.COPY",
            translationArgs: []
        )
        public static let DeleteInstitutionConfirmation = LocaliciousData(
            accessibilityIdentifier: "Institution.DeleteInstitutionConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Institution.DeleteInstitutionConfirmation.COPY",
            translationArgs: []
        )
    }
    public struct Credential {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Credential.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Title.COPY",
            translationArgs: []
        )
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Credential.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Info.COPY",
            translationArgs: args
        )
        }
        public static let Name = LocaliciousData(
            accessibilityIdentifier: "Credential.Name",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Name.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Credential.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Cancel.COPY",
            translationArgs: []
        )
        public static let Update = LocaliciousData(
            accessibilityIdentifier: "Credential.Update",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Update.COPY",
            translationArgs: []
        )
        public static func Deleted(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Credential.Deleted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Deleted.COPY",
            translationArgs: args
        )
        }
        public static func Updated(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Credential.Updated",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Updated.COPY",
            translationArgs: args
        )
        }
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Credential.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.Back.COPY",
            translationArgs: []
        )
        public static let DeleteCredential = LocaliciousData(
            accessibilityIdentifier: "Credential.DeleteCredential",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.DeleteCredential.COPY",
            translationArgs: []
        )
        public static func DeleteCredentialConfirmation(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Credential.DeleteCredentialConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Credential.DeleteCredentialConfirmation.COPY",
            translationArgs: args
        )
        }
    }
    public struct Password {
        public static let AddTitle = LocaliciousData(
            accessibilityIdentifier: "Password.AddTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.AddTitle.COPY",
            translationArgs: []
        )
        public static let UpdateTitle = LocaliciousData(
            accessibilityIdentifier: "Password.UpdateTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.UpdateTitle.COPY",
            translationArgs: []
        )
        public static let AddInfo = LocaliciousData(
            accessibilityIdentifier: "Password.AddInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.AddInfo.COPY",
            translationArgs: []
        )
        public static let UpdateInfo = LocaliciousData(
            accessibilityIdentifier: "Password.UpdateInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.UpdateInfo.COPY",
            translationArgs: []
        )
        public static let ResetTitle = LocaliciousData(
            accessibilityIdentifier: "Password.ResetTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.ResetTitle.COPY",
            translationArgs: []
        )
        public static let NewPassword = LocaliciousData(
            accessibilityIdentifier: "Password.NewPassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.NewPassword.COPY",
            translationArgs: []
        )
        public static let ConfirmPassword = LocaliciousData(
            accessibilityIdentifier: "Password.ConfirmPassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.ConfirmPassword.COPY",
            translationArgs: []
        )
        public static let SetUpdate = LocaliciousData(
            accessibilityIdentifier: "Password.SetUpdate",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.SetUpdate.COPY",
            translationArgs: []
        )
        public static let UpdateUpdate = LocaliciousData(
            accessibilityIdentifier: "Password.UpdateUpdate",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.UpdateUpdate.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Password.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.Cancel.COPY",
            translationArgs: []
        )
        public static let Set = LocaliciousData(
            accessibilityIdentifier: "Password.Set",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.Set.COPY",
            translationArgs: []
        )
        public static let Reset = LocaliciousData(
            accessibilityIdentifier: "Password.Reset",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.Reset.COPY",
            translationArgs: []
        )
        public static let Updated = LocaliciousData(
            accessibilityIdentifier: "Password.Updated",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.Updated.COPY",
            translationArgs: []
        )
        public static let Deleted = LocaliciousData(
            accessibilityIdentifier: "Password.Deleted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.Deleted.COPY",
            translationArgs: []
        )
        public static let DeletePassword = LocaliciousData(
            accessibilityIdentifier: "Password.DeletePassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.DeletePassword.COPY",
            translationArgs: []
        )
        public static let DeletePasswordConfirmation = LocaliciousData(
            accessibilityIdentifier: "Password.DeletePasswordConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.DeletePasswordConfirmation.COPY",
            translationArgs: []
        )
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Password.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.Back.COPY",
            translationArgs: []
        )
        public static let PasswordDisclaimer = LocaliciousData(
            accessibilityIdentifier: "Password.PasswordDisclaimer",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.PasswordDisclaimer.COPY",
            translationArgs: []
        )
        public static let InvalidCurrentPassword = LocaliciousData(
            accessibilityIdentifier: "Password.InvalidCurrentPassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.InvalidCurrentPassword.COPY",
            translationArgs: []
        )
        public static let PasswordResetHashExpired = LocaliciousData(
            accessibilityIdentifier: "Password.PasswordResetHashExpired",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.PasswordResetHashExpired.COPY",
            translationArgs: []
        )
        public static let ForgotPassword = LocaliciousData(
            accessibilityIdentifier: "Password.ForgotPassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.ForgotPassword.COPY",
            translationArgs: []
        )
        public static let PasswordResetSendAgain = LocaliciousData(
            accessibilityIdentifier: "Password.PasswordResetSendAgain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.PasswordResetSendAgain.COPY",
            translationArgs: []
        )
        public static let ForgotPasswordConfirmation = LocaliciousData(
            accessibilityIdentifier: "Password.ForgotPasswordConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.ForgotPasswordConfirmation.COPY",
            translationArgs: []
        )
        public static let OutstandingEmailReset = LocaliciousData(
            accessibilityIdentifier: "Password.OutstandingEmailReset",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.OutstandingEmailReset.COPY",
            translationArgs: []
        )
        public static let OutstandingEmailResetConfirmation = LocaliciousData(
            accessibilityIdentifier: "Password.OutstandingEmailResetConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Password.OutstandingEmailResetConfirmation.COPY",
            translationArgs: []
        )
        public struct Flash {
            public static func PasswordLink(args: CVarArg...) -> LocaliciousData {
                return LocaliciousData(
                accessibilityIdentifier: "Password.Flash.PasswordLink",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Password.Flash.PasswordLink.COPY",
                translationArgs: args
            )
            }
        }
    }
    public struct Webauthn {
        public static let SetTitle = LocaliciousData(
            accessibilityIdentifier: "Webauthn.SetTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.SetTitle.COPY",
            translationArgs: []
        )
        public static let UpdateTitle = LocaliciousData(
            accessibilityIdentifier: "Webauthn.UpdateTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.UpdateTitle.COPY",
            translationArgs: []
        )
        public static let PublicKeys = LocaliciousData(
            accessibilityIdentifier: "Webauthn.PublicKeys",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.PublicKeys.COPY",
            translationArgs: []
        )
        public static let NoPublicKeys = LocaliciousData(
            accessibilityIdentifier: "Webauthn.NoPublicKeys",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.NoPublicKeys.COPY",
            translationArgs: []
        )
        public static let NameRequired = LocaliciousData(
            accessibilityIdentifier: "Webauthn.NameRequired",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.NameRequired.COPY",
            translationArgs: []
        )
        public static let Revoke = LocaliciousData(
            accessibilityIdentifier: "Webauthn.Revoke",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.Revoke.COPY",
            translationArgs: []
        )
        public static let AddDevice = LocaliciousData(
            accessibilityIdentifier: "Webauthn.AddDevice",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.AddDevice.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Webauthn.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.Info.COPY",
            translationArgs: []
        )
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Webauthn.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.Back.COPY",
            translationArgs: []
        )
        public static let SetUpdate = LocaliciousData(
            accessibilityIdentifier: "Webauthn.SetUpdate",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.SetUpdate.COPY",
            translationArgs: []
        )
        public static let UpdateUpdate = LocaliciousData(
            accessibilityIdentifier: "Webauthn.UpdateUpdate",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.UpdateUpdate.COPY",
            translationArgs: []
        )
        public static let CredentialName = LocaliciousData(
            accessibilityIdentifier: "Webauthn.CredentialName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.CredentialName.COPY",
            translationArgs: []
        )
        public static let CredentialNamePlaceholder = LocaliciousData(
            accessibilityIdentifier: "Webauthn.CredentialNamePlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.CredentialNamePlaceholder.COPY",
            translationArgs: []
        )
        public static let Test = LocaliciousData(
            accessibilityIdentifier: "Webauthn.Test",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.Test.COPY",
            translationArgs: []
        )
        public static let TestInfo = LocaliciousData(
            accessibilityIdentifier: "Webauthn.TestInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.TestInfo.COPY",
            translationArgs: []
        )
        public static let TestFlash = LocaliciousData(
            accessibilityIdentifier: "Webauthn.TestFlash",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Webauthn.TestFlash.COPY",
            translationArgs: []
        )
    }
    public struct RememberMe {
        public static let Yes = LocaliciousData(
            accessibilityIdentifier: "RememberMe.Yes",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RememberMe.Yes.COPY",
            translationArgs: []
        )
        public static let No = LocaliciousData(
            accessibilityIdentifier: "RememberMe.No",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RememberMe.No.COPY",
            translationArgs: []
        )
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "RememberMe.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RememberMe.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "RememberMe.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RememberMe.Info.COPY",
            translationArgs: []
        )
    }
    public struct Footer {
        public static let Privacy = LocaliciousData(
            accessibilityIdentifier: "Footer.Privacy",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Footer.Privacy.COPY",
            translationArgs: []
        )
        public static let Terms = LocaliciousData(
            accessibilityIdentifier: "Footer.Terms",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Footer.Terms.COPY",
            translationArgs: []
        )
        public static let Help = LocaliciousData(
            accessibilityIdentifier: "Footer.Help",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Footer.Help.COPY",
            translationArgs: []
        )
        public static let PoweredBy = LocaliciousData(
            accessibilityIdentifier: "Footer.PoweredBy",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Footer.PoweredBy.COPY",
            translationArgs: []
        )
    }
    public struct Modal {
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "Modal.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Modal.Cancel.COPY",
            translationArgs: []
        )
        public static let Confirm = LocaliciousData(
            accessibilityIdentifier: "Modal.Confirm",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Modal.Confirm.COPY",
            translationArgs: []
        )
    }
    public struct Format {
        public static func CreationDate(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Format.CreationDate",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Format.CreationDate.COPY",
            translationArgs: args
        )
        }
    }
    public struct GetApp {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "GetApp.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "GetApp.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.Info.COPY",
            translationArgs: []
        )
        public static let Google = LocaliciousData(
            accessibilityIdentifier: "GetApp.Google",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.Google.COPY",
            translationArgs: []
        )
        public static let Apple = LocaliciousData(
            accessibilityIdentifier: "GetApp.Apple",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.Apple.COPY",
            translationArgs: []
        )
        public static let After = LocaliciousData(
            accessibilityIdentifier: "GetApp.After",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.After.COPY",
            translationArgs: []
        )
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "GetApp.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.Back.COPY",
            translationArgs: []
        )
        public static let Next = LocaliciousData(
            accessibilityIdentifier: "GetApp.Next",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "GetApp.Next.COPY",
            translationArgs: []
        )
    }
    public struct Sms {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Sms.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Sms.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.Info.COPY",
            translationArgs: []
        )
        public static let CodeIncorrect = LocaliciousData(
            accessibilityIdentifier: "Sms.CodeIncorrect",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.CodeIncorrect.COPY",
            translationArgs: []
        )
        public static let SendSMSAgain = LocaliciousData(
            accessibilityIdentifier: "Sms.SendSMSAgain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.SendSMSAgain.COPY",
            translationArgs: []
        )
        public static let MaxAttemptsPre = LocaliciousData(
            accessibilityIdentifier: "Sms.MaxAttemptsPre",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.MaxAttemptsPre.COPY",
            translationArgs: []
        )
        public static let MaxAttemptsPost = LocaliciousData(
            accessibilityIdentifier: "Sms.MaxAttemptsPost",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.MaxAttemptsPost.COPY",
            translationArgs: []
        )
        public static let Here = LocaliciousData(
            accessibilityIdentifier: "Sms.Here",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Sms.Here.COPY",
            translationArgs: []
        )
    }
    public struct EnrollApp {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "EnrollApp.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EnrollApp.Header.COPY",
            translationArgs: []
        )
    }
    public struct Recovery {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Recovery.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Recovery.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Info.COPY",
            translationArgs: []
        )
        public static let Methods = LocaliciousData(
            accessibilityIdentifier: "Recovery.Methods",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Methods.COPY",
            translationArgs: []
        )
        public static let PhoneNumber = LocaliciousData(
            accessibilityIdentifier: "Recovery.PhoneNumber",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.PhoneNumber.COPY",
            translationArgs: []
        )
        public static let PhoneNumberInfo = LocaliciousData(
            accessibilityIdentifier: "Recovery.PhoneNumberInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.PhoneNumberInfo.COPY",
            translationArgs: []
        )
        public static let BackupCode = LocaliciousData(
            accessibilityIdentifier: "Recovery.BackupCode",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.BackupCode.COPY",
            translationArgs: []
        )
        public static let BackupCodeInfo = LocaliciousData(
            accessibilityIdentifier: "Recovery.BackupCodeInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.BackupCodeInfo.COPY",
            translationArgs: []
        )
        public static let Save = LocaliciousData(
            accessibilityIdentifier: "Recovery.Save",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Save.COPY",
            translationArgs: []
        )
        public static let Active = LocaliciousData(
            accessibilityIdentifier: "Recovery.Active",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Active.COPY",
            translationArgs: []
        )
        public static let Copy = LocaliciousData(
            accessibilityIdentifier: "Recovery.Copy",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Copy.COPY",
            translationArgs: []
        )
        public static let Copied = LocaliciousData(
            accessibilityIdentifier: "Recovery.Copied",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Copied.COPY",
            translationArgs: []
        )
        public static let Continue = LocaliciousData(
            accessibilityIdentifier: "Recovery.Continue",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.Continue.COPY",
            translationArgs: []
        )
        public static let LeaveConfirmation = LocaliciousData(
            accessibilityIdentifier: "Recovery.LeaveConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Recovery.LeaveConfirmation.COPY",
            translationArgs: []
        )
    }
    public struct PhoneVerification {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "PhoneVerification.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PhoneVerification.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "PhoneVerification.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PhoneVerification.Info.COPY",
            translationArgs: []
        )
        public static let Text = LocaliciousData(
            accessibilityIdentifier: "PhoneVerification.Text",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PhoneVerification.Text.COPY",
            translationArgs: []
        )
        public static let Verify = LocaliciousData(
            accessibilityIdentifier: "PhoneVerification.Verify",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PhoneVerification.Verify.COPY",
            translationArgs: []
        )
        public static let PlaceHolder = LocaliciousData(
            accessibilityIdentifier: "PhoneVerification.PlaceHolder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PhoneVerification.PlaceHolder.COPY",
            translationArgs: []
        )
        public static let PhoneIncorrect = LocaliciousData(
            accessibilityIdentifier: "PhoneVerification.PhoneIncorrect",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PhoneVerification.PhoneIncorrect.COPY",
            translationArgs: []
        )
    }
    public struct Congrats {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Congrats.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Congrats.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Congrats.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Congrats.Info.COPY",
            translationArgs: []
        )
        public static func Next(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Congrats.Next",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Congrats.Next.COPY",
            translationArgs: args
        )
        }
    }
    public struct Deactivate {
        public static let TitleDelete = LocaliciousData(
            accessibilityIdentifier: "Deactivate.TitleDelete",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.TitleDelete.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Deactivate.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.Info.COPY",
            translationArgs: []
        )
        public static let RecoveryCode = LocaliciousData(
            accessibilityIdentifier: "Deactivate.RecoveryCode",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.RecoveryCode.COPY",
            translationArgs: []
        )
        public static let RecoveryCodeInfo = LocaliciousData(
            accessibilityIdentifier: "Deactivate.RecoveryCodeInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.RecoveryCodeInfo.COPY",
            translationArgs: []
        )
        public static let VerificationCode = LocaliciousData(
            accessibilityIdentifier: "Deactivate.VerificationCode",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.VerificationCode.COPY",
            translationArgs: []
        )
        public static let CodeIncorrect = LocaliciousData(
            accessibilityIdentifier: "Deactivate.CodeIncorrect",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.CodeIncorrect.COPY",
            translationArgs: []
        )
        public static let Next = LocaliciousData(
            accessibilityIdentifier: "Deactivate.Next",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.Next.COPY",
            translationArgs: []
        )
        public static let DeactivateApp = LocaliciousData(
            accessibilityIdentifier: "Deactivate.DeactivateApp",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.DeactivateApp.COPY",
            translationArgs: []
        )
        public static let SendSms = LocaliciousData(
            accessibilityIdentifier: "Deactivate.SendSms",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.SendSms.COPY",
            translationArgs: []
        )
        public static let MaxAttempts = LocaliciousData(
            accessibilityIdentifier: "Deactivate.MaxAttempts",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Deactivate.MaxAttempts.COPY",
            translationArgs: []
        )
    }
    public struct BackupCodes {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "BackupCodes.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "BackupCodes.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "BackupCodes.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "BackupCodes.Info.COPY",
            translationArgs: []
        )
        public static let PhoneNumber = LocaliciousData(
            accessibilityIdentifier: "BackupCodes.PhoneNumber",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "BackupCodes.PhoneNumber.COPY",
            translationArgs: []
        )
        public static let StartTiqrAuthentication = LocaliciousData(
            accessibilityIdentifier: "BackupCodes.StartTiqrAuthentication",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "BackupCodes.StartTiqrAuthentication.COPY",
            translationArgs: []
        )
        public static let Code = LocaliciousData(
            accessibilityIdentifier: "BackupCodes.Code",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "BackupCodes.Code.COPY",
            translationArgs: []
        )
    }
    public struct UseApp {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "UseApp.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "UseApp.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Info.COPY",
            translationArgs: []
        )
        public static let Scan = LocaliciousData(
            accessibilityIdentifier: "UseApp.Scan",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Scan.COPY",
            translationArgs: []
        )
        public static let NoNotification = LocaliciousData(
            accessibilityIdentifier: "UseApp.NoNotification",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.NoNotification.COPY",
            translationArgs: []
        )
        public static let QrCodeLink = LocaliciousData(
            accessibilityIdentifier: "UseApp.QrCodeLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.QrCodeLink.COPY",
            translationArgs: []
        )
        public static let QrCodePostfix = LocaliciousData(
            accessibilityIdentifier: "UseApp.QrCodePostfix",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.QrCodePostfix.COPY",
            translationArgs: []
        )
        public static let Offline = LocaliciousData(
            accessibilityIdentifier: "UseApp.Offline",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Offline.COPY",
            translationArgs: []
        )
        public static let OfflineLink = LocaliciousData(
            accessibilityIdentifier: "UseApp.OfflineLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.OfflineLink.COPY",
            translationArgs: []
        )
        public static let OpenEduIDApp = LocaliciousData(
            accessibilityIdentifier: "UseApp.OpenEduIDApp",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.OpenEduIDApp.COPY",
            translationArgs: []
        )
        public static let Lost = LocaliciousData(
            accessibilityIdentifier: "UseApp.Lost",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Lost.COPY",
            translationArgs: []
        )
        public static let LostLink = LocaliciousData(
            accessibilityIdentifier: "UseApp.LostLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.LostLink.COPY",
            translationArgs: []
        )
        public static let TimeOut = LocaliciousData(
            accessibilityIdentifier: "UseApp.TimeOut",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.TimeOut.COPY",
            translationArgs: []
        )
        public static let TimeOutInfoFirst = LocaliciousData(
            accessibilityIdentifier: "UseApp.TimeOutInfoFirst",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.TimeOutInfoFirst.COPY",
            translationArgs: []
        )
        public static let TimeOutInfoLast = LocaliciousData(
            accessibilityIdentifier: "UseApp.TimeOutInfoLast",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.TimeOutInfoLast.COPY",
            translationArgs: []
        )
        public static let TimeOutInfoLink = LocaliciousData(
            accessibilityIdentifier: "UseApp.TimeOutInfoLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.TimeOutInfoLink.COPY",
            translationArgs: []
        )
        public static let ResponseIncorrect = LocaliciousData(
            accessibilityIdentifier: "UseApp.ResponseIncorrect",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.ResponseIncorrect.COPY",
            translationArgs: []
        )
        public static let SuspendedResult = LocaliciousData(
            accessibilityIdentifier: "UseApp.SuspendedResult",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.SuspendedResult.COPY",
            translationArgs: []
        )
        public static let AccountNotSuspended = LocaliciousData(
            accessibilityIdentifier: "UseApp.AccountNotSuspended",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.AccountNotSuspended.COPY",
            translationArgs: []
        )
        public static func AccountSuspended(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "UseApp.AccountSuspended",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.AccountSuspended.COPY",
            translationArgs: args
        )
        }
        public static let Minutes = LocaliciousData(
            accessibilityIdentifier: "UseApp.Minutes",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Minutes.COPY",
            translationArgs: []
        )
        public static let Minute = LocaliciousData(
            accessibilityIdentifier: "UseApp.Minute",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseApp.Minute.COPY",
            translationArgs: []
        )
    }
    public struct CreateFromInstitution {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.Title.COPY",
            translationArgs: []
        )
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.Header.COPY",
            translationArgs: []
        )
        public static func AlreadyHaveAnEduID(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.AlreadyHaveAnEduID",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.AlreadyHaveAnEduID.COPY",
            translationArgs: args
        )
        }
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.Info.COPY",
            translationArgs: []
        )
        public static let StartFlow = LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.StartFlow",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.StartFlow.COPY",
            translationArgs: []
        )
        public static let Welcome = LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.Welcome",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.Welcome.COPY",
            translationArgs: []
        )
        public static let WelcomeExisting = LocaliciousData(
            accessibilityIdentifier: "CreateFromInstitution.WelcomeExisting",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "CreateFromInstitution.WelcomeExisting.COPY",
            translationArgs: []
        )
    }
    public struct LinkFromInstitution {
        public static func Header(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.Header.COPY",
            translationArgs: args
        )
        }
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.Info.COPY",
            translationArgs: []
        )
        public static let Email = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.Email",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.Email.COPY",
            translationArgs: []
        )
        public static let EmailPlaceholder = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.EmailPlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.EmailPlaceholder.COPY",
            translationArgs: []
        )
        public static let EmailForbidden = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.EmailForbidden",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.EmailForbidden.COPY",
            translationArgs: []
        )
        public static let EmailInUse1 = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.EmailInUse1",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.EmailInUse1.COPY",
            translationArgs: []
        )
        public static let EmailInUse2 = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.EmailInUse2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.EmailInUse2.COPY",
            translationArgs: []
        )
        public static let EmailInUse3 = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.EmailInUse3",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.EmailInUse3.COPY",
            translationArgs: []
        )
        public static let InvalidEmail = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.InvalidEmail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.InvalidEmail.COPY",
            translationArgs: []
        )
        public static let InstitutionDomainNameWarning = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.InstitutionDomainNameWarning",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.InstitutionDomainNameWarning.COPY",
            translationArgs: []
        )
        public static let InstitutionDomainNameWarning2 = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.InstitutionDomainNameWarning2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.InstitutionDomainNameWarning2.COPY",
            translationArgs: []
        )
        public static func AllowedDomainNamesError(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.AllowedDomainNamesError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.AllowedDomainNamesError.COPY",
            translationArgs: args
        )
        }
        public static let AllowedDomainNamesError2 = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.AllowedDomainNamesError2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.AllowedDomainNamesError2.COPY",
            translationArgs: []
        )
        public static let AgreeWithTerms = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.AgreeWithTerms",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.AgreeWithTerms.COPY",
            translationArgs: []
        )
        public static let RequestEduIdButton = LocaliciousData(
            accessibilityIdentifier: "LinkFromInstitution.RequestEduIdButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkFromInstitution.RequestEduIdButton.COPY",
            translationArgs: []
        )
    }
    public struct PollFromInstitution {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.Header.COPY",
            translationArgs: []
        )
        public static let Awaiting = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.Awaiting",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.Awaiting.COPY",
            translationArgs: []
        )
        public static let OpenGMail = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.OpenGMail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.OpenGMail.COPY",
            translationArgs: []
        )
        public static let OpenOutlook = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.OpenOutlook",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.OpenOutlook.COPY",
            translationArgs: []
        )
        public static let Spam = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.Spam",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.Spam.COPY",
            translationArgs: []
        )
        public static let LoggedIn = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.LoggedIn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.LoggedIn.COPY",
            translationArgs: []
        )
        public static let LoggedInInfo = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.LoggedInInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.LoggedInInfo.COPY",
            translationArgs: []
        )
        public static let TimeOutReached = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.TimeOutReached",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.TimeOutReached.COPY",
            translationArgs: []
        )
        public static let TimeOutReachedInfo = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.TimeOutReachedInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.TimeOutReachedInfo.COPY",
            translationArgs: []
        )
        public static let Resend = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.Resend",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.Resend.COPY",
            translationArgs: []
        )
        public static let ResendLink = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.ResendLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.ResendLink.COPY",
            translationArgs: []
        )
        public static let MailResend = LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.MailResend",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.MailResend.COPY",
            translationArgs: []
        )
    }
    public struct Login {
        public static let RequestEduId = LocaliciousData(
            accessibilityIdentifier: "Login.RequestEduId",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.RequestEduId.COPY",
            translationArgs: []
        )
        public static let RequestEduId2 = LocaliciousData(
            accessibilityIdentifier: "Login.RequestEduId2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.RequestEduId2.COPY",
            translationArgs: []
        )
        public static let LoginEduId = LocaliciousData(
            accessibilityIdentifier: "Login.LoginEduId",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.LoginEduId.COPY",
            translationArgs: []
        )
        public static let Whatis = LocaliciousData(
            accessibilityIdentifier: "Login.Whatis",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Whatis.COPY",
            translationArgs: []
        )
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Login.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Header.COPY",
            translationArgs: []
        )
        public static let HeaderSubTitle = LocaliciousData(
            accessibilityIdentifier: "Login.HeaderSubTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.HeaderSubTitle.COPY",
            translationArgs: []
        )
        public static let Header2 = LocaliciousData(
            accessibilityIdentifier: "Login.Header2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Header2.COPY",
            translationArgs: []
        )
        public static let Trust = LocaliciousData(
            accessibilityIdentifier: "Login.Trust",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Trust.COPY",
            translationArgs: []
        )
        public static let LoginOptions = LocaliciousData(
            accessibilityIdentifier: "Login.LoginOptions",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.LoginOptions.COPY",
            translationArgs: []
        )
        public static let LoginOptionsToolTip = LocaliciousData(
            accessibilityIdentifier: "Login.LoginOptionsToolTip",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.LoginOptionsToolTip.COPY",
            translationArgs: []
        )
        public static let Email = LocaliciousData(
            accessibilityIdentifier: "Login.Email",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Email.COPY",
            translationArgs: []
        )
        public static let EmailPlaceholder = LocaliciousData(
            accessibilityIdentifier: "Login.EmailPlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailPlaceholder.COPY",
            translationArgs: []
        )
        public static let PasswordPlaceholder = LocaliciousData(
            accessibilityIdentifier: "Login.PasswordPlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.PasswordPlaceholder.COPY",
            translationArgs: []
        )
        public static let FamilyName = LocaliciousData(
            accessibilityIdentifier: "Login.FamilyName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.FamilyName.COPY",
            translationArgs: []
        )
        public static let GivenName = LocaliciousData(
            accessibilityIdentifier: "Login.GivenName",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.GivenName.COPY",
            translationArgs: []
        )
        public static let FamilyNamePlaceholder = LocaliciousData(
            accessibilityIdentifier: "Login.FamilyNamePlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.FamilyNamePlaceholder.COPY",
            translationArgs: []
        )
        public static let GivenNamePlaceholder = LocaliciousData(
            accessibilityIdentifier: "Login.GivenNamePlaceholder",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.GivenNamePlaceholder.COPY",
            translationArgs: []
        )
        public static let SendMagicLink = LocaliciousData(
            accessibilityIdentifier: "Login.SendMagicLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.SendMagicLink.COPY",
            translationArgs: []
        )
        public static let LoginWebAuthn = LocaliciousData(
            accessibilityIdentifier: "Login.LoginWebAuthn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.LoginWebAuthn.COPY",
            translationArgs: []
        )
        public static let UsePassword = LocaliciousData(
            accessibilityIdentifier: "Login.UsePassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UsePassword.COPY",
            translationArgs: []
        )
        public static let UsePasswordNoWebAuthn = LocaliciousData(
            accessibilityIdentifier: "Login.UsePasswordNoWebAuthn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UsePasswordNoWebAuthn.COPY",
            translationArgs: []
        )
        public static let UseMagicLink = LocaliciousData(
            accessibilityIdentifier: "Login.UseMagicLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseMagicLink.COPY",
            translationArgs: []
        )
        public static let UseMagicLinkNoWebAuthn = LocaliciousData(
            accessibilityIdentifier: "Login.UseMagicLinkNoWebAuthn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseMagicLinkNoWebAuthn.COPY",
            translationArgs: []
        )
        public static let UseWebAuth = LocaliciousData(
            accessibilityIdentifier: "Login.UseWebAuth",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseWebAuth.COPY",
            translationArgs: []
        )
        public static let UseOr = LocaliciousData(
            accessibilityIdentifier: "Login.UseOr",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseOr.COPY",
            translationArgs: []
        )
        public static let RequestEduIdButton = LocaliciousData(
            accessibilityIdentifier: "Login.RequestEduIdButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.RequestEduIdButton.COPY",
            translationArgs: []
        )
        public static let RememberMe = LocaliciousData(
            accessibilityIdentifier: "Login.RememberMe",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.RememberMe.COPY",
            translationArgs: []
        )
        public static let Password = LocaliciousData(
            accessibilityIdentifier: "Login.Password",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Password.COPY",
            translationArgs: []
        )
        public static let PasswordForgotten = LocaliciousData(
            accessibilityIdentifier: "Login.PasswordForgotten",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.PasswordForgotten.COPY",
            translationArgs: []
        )
        public static let PasswordForgottenLink = LocaliciousData(
            accessibilityIdentifier: "Login.PasswordForgottenLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.PasswordForgottenLink.COPY",
            translationArgs: []
        )
        public static let Login = LocaliciousData(
            accessibilityIdentifier: "Login.Login",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Login.COPY",
            translationArgs: []
        )
        public static let Create = LocaliciousData(
            accessibilityIdentifier: "Login.Create",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Create.COPY",
            translationArgs: []
        )
        public static let NewTo = LocaliciousData(
            accessibilityIdentifier: "Login.NewTo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.NewTo.COPY",
            translationArgs: []
        )
        public static let CreateAccount = LocaliciousData(
            accessibilityIdentifier: "Login.CreateAccount",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.CreateAccount.COPY",
            translationArgs: []
        )
        public static let UseExistingAccount = LocaliciousData(
            accessibilityIdentifier: "Login.UseExistingAccount",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseExistingAccount.COPY",
            translationArgs: []
        )
        public static let InvalidEmail = LocaliciousData(
            accessibilityIdentifier: "Login.InvalidEmail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.InvalidEmail.COPY",
            translationArgs: []
        )
        public static func RequiredAttribute(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Login.RequiredAttribute",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.RequiredAttribute.COPY",
            translationArgs: args
        )
        }
        public static let EmailInUse1 = LocaliciousData(
            accessibilityIdentifier: "Login.EmailInUse1",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailInUse1.COPY",
            translationArgs: []
        )
        public static let EmailInUse2 = LocaliciousData(
            accessibilityIdentifier: "Login.EmailInUse2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailInUse2.COPY",
            translationArgs: []
        )
        public static let EmailInUse3 = LocaliciousData(
            accessibilityIdentifier: "Login.EmailInUse3",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailInUse3.COPY",
            translationArgs: []
        )
        public static let EmailForbidden = LocaliciousData(
            accessibilityIdentifier: "Login.EmailForbidden",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailForbidden.COPY",
            translationArgs: []
        )
        public static let EmailNotFound1 = LocaliciousData(
            accessibilityIdentifier: "Login.EmailNotFound1",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailNotFound1.COPY",
            translationArgs: []
        )
        public static let EmailNotFound2 = LocaliciousData(
            accessibilityIdentifier: "Login.EmailNotFound2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailNotFound2.COPY",
            translationArgs: []
        )
        public static let EmailNotFound3 = LocaliciousData(
            accessibilityIdentifier: "Login.EmailNotFound3",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailNotFound3.COPY",
            translationArgs: []
        )
        public static let EmailOrPasswordIncorrect = LocaliciousData(
            accessibilityIdentifier: "Login.EmailOrPasswordIncorrect",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.EmailOrPasswordIncorrect.COPY",
            translationArgs: []
        )
        public static let InstitutionDomainNameWarning = LocaliciousData(
            accessibilityIdentifier: "Login.InstitutionDomainNameWarning",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.InstitutionDomainNameWarning.COPY",
            translationArgs: []
        )
        public static let InstitutionDomainNameWarning2 = LocaliciousData(
            accessibilityIdentifier: "Login.InstitutionDomainNameWarning2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.InstitutionDomainNameWarning2.COPY",
            translationArgs: []
        )
        public static func AllowedDomainNamesError(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Login.AllowedDomainNamesError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.AllowedDomainNamesError.COPY",
            translationArgs: args
        )
        }
        public static let AllowedDomainNamesError2 = LocaliciousData(
            accessibilityIdentifier: "Login.AllowedDomainNamesError2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.AllowedDomainNamesError2.COPY",
            translationArgs: []
        )
        public static let PasswordDisclaimer = LocaliciousData(
            accessibilityIdentifier: "Login.PasswordDisclaimer",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.PasswordDisclaimer.COPY",
            translationArgs: []
        )
        public static let AlreadyGuestAccount = LocaliciousData(
            accessibilityIdentifier: "Login.AlreadyGuestAccount",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.AlreadyGuestAccount.COPY",
            translationArgs: []
        )
        public static let UsePasswordLink = LocaliciousData(
            accessibilityIdentifier: "Login.UsePasswordLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UsePasswordLink.COPY",
            translationArgs: []
        )
        public static let UseWebAuthnLink = LocaliciousData(
            accessibilityIdentifier: "Login.UseWebAuthnLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseWebAuthnLink.COPY",
            translationArgs: []
        )
        public static let AgreeWithTerms = LocaliciousData(
            accessibilityIdentifier: "Login.AgreeWithTerms",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.AgreeWithTerms.COPY",
            translationArgs: []
        )
        public static let Next = LocaliciousData(
            accessibilityIdentifier: "Login.Next",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.Next.COPY",
            translationArgs: []
        )
        public static let UseOtherAccount = LocaliciousData(
            accessibilityIdentifier: "Login.UseOtherAccount",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseOtherAccount.COPY",
            translationArgs: []
        )
        public static let NoAppAccess = LocaliciousData(
            accessibilityIdentifier: "Login.NoAppAccess",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.NoAppAccess.COPY",
            translationArgs: []
        )
        public static let NoMailAccess = LocaliciousData(
            accessibilityIdentifier: "Login.NoMailAccess",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.NoMailAccess.COPY",
            translationArgs: []
        )
        public static let ForgotPassword = LocaliciousData(
            accessibilityIdentifier: "Login.ForgotPassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.ForgotPassword.COPY",
            translationArgs: []
        )
        public static let UseAnother = LocaliciousData(
            accessibilityIdentifier: "Login.UseAnother",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.UseAnother.COPY",
            translationArgs: []
        )
        public static let OptionsLink = LocaliciousData(
            accessibilityIdentifier: "Login.OptionsLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Login.OptionsLink.COPY",
            translationArgs: []
        )
    }
    public struct Options {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Options.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.Header.COPY",
            translationArgs: []
        )
        public static let NoLogin = LocaliciousData(
            accessibilityIdentifier: "Options.NoLogin",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.NoLogin.COPY",
            translationArgs: []
        )
        public static let Learn = LocaliciousData(
            accessibilityIdentifier: "Options.Learn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.Learn.COPY",
            translationArgs: []
        )
        public static let LearnLink = LocaliciousData(
            accessibilityIdentifier: "Options.LearnLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.LearnLink.COPY",
            translationArgs: []
        )
        public static let UseApp = LocaliciousData(
            accessibilityIdentifier: "Options.UseApp",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.UseApp.COPY",
            translationArgs: []
        )
        public static let UseWebAuthn = LocaliciousData(
            accessibilityIdentifier: "Options.UseWebAuthn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.UseWebAuthn.COPY",
            translationArgs: []
        )
        public static let UseLink = LocaliciousData(
            accessibilityIdentifier: "Options.UseLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.UseLink.COPY",
            translationArgs: []
        )
        public static let UsePassword = LocaliciousData(
            accessibilityIdentifier: "Options.UsePassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Options.UsePassword.COPY",
            translationArgs: []
        )
    }
    public struct MagicLink {
        public static let OpenMailTitle = LocaliciousData(
            accessibilityIdentifier: "MagicLink.OpenMailTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.OpenMailTitle.COPY",
            translationArgs: []
        )
        public static let OpenMailDisclaimer = LocaliciousData(
            accessibilityIdentifier: "MagicLink.OpenMailDisclaimer",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.OpenMailDisclaimer.COPY",
            translationArgs: []
        )
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "MagicLink.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.Header.COPY",
            translationArgs: []
        )
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "MagicLink.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.Info.COPY",
            translationArgs: args
        )
        }
        public static let Awaiting = LocaliciousData(
            accessibilityIdentifier: "MagicLink.Awaiting",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.Awaiting.COPY",
            translationArgs: []
        )
        public static let OpenGMail = LocaliciousData(
            accessibilityIdentifier: "MagicLink.OpenGMail",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.OpenGMail.COPY",
            translationArgs: []
        )
        public static let OpenOutlook = LocaliciousData(
            accessibilityIdentifier: "MagicLink.OpenOutlook",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.OpenOutlook.COPY",
            translationArgs: []
        )
        public static let Spam = LocaliciousData(
            accessibilityIdentifier: "MagicLink.Spam",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.Spam.COPY",
            translationArgs: []
        )
        public static let LoggedIn = LocaliciousData(
            accessibilityIdentifier: "MagicLink.LoggedIn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.LoggedIn.COPY",
            translationArgs: []
        )
        public static let LoggedInInfo = LocaliciousData(
            accessibilityIdentifier: "MagicLink.LoggedInInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.LoggedInInfo.COPY",
            translationArgs: []
        )
        public static let TimeOutReached = LocaliciousData(
            accessibilityIdentifier: "MagicLink.TimeOutReached",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.TimeOutReached.COPY",
            translationArgs: []
        )
        public static let TimeOutReachedInfo = LocaliciousData(
            accessibilityIdentifier: "MagicLink.TimeOutReachedInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.TimeOutReachedInfo.COPY",
            translationArgs: []
        )
        public static let Resend = LocaliciousData(
            accessibilityIdentifier: "MagicLink.Resend",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.Resend.COPY",
            translationArgs: []
        )
        public static let ResendLink = LocaliciousData(
            accessibilityIdentifier: "MagicLink.ResendLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.ResendLink.COPY",
            translationArgs: []
        )
        public static let MailResend = LocaliciousData(
            accessibilityIdentifier: "MagicLink.MailResend",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.MailResend.COPY",
            translationArgs: []
        )
        public static let LoggedInDifferentDevice = LocaliciousData(
            accessibilityIdentifier: "MagicLink.LoggedInDifferentDevice",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.LoggedInDifferentDevice.COPY",
            translationArgs: []
        )
        public static let LoggedInDifferentDeviceInInfo = LocaliciousData(
            accessibilityIdentifier: "MagicLink.LoggedInDifferentDeviceInInfo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.LoggedInDifferentDeviceInInfo.COPY",
            translationArgs: []
        )
        public static let LoggedInDifferentDeviceInInfo2 = LocaliciousData(
            accessibilityIdentifier: "MagicLink.LoggedInDifferentDeviceInInfo2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.LoggedInDifferentDeviceInInfo2.COPY",
            translationArgs: []
        )
        public static let VerificationCodeError = LocaliciousData(
            accessibilityIdentifier: "MagicLink.VerificationCodeError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.VerificationCodeError.COPY",
            translationArgs: []
        )
        public static let Verify = LocaliciousData(
            accessibilityIdentifier: "MagicLink.Verify",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MagicLink.Verify.COPY",
            translationArgs: []
        )
    }
    public struct Confirm {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Confirm.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Confirm.Header.COPY",
            translationArgs: []
        )
        public static let Thanks = LocaliciousData(
            accessibilityIdentifier: "Confirm.Thanks",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Confirm.Thanks.COPY",
            translationArgs: []
        )
    }
    public struct ConfirmStepup {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "ConfirmStepup.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmStepup.Header.COPY",
            translationArgs: []
        )
        public static func Proceed(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "ConfirmStepup.Proceed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmStepup.Proceed.COPY",
            translationArgs: args
        )
        }
        public static let ConditionMet = LocaliciousData(
            accessibilityIdentifier: "ConfirmStepup.ConditionMet",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ConfirmStepup.ConditionMet.COPY",
            translationArgs: []
        )
    }
    public struct Stepup {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "Stepup.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Stepup.Header.COPY",
            translationArgs: []
        )
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Stepup.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Stepup.Info.COPY",
            translationArgs: args
        )
        }
        public static let Link = LocaliciousData(
            accessibilityIdentifier: "Stepup.Link",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Stepup.Link.COPY",
            translationArgs: []
        )
        public static let LinkExternalValidation = LocaliciousData(
            accessibilityIdentifier: "Stepup.LinkExternalValidation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Stepup.LinkExternalValidation.COPY",
            translationArgs: []
        )
    }
    public struct Success {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Success.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Success.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Success.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Success.Info.COPY",
            translationArgs: []
        )
    }
    public struct Expired {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "Expired.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Expired.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "Expired.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Expired.Info.COPY",
            translationArgs: []
        )
        public static let Back = LocaliciousData(
            accessibilityIdentifier: "Expired.Back",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Expired.Back.COPY",
            translationArgs: []
        )
    }
    public struct MaxAttempt {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "MaxAttempt.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MaxAttempt.Title.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "MaxAttempt.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "MaxAttempt.Info.COPY",
            translationArgs: []
        )
    }
    public struct WebAuthn {
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.Info.COPY",
            translationArgs: []
        )
        public static let BrowserPrompt = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.BrowserPrompt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.BrowserPrompt.COPY",
            translationArgs: []
        )
        public static let Start = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.Start",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.Start.COPY",
            translationArgs: []
        )
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.Header.COPY",
            translationArgs: []
        )
        public static let Explanation = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.Explanation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.Explanation.COPY",
            translationArgs: []
        )
        public static let Next = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.Next",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.Next.COPY",
            translationArgs: []
        )
        public static let Error = LocaliciousData(
            accessibilityIdentifier: "WebAuthn.Error",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthn.Error.COPY",
            translationArgs: []
        )
    }
    public struct UseLink {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "UseLink.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseLink.Header.COPY",
            translationArgs: []
        )
        public static let Next = LocaliciousData(
            accessibilityIdentifier: "UseLink.Next",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UseLink.Next.COPY",
            translationArgs: []
        )
    }
    public struct UsePassword {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "UsePassword.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UsePassword.Header.COPY",
            translationArgs: []
        )
        public static let PasswordIncorrect = LocaliciousData(
            accessibilityIdentifier: "UsePassword.PasswordIncorrect",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "UsePassword.PasswordIncorrect.COPY",
            translationArgs: []
        )
    }
    public struct WebAuthnTest {
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "WebAuthnTest.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthnTest.Info.COPY",
            translationArgs: []
        )
        public static let BrowserPrompt = LocaliciousData(
            accessibilityIdentifier: "WebAuthnTest.BrowserPrompt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthnTest.BrowserPrompt.COPY",
            translationArgs: []
        )
        public static let Start = LocaliciousData(
            accessibilityIdentifier: "WebAuthnTest.Start",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WebAuthnTest.Start.COPY",
            translationArgs: []
        )
    }
    public struct AffiliationMissing {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "AffiliationMissing.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AffiliationMissing.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "AffiliationMissing.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AffiliationMissing.Info.COPY",
            translationArgs: []
        )
        public static func Proceed(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "AffiliationMissing.Proceed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AffiliationMissing.Proceed.COPY",
            translationArgs: args
        )
        }
        public static let ProceedLink = LocaliciousData(
            accessibilityIdentifier: "AffiliationMissing.ProceedLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AffiliationMissing.ProceedLink.COPY",
            translationArgs: []
        )
        public static let RetryLink = LocaliciousData(
            accessibilityIdentifier: "AffiliationMissing.RetryLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AffiliationMissing.RetryLink.COPY",
            translationArgs: []
        )
    }
    public struct ValidNameMissing {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "ValidNameMissing.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ValidNameMissing.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "ValidNameMissing.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ValidNameMissing.Info.COPY",
            translationArgs: []
        )
        public static func Proceed(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "ValidNameMissing.Proceed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ValidNameMissing.Proceed.COPY",
            translationArgs: args
        )
        }
        public static let ProceedLink = LocaliciousData(
            accessibilityIdentifier: "ValidNameMissing.ProceedLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ValidNameMissing.ProceedLink.COPY",
            translationArgs: []
        )
        public static let RetryLink = LocaliciousData(
            accessibilityIdentifier: "ValidNameMissing.RetryLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ValidNameMissing.RetryLink.COPY",
            translationArgs: []
        )
    }
    public struct StepUpExplanation {
        public static let Linked_institution = LocaliciousData(
            accessibilityIdentifier: "StepUpExplanation.Linked_institution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "StepUpExplanation.Linked_institution.COPY",
            translationArgs: []
        )
        public static let Validate_names = LocaliciousData(
            accessibilityIdentifier: "StepUpExplanation.Validate_names",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "StepUpExplanation.Validate_names.COPY",
            translationArgs: []
        )
        public static let Affiliation_student = LocaliciousData(
            accessibilityIdentifier: "StepUpExplanation.Affiliation_student",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "StepUpExplanation.Affiliation_student.COPY",
            translationArgs: []
        )
    }
    public struct StepUpVerification {
        public static let Linked_institution = LocaliciousData(
            accessibilityIdentifier: "StepUpVerification.Linked_institution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "StepUpVerification.Linked_institution.COPY",
            translationArgs: []
        )
        public static let Validate_names = LocaliciousData(
            accessibilityIdentifier: "StepUpVerification.Validate_names",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "StepUpVerification.Validate_names.COPY",
            translationArgs: []
        )
        public static let Affiliation_student = LocaliciousData(
            accessibilityIdentifier: "StepUpVerification.Affiliation_student",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "StepUpVerification.Affiliation_student.COPY",
            translationArgs: []
        )
    }
    public struct NudgeApp {
        public static let New = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.New",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.New.COPY",
            translationArgs: []
        )
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.Header.COPY",
            translationArgs: []
        )
        public static let Info = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.Info.COPY",
            translationArgs: []
        )
        public static let No = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.No",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.No.COPY",
            translationArgs: []
        )
        public static let NoLink = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.NoLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.NoLink.COPY",
            translationArgs: []
        )
        public static let Yes = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.Yes",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.Yes.COPY",
            translationArgs: []
        )
        public static let YesLink = LocaliciousData(
            accessibilityIdentifier: "NudgeApp.YesLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "NudgeApp.YesLink.COPY",
            translationArgs: []
        )
    }
    public struct AppRequired {
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "AppRequired.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.Header.COPY",
            translationArgs: []
        )
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "AppRequired.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.Info.COPY",
            translationArgs: args
        )
        }
        public static let Info2 = LocaliciousData(
            accessibilityIdentifier: "AppRequired.Info2",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.Info2.COPY",
            translationArgs: []
        )
        public static let Cancel = LocaliciousData(
            accessibilityIdentifier: "AppRequired.Cancel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.Cancel.COPY",
            translationArgs: []
        )
        public static let No = LocaliciousData(
            accessibilityIdentifier: "AppRequired.No",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.No.COPY",
            translationArgs: []
        )
        public static let YesLink = LocaliciousData(
            accessibilityIdentifier: "AppRequired.YesLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.YesLink.COPY",
            translationArgs: []
        )
        public static let Yes = LocaliciousData(
            accessibilityIdentifier: "AppRequired.Yes",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.Yes.COPY",
            translationArgs: []
        )
        public static func Warning(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "AppRequired.Warning",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.Warning.COPY",
            translationArgs: args
        )
        }
        public static let WarningTitle = LocaliciousData(
            accessibilityIdentifier: "AppRequired.WarningTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.WarningTitle.COPY",
            translationArgs: []
        )
        public static let ConfirmLabel = LocaliciousData(
            accessibilityIdentifier: "AppRequired.ConfirmLabel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.ConfirmLabel.COPY",
            translationArgs: []
        )
        public static let CancelLabel = LocaliciousData(
            accessibilityIdentifier: "AppRequired.CancelLabel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "AppRequired.CancelLabel.COPY",
            translationArgs: []
        )
    }
    public struct SubContent {
        public static let WarningTitle = LocaliciousData(
            accessibilityIdentifier: "SubContent.WarningTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SubContent.WarningTitle.COPY",
            translationArgs: []
        )
        public static let Warning = LocaliciousData(
            accessibilityIdentifier: "SubContent.Warning",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SubContent.Warning.COPY",
            translationArgs: []
        )
        public static let ConfirmLabel = LocaliciousData(
            accessibilityIdentifier: "SubContent.ConfirmLabel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SubContent.ConfirmLabel.COPY",
            translationArgs: []
        )
        public static let CancelLabel = LocaliciousData(
            accessibilityIdentifier: "SubContent.CancelLabel",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SubContent.CancelLabel.COPY",
            translationArgs: []
        )
    }
    public struct PinAndBioMetrics {
        public static let SetupBiometrics = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SetupBiometrics",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SetupBiometrics.COPY",
            translationArgs: []
        )
        public static let Skip = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.Skip",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.Skip.COPY",
            translationArgs: []
        )
        public static let BiometricsApproval = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.BiometricsApproval",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.BiometricsApproval.COPY",
            translationArgs: []
        )
        public static let BiometricsExplain = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.BiometricsExplain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.BiometricsExplain.COPY",
            translationArgs: []
        )
        public static let BiometricsExplainBoldPart = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.BiometricsExplainBoldPart",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.BiometricsExplainBoldPart.COPY",
            translationArgs: []
        )
        public static let BiometricsPrompt = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.BiometricsPrompt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.BiometricsPrompt.COPY",
            translationArgs: []
        )
        public static let SkipAlertTitle = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SkipAlertTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SkipAlertTitle.COPY",
            translationArgs: []
        )
        public static let SkipAlertText = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SkipAlertText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SkipAlertText.COPY",
            translationArgs: []
        )
        public static let FirstPinScreenSelectTitle = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.FirstPinScreenSelectTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.FirstPinScreenSelectTitle.COPY",
            translationArgs: []
        )
        public static let PinScreenEnterTitle = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.PinScreenEnterTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.PinScreenEnterTitle.COPY",
            translationArgs: []
        )
        public static let FirstPinScreenText = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.FirstPinScreenText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.FirstPinScreenText.COPY",
            translationArgs: []
        )
        public static let SecondPinScreenSelectTitle = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SecondPinScreenSelectTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SecondPinScreenSelectTitle.COPY",
            translationArgs: []
        )
        public static let SecondPinScreenText = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SecondPinScreenText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SecondPinScreenText.COPY",
            translationArgs: []
        )
        public static let VerifyPinScreenText = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.VerifyPinScreenText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.VerifyPinScreenText.COPY",
            translationArgs: []
        )
        public static let SignIn = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SignIn",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SignIn.COPY",
            translationArgs: []
        )
        public static let OKButton = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.OKButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.OKButton.COPY",
            translationArgs: []
        )
        public static let LoginRequest = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.LoginRequest",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.LoginRequest.COPY",
            translationArgs: []
        )
        public static let DoYouWantToLogInTo = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.DoYouWantToLogInTo",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.DoYouWantToLogInTo.COPY",
            translationArgs: []
        )
        public static let EnteredPinNotEqual = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.EnteredPinNotEqual",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.EnteredPinNotEqual.COPY",
            translationArgs: []
        )
        public static let RetryPin = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.RetryPin",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.RetryPin.COPY",
            translationArgs: []
        )
        public static let VerifyPin = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.VerifyPin",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.VerifyPin.COPY",
            translationArgs: []
        )
        public struct Button {
            public static let Retry = LocaliciousData(
                accessibilityIdentifier: "PinAndBioMetrics.Button.Retry",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PinAndBioMetrics.Button.Retry.COPY",
                translationArgs: []
            )
            public static let Back = LocaliciousData(
                accessibilityIdentifier: "PinAndBioMetrics.Button.Back",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "PinAndBioMetrics.Button.Back.COPY",
                translationArgs: []
            )
        }
        public static let CheckMessages = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.CheckMessages",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.CheckMessages.COPY",
            translationArgs: []
        )
        public static let EnterSixDigitCode = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.EnterSixDigitCode",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.EnterSixDigitCode.COPY",
            translationArgs: []
        )
        public static let SixDigitCode = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.SixDigitCode",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.SixDigitCode.COPY",
            translationArgs: []
        )
        public static let Authenticate = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.Authenticate",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.Authenticate.COPY",
            translationArgs: []
        )
        public static let AuthenticateForUseTitle = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.AuthenticateForUseTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.AuthenticateForUseTitle.COPY",
            translationArgs: []
        )
    }
    public struct Generic {
        public struct RequestError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "Generic.RequestError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Generic.RequestError.Title.COPY",
                translationArgs: []
            )
            public static func Description(args: CVarArg...) -> LocaliciousData {
                return LocaliciousData(
                accessibilityIdentifier: "Generic.RequestError.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Generic.RequestError.Description.COPY",
                translationArgs: args
            )
            }
            public static let CloseButton = LocaliciousData(
                accessibilityIdentifier: "Generic.RequestError.CloseButton",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "Generic.RequestError.CloseButton.COPY",
                translationArgs: []
            )
        }
    }
    public struct WelcomeToApp {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "WelcomeToApp.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WelcomeToApp.Title.COPY",
            translationArgs: []
        )
        public struct Quickly {
            public static let Text = LocaliciousData(
                accessibilityIdentifier: "WelcomeToApp.Quickly.Text",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "WelcomeToApp.Quickly.Text.COPY",
                translationArgs: []
            )
            public static let Highlight = LocaliciousData(
                accessibilityIdentifier: "WelcomeToApp.Quickly.Highlight",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "WelcomeToApp.Quickly.Highlight.COPY",
                translationArgs: []
            )
        }
        public struct ViewWhat {
            public static let Text = LocaliciousData(
                accessibilityIdentifier: "WelcomeToApp.ViewWhat.Text",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "WelcomeToApp.ViewWhat.Text.COPY",
                translationArgs: []
            )
            public static let Highlight = LocaliciousData(
                accessibilityIdentifier: "WelcomeToApp.ViewWhat.Highlight",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "WelcomeToApp.ViewWhat.Highlight.COPY",
                translationArgs: []
            )
        }
        public struct VerifyYour {
            public static let Text = LocaliciousData(
                accessibilityIdentifier: "WelcomeToApp.VerifyYour.Text",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "WelcomeToApp.VerifyYour.Text.COPY",
                translationArgs: []
            )
            public static let Highlight = LocaliciousData(
                accessibilityIdentifier: "WelcomeToApp.VerifyYour.Highlight",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "WelcomeToApp.VerifyYour.Highlight.COPY",
                translationArgs: []
            )
        }
        public static let GotItButton = LocaliciousData(
            accessibilityIdentifier: "WelcomeToApp.GotItButton",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WelcomeToApp.GotItButton.COPY",
            translationArgs: []
        )
        public static let ReturnBrowserTitle = LocaliciousData(
            accessibilityIdentifier: "WelcomeToApp.ReturnBrowserTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WelcomeToApp.ReturnBrowserTitle.COPY",
            translationArgs: []
        )
        public static let ReturnBrowserText = LocaliciousData(
            accessibilityIdentifier: "WelcomeToApp.ReturnBrowserText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "WelcomeToApp.ReturnBrowserText.COPY",
            translationArgs: []
        )
    }
    public struct CreateEduID {
        public struct ErrorCreateFailed {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.ErrorCreateFailed.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.ErrorCreateFailed.Title.COPY",
                translationArgs: []
            )
            public static let Message = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.ErrorCreateFailed.Message",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.ErrorCreateFailed.Message.COPY",
                translationArgs: []
            )
        }
        public struct LandingPage {
            public static let MainText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.LandingPage.MainText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.LandingPage.MainText.COPY",
                translationArgs: []
            )
            public static let SignInButton = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.LandingPage.SignInButton",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.LandingPage.SignInButton.COPY",
                translationArgs: []
            )
            public static let ScanQrButton = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.LandingPage.ScanQrButton",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.LandingPage.ScanQrButton.COPY",
                translationArgs: []
            )
            public static let NoEduIdButton = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.LandingPage.NoEduIdButton",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.LandingPage.NoEduIdButton.COPY",
                translationArgs: []
            )
        }
        public struct FirstTimeDialog {
            public static let ConnectButtonTitle = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.ConnectButtonTitle",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.ConnectButtonTitle.COPY",
                translationArgs: []
            )
            public struct MainTextTitle {
                public static let FirstPart = LocaliciousData(
                    accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextTitle.FirstPart",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "CreateEduID.FirstTimeDialog.MainTextTitle.FirstPart.COPY",
                    translationArgs: []
                )
                public static let SecondPart = LocaliciousData(
                    accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextTitle.SecondPart",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "CreateEduID.FirstTimeDialog.MainTextTitle.SecondPart.COPY",
                    translationArgs: []
                )
            }
            public static let MainText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.MainText.COPY",
                translationArgs: []
            )
            public static let MainTextPoint1 = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextPoint1",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.MainTextPoint1.COPY",
                translationArgs: []
            )
            public static let MainTextPoint2 = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextPoint2",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.MainTextPoint2.COPY",
                translationArgs: []
            )
            public static let MainTextPoint3 = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextPoint3",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.MainTextPoint3.COPY",
                translationArgs: []
            )
            public static let MainTextFirstBoldPart = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextFirstBoldPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.MainTextFirstBoldPart.COPY",
                translationArgs: []
            )
            public static let MainTextSecondBoldPart = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.MainTextSecondBoldPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.MainTextSecondBoldPart.COPY",
                translationArgs: []
            )
            public static let AddInformationText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.AddInformationText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.AddInformationText.COPY",
                translationArgs: []
            )
            public static let AddInformationBoldPart = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.AddInformationBoldPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.AddInformationBoldPart.COPY",
                translationArgs: []
            )
            public static let SkipButtonTitle = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.FirstTimeDialog.SkipButtonTitle",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.FirstTimeDialog.SkipButtonTitle.COPY",
                translationArgs: []
            )
        }
        public struct Explanation {
            public static let MainTitleLabel = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.Explanation.MainTitleLabel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.Explanation.MainTitleLabel.COPY",
                translationArgs: []
            )
            public static let MainExplanationText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.Explanation.MainExplanationText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.Explanation.MainExplanationText.COPY",
                translationArgs: []
            )
            public static let CreateEduidButton = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.Explanation.CreateEduidButton",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.Explanation.CreateEduidButton.COPY",
                translationArgs: []
            )
        }
        public struct Create {
            public static let MainTitleLabel = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.Create.MainTitleLabel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.Create.MainTitleLabel.COPY",
                translationArgs: []
            )
        }
        public struct Created {
            public static let MainTitleLabel = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.Created.MainTitleLabel",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.Created.MainTitleLabel.COPY",
                translationArgs: []
            )
            public static let MainText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.Created.MainText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.Created.MainText.COPY",
                translationArgs: []
            )
        }
        public struct EnterPersonalInfo {
            public static let EmailFieldTitle = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPersonalInfo.EmailFieldTitle",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPersonalInfo.EmailFieldTitle.COPY",
                translationArgs: []
            )
            public static let EmailFieldPlaceHolder = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPersonalInfo.EmailFieldPlaceHolder",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPersonalInfo.EmailFieldPlaceHolder.COPY",
                translationArgs: []
            )
            public static let Agreement = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPersonalInfo.Agreement",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPersonalInfo.Agreement.COPY",
                translationArgs: []
            )
        }
        public struct EnterPhoneNumber {
            public static let PhoneFieldTitle = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPhoneNumber.PhoneFieldTitle",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPhoneNumber.PhoneFieldTitle.COPY",
                translationArgs: []
            )
            public static let PhoneFieldPlaceholder = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPhoneNumber.PhoneFieldPlaceholder",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPhoneNumber.PhoneFieldPlaceholder.COPY",
                translationArgs: []
            )
            public static let MainText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPhoneNumber.MainText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPhoneNumber.MainText.COPY",
                translationArgs: []
            )
            public static let BoldRange = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPhoneNumber.BoldRange",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPhoneNumber.BoldRange.COPY",
                translationArgs: []
            )
            public static let VerifyPhoneNumber = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.EnterPhoneNumber.VerifyPhoneNumber",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.EnterPhoneNumber.VerifyPhoneNumber.COPY",
                translationArgs: []
            )
        }
        public struct AddInstitution {
            public static let MainTitle = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.AddInstitution.MainTitle",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.AddInstitution.MainTitle.COPY",
                translationArgs: []
            )
            public static let MainTitleBoldPart = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.AddInstitution.MainTitleBoldPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.AddInstitution.MainTitleBoldPart.COPY",
                translationArgs: []
            )
            public static let MainText = LocaliciousData(
                accessibilityIdentifier: "CreateEduID.AddInstitution.MainText",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "CreateEduID.AddInstitution.MainText.COPY",
                translationArgs: []
            )
        }
    }
    public struct RegEXError {
        public static let Name = LocaliciousData(
            accessibilityIdentifier: "RegEXError.Name",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegEXError.Name.COPY",
            translationArgs: []
        )
        public static let Email = LocaliciousData(
            accessibilityIdentifier: "RegEXError.Email",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegEXError.Email.COPY",
            translationArgs: []
        )
        public static let Phone = LocaliciousData(
            accessibilityIdentifier: "RegEXError.Phone",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegEXError.Phone.COPY",
            translationArgs: []
        )
        public static let Password = LocaliciousData(
            accessibilityIdentifier: "RegEXError.Password",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "RegEXError.Password.COPY",
            translationArgs: []
        )
    }
    public struct ResponseErrors {
        public static let GeneralRequestError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.GeneralRequestError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.GeneralRequestError.COPY",
            translationArgs: []
        )
        public static let AuthenticationFailedTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.AuthenticationFailedTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.AuthenticationFailedTitle.COPY",
            translationArgs: []
        )
        public static let AuthenticationFailedMessage = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.AuthenticationFailedMessage",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.AuthenticationFailedMessage.COPY",
            translationArgs: []
        )
        public static let UnauthorizedTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.UnauthorizedTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.UnauthorizedTitle.COPY",
            translationArgs: []
        )
        public static let UnauthorizedText = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.UnauthorizedText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.UnauthorizedText.COPY",
            translationArgs: []
        )
        public static let RequestSMSError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.RequestSMSError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.RequestSMSError.COPY",
            translationArgs: []
        )
        public static let PasswordUpdateError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.PasswordUpdateError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.PasswordUpdateError.COPY",
            translationArgs: []
        )
        public static let InvalidPasswordError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.InvalidPasswordError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.InvalidPasswordError.COPY",
            translationArgs: []
        )
        public static let PasswordMismatchError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.PasswordMismatchError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.PasswordMismatchError.COPY",
            translationArgs: []
        )
        public static let InvalidPasswordHash = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.InvalidPasswordHash",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.InvalidPasswordHash.COPY",
            translationArgs: []
        )
        public static let MissingPasswordHash = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.MissingPasswordHash",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.MissingPasswordHash.COPY",
            translationArgs: []
        )
        public static let DeleteKeyLostError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.DeleteKeyLostError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.DeleteKeyLostError.COPY",
            translationArgs: []
        )
        public static let ModifyKeyLostError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ModifyKeyLostError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ModifyKeyLostError.COPY",
            translationArgs: []
        )
        public static let RequestResetLinkError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.RequestResetLinkError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.RequestResetLinkError.COPY",
            translationArgs: []
        )
        public static let ConfirmSMSError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ConfirmSMSError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ConfirmSMSError.COPY",
            translationArgs: []
        )
        public struct InvalidChallenge {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.InvalidChallenge.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.InvalidChallenge.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.InvalidChallenge.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.InvalidChallenge.Description.COPY",
                translationArgs: []
            )
        }
        public struct DeactivationError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.DeactivationError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.DeactivationError.Title.COPY",
                translationArgs: []
            )
            public static func Description(args: CVarArg...) -> LocaliciousData {
                return LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.DeactivationError.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.DeactivationError.Description.COPY",
                translationArgs: args
            )
            }
        }
        public struct EmailInUse {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.EmailInUse.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.EmailInUse.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.EmailInUse.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.EmailInUse.Description.COPY",
                translationArgs: []
            )
        }
        public static let ForbiddenDomainTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ForbiddenDomainTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ForbiddenDomainTitle.COPY",
            translationArgs: []
        )
        public static let ForbiddenDomainText = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ForbiddenDomainText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ForbiddenDomainText.COPY",
            translationArgs: []
        )
        public static let NoInternetAccessTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.NoInternetAccessTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.NoInternetAccessTitle.COPY",
            translationArgs: []
        )
        public static let NoInternetAccessText = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.NoInternetAccessText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.NoInternetAccessText.COPY",
            translationArgs: []
        )
        public static let SMSErrorTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.SMSErrorTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.SMSErrorTitle.COPY",
            translationArgs: []
        )
        public static let SMSErrorText = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.SMSErrorText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.SMSErrorText.COPY",
            translationArgs: []
        )
        public static let UnknownErrorTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.UnknownErrorTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.UnknownErrorTitle.COPY",
            translationArgs: []
        )
        public static let UnknownErrorText = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.UnknownErrorText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.UnknownErrorText.COPY",
            translationArgs: []
        )
        public static let ExistingUserAndDeviceTitle = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ExistingUserAndDeviceTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ExistingUserAndDeviceTitle.COPY",
            translationArgs: []
        )
        public static let ExistingUserAndDeviceText = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ExistingUserAndDeviceText",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ExistingUserAndDeviceText.COPY",
            translationArgs: []
        )
        public static let PersonalDetailsRetrieveError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.PersonalDetailsRetrieveError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.PersonalDetailsRetrieveError.COPY",
            translationArgs: []
        )
        public static let ActivityHistoryRetrieveError = LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.ActivityHistoryRetrieveError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.ActivityHistoryRetrieveError.COPY",
            translationArgs: []
        )
        public struct DeleteError {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.DeleteError.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.DeleteError.Title.COPY",
                translationArgs: []
            )
            public static let Description = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.DeleteError.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.DeleteError.Description.COPY",
                translationArgs: []
            )
            public static let NameMismatchDescription = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.DeleteError.NameMismatchDescription",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.DeleteError.NameMismatchDescription.COPY",
                translationArgs: []
            )
        }
        public static func AccountCreateError(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "ResponseErrors.AccountCreateError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ResponseErrors.AccountCreateError.COPY",
            translationArgs: args
        )
        }
        public struct EmailDomainForbidden {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.EmailDomainForbidden.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.EmailDomainForbidden.Title.COPY",
                translationArgs: []
            )
            public static func Description(args: CVarArg...) -> LocaliciousData {
                return LocaliciousData(
                accessibilityIdentifier: "ResponseErrors.EmailDomainForbidden.Description",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "ResponseErrors.EmailDomainForbidden.Description.COPY",
                translationArgs: args
            )
            }
        }
        public struct Auth {
            public struct Invalid {
                public static let Title = LocaliciousData(
                    accessibilityIdentifier: "ResponseErrors.Auth.Invalid.Title",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "ResponseErrors.Auth.Invalid.Title.COPY",
                    translationArgs: []
                )
                public static let Description = LocaliciousData(
                    accessibilityIdentifier: "ResponseErrors.Auth.Invalid.Description",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "ResponseErrors.Auth.Invalid.Description.COPY",
                    translationArgs: []
                )
            }
            public struct Failed {
                public static let Title = LocaliciousData(
                    accessibilityIdentifier: "ResponseErrors.Auth.Failed.Title",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "ResponseErrors.Auth.Failed.Title.COPY",
                    translationArgs: []
                )
                public static let Description = LocaliciousData(
                    accessibilityIdentifier: "ResponseErrors.Auth.Failed.Description",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "ResponseErrors.Auth.Failed.Description.COPY",
                    translationArgs: []
                )
                public struct TokenFailedDescription {
                    public static let Generic = LocaliciousData(
                        accessibilityIdentifier: "ResponseErrors.Auth.Failed.TokenFailedDescription.Generic",
                        accessibilityHintKey: nil,
                        accessibilityLabelKey: nil,
                        accessibilityValueKey: nil,
                        translationKey: "ResponseErrors.Auth.Failed.TokenFailedDescription.Generic.COPY",
                        translationArgs: []
                    )
                    public static func WithException(args: CVarArg...) -> LocaliciousData {
                        return LocaliciousData(
                        accessibilityIdentifier: "ResponseErrors.Auth.Failed.TokenFailedDescription.WithException",
                        accessibilityHintKey: nil,
                        accessibilityLabelKey: nil,
                        accessibilityValueKey: nil,
                        translationKey: "ResponseErrors.Auth.Failed.TokenFailedDescription.WithException.COPY",
                        translationArgs: args
                    )
                    }
                }
            }
        }
    }
    public struct VerifyIdentity {
        public struct Title {
            public static let FirstLine = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.Title.FirstLine",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.Title.FirstLine.COPY",
                translationArgs: []
            )
            public static let SecondLine = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.Title.SecondLine",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.Title.SecondLine.COPY",
                translationArgs: []
            )
        }
        public static let Subtitle = LocaliciousData(
            accessibilityIdentifier: "VerifyIdentity.Subtitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "VerifyIdentity.Subtitle.COPY",
            translationArgs: []
        )
        public struct VerifyViaDutchInstitution {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VerifyViaDutchInstitution.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VerifyViaDutchInstitution.Title.COPY",
                translationArgs: []
            )
            public static let Button = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VerifyViaDutchInstitution.Button",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VerifyViaDutchInstitution.Button.COPY",
                translationArgs: []
            )
        }
        public struct VerifyWithBankingApp {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VerifyWithBankingApp.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VerifyWithBankingApp.Title.COPY",
                translationArgs: []
            )
            public static let Button = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VerifyWithBankingApp.Button",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VerifyWithBankingApp.Button.COPY",
                translationArgs: []
            )
        }
        public struct VerifyWithAEuropianId {
            public static let Title = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VerifyWithAEuropianId.Title",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VerifyWithAEuropianId.Title.COPY",
                translationArgs: []
            )
            public static let Button = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VerifyWithAEuropianId.Button",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VerifyWithAEuropianId.Button.COPY",
                translationArgs: []
            )
            public struct Subtitle {
                public static let Full = LocaliciousData(
                    accessibilityIdentifier: "VerifyIdentity.VerifyWithAEuropianId.Subtitle.Full",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "VerifyIdentity.VerifyWithAEuropianId.Subtitle.Full.COPY",
                    translationArgs: []
                )
                public static let BoldPart = LocaliciousData(
                    accessibilityIdentifier: "VerifyIdentity.VerifyWithAEuropianId.Subtitle.BoldPart",
                    accessibilityHintKey: nil,
                    accessibilityLabelKey: nil,
                    accessibilityValueKey: nil,
                    translationKey: "VerifyIdentity.VerifyWithAEuropianId.Subtitle.BoldPart.COPY",
                    translationArgs: []
                )
            }
        }
        public static let OtherOptions = LocaliciousData(
            accessibilityIdentifier: "VerifyIdentity.OtherOptions",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "VerifyIdentity.OtherOptions.COPY",
            translationArgs: []
        )
        public struct VisitSupport {
            public static let Full = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VisitSupport.Full",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VisitSupport.Full.COPY",
                translationArgs: []
            )
            public static let HighlightedPart = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VisitSupport.HighlightedPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VisitSupport.HighlightedPart.COPY",
                translationArgs: []
            )
            public static let Link = LocaliciousData(
                accessibilityIdentifier: "VerifyIdentity.VisitSupport.Link",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "VerifyIdentity.VisitSupport.Link.COPY",
                translationArgs: []
            )
        }
    }
    public struct SelectYourBank {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "SelectYourBank.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SelectYourBank.Title.COPY",
            translationArgs: []
        )
        public struct Subtitle {
            public static let Full = LocaliciousData(
                accessibilityIdentifier: "SelectYourBank.Subtitle.Full",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "SelectYourBank.Subtitle.Full.COPY",
                translationArgs: []
            )
            public static let HighlightedPart = LocaliciousData(
                accessibilityIdentifier: "SelectYourBank.Subtitle.HighlightedPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "SelectYourBank.Subtitle.HighlightedPart.COPY",
                translationArgs: []
            )
        }
        public static let MoreAboutIdin = LocaliciousData(
            accessibilityIdentifier: "SelectYourBank.MoreAboutIdin",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SelectYourBank.MoreAboutIdin.COPY",
            translationArgs: []
        )
        public static let IdinkLink = LocaliciousData(
            accessibilityIdentifier: "SelectYourBank.IdinkLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "SelectYourBank.IdinkLink.COPY",
            translationArgs: []
        )
        public struct BankNotInList {
            public static let Full = LocaliciousData(
                accessibilityIdentifier: "SelectYourBank.BankNotInList.Full",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "SelectYourBank.BankNotInList.Full.COPY",
                translationArgs: []
            )
            public static let HighlightedPart = LocaliciousData(
                accessibilityIdentifier: "SelectYourBank.BankNotInList.HighlightedPart",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "SelectYourBank.BankNotInList.HighlightedPart.COPY",
                translationArgs: []
            )
        }
    }
    public struct LinkingSuccess {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "LinkingSuccess.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkingSuccess.Title.COPY",
            translationArgs: []
        )
        public static let Subtitle = LocaliciousData(
            accessibilityIdentifier: "LinkingSuccess.Subtitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkingSuccess.Subtitle.COPY",
            translationArgs: []
        )
        public static let SubtitlePreferInstitution = LocaliciousData(
            accessibilityIdentifier: "LinkingSuccess.SubtitlePreferInstitution",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "LinkingSuccess.SubtitlePreferInstitution.COPY",
            translationArgs: []
        )
        public struct Button {
            public static let Continue = LocaliciousData(
                accessibilityIdentifier: "LinkingSuccess.Button.Continue",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "LinkingSuccess.Button.Continue.COPY",
                translationArgs: []
            )
            public static let YesPlease = LocaliciousData(
                accessibilityIdentifier: "LinkingSuccess.Button.YesPlease",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "LinkingSuccess.Button.YesPlease.COPY",
                translationArgs: []
            )
            public static let NoThanks = LocaliciousData(
                accessibilityIdentifier: "LinkingSuccess.Button.NoThanks",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "LinkingSuccess.Button.NoThanks.COPY",
                translationArgs: []
            )
        }
    }
    public struct ExternalAccountLinkingError {
        public static let Title = LocaliciousData(
            accessibilityIdentifier: "ExternalAccountLinkingError.Title",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ExternalAccountLinkingError.Title.COPY",
            translationArgs: []
        )
        public static let Subtitle = LocaliciousData(
            accessibilityIdentifier: "ExternalAccountLinkingError.Subtitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ExternalAccountLinkingError.Subtitle.COPY",
            translationArgs: []
        )
        public static let TryAnotherOption = LocaliciousData(
            accessibilityIdentifier: "ExternalAccountLinkingError.TryAnotherOption",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "ExternalAccountLinkingError.TryAnotherOption.COPY",
            translationArgs: []
        )
    }
}
