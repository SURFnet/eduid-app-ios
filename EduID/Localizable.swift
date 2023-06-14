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
        public static let LogoutStatus = LocaliciousData(
            accessibilityIdentifier: "Landing.LogoutStatus",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Landing.LogoutStatus.COPY",
            translationArgs: []
        )
        public static let LoginAgain = LocaliciousData(
            accessibilityIdentifier: "Landing.LoginAgain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Landing.LoginAgain.COPY",
            translationArgs: []
        )
        public static let DeleteTitle = LocaliciousData(
            accessibilityIdentifier: "Landing.DeleteTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Landing.DeleteTitle.COPY",
            translationArgs: []
        )
        public static let DeleteStatus = LocaliciousData(
            accessibilityIdentifier: "Landing.DeleteStatus",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Landing.DeleteStatus.COPY",
            translationArgs: []
        )
        public static let RegisterAgain = LocaliciousData(
            accessibilityIdentifier: "Landing.RegisterAgain",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Landing.RegisterAgain.COPY",
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
    public struct Profile {
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
        public static let Header = LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.Header",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.Header.COPY",
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
        public static func Proceed(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.Proceed",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.Proceed.COPY",
            translationArgs: args
        )
        }
        public static let ProceedLink = LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.ProceedLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.ProceedLink.COPY",
            translationArgs: []
        )
        public static let RetryLink = LocaliciousData(
            accessibilityIdentifier: "EppnAlreadyLinked.RetryLink",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EppnAlreadyLinked.RetryLink.COPY",
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
        public static let UpdateError = LocaliciousData(
            accessibilityIdentifier: "Email.UpdateError",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Email.UpdateError.COPY",
            translationArgs: []
        )
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
    public struct EditName {
        public struct Title {
            public static let AllDetailsOf = LocaliciousData(
                accessibilityIdentifier: "EditName.Title.AllDetailsOf",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "EditName.Title.AllDetailsOf.COPY",
                translationArgs: []
            )
            public static let FullName = LocaliciousData(
                accessibilityIdentifier: "EditName.Title.FullName",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "EditName.Title.FullName.COPY",
                translationArgs: []
            )
        }
        public static let SelfAsserted = LocaliciousData(
            accessibilityIdentifier: "EditName.SelfAsserted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.SelfAsserted.COPY",
            translationArgs: []
        )
        public static let Verified = LocaliciousData(
            accessibilityIdentifier: "EditName.Verified",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.Verified.COPY",
            translationArgs: []
        )
        public static let AnotherSource = LocaliciousData(
            accessibilityIdentifier: "EditName.AnotherSource",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.AnotherSource.COPY",
            translationArgs: []
        )
        public static let NotAvailable = LocaliciousData(
            accessibilityIdentifier: "EditName.NotAvailable",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.NotAvailable.COPY",
            translationArgs: []
        )
        public static let ProceedToAdd = LocaliciousData(
            accessibilityIdentifier: "EditName.ProceedToAdd",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "EditName.ProceedToAdd.COPY",
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
        public static let SecondSubTitle = LocaliciousData(
            accessibilityIdentifier: "Security.SecondSubTitle",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.SecondSubTitle.COPY",
            translationArgs: []
        )
        public static let UsePassword = LocaliciousData(
            accessibilityIdentifier: "Security.UsePassword",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.UsePassword.COPY",
            translationArgs: []
        )
        public static let UsePublicKey = LocaliciousData(
            accessibilityIdentifier: "Security.UsePublicKey",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.UsePublicKey.COPY",
            translationArgs: []
        )
        public static let NotSet = LocaliciousData(
            accessibilityIdentifier: "Security.NotSet",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.NotSet.COPY",
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
        public static let RememberMe = LocaliciousData(
            accessibilityIdentifier: "Security.RememberMe",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.RememberMe.COPY",
            translationArgs: []
        )
        public static func SecurityKey(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "Security.SecurityKey",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.SecurityKey.COPY",
            translationArgs: args
        )
        }
        public static let Test = LocaliciousData(
            accessibilityIdentifier: "Security.Test",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.Test.COPY",
            translationArgs: []
        )
        public static let AddSecurityKey = LocaliciousData(
            accessibilityIdentifier: "Security.AddSecurityKey",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.AddSecurityKey.COPY",
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
        public static let Settings = LocaliciousData(
            accessibilityIdentifier: "Security.Settings",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "Security.Settings.COPY",
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
        public static let Explanation = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Explanation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Explanation.COPY",
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
            public static let First = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.First",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.First.COPY",
                translationArgs: []
            )
            public static let EduID = LocaliciousData(
                accessibilityIdentifier: "DataActivity.Details.EduID",
                accessibilityHintKey: nil,
                accessibilityLabelKey: nil,
                accessibilityValueKey: nil,
                translationKey: "DataActivity.Details.EduID.COPY",
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
        public static let DeleteService = LocaliciousData(
            accessibilityIdentifier: "DataActivity.DeleteService",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.DeleteService.COPY",
            translationArgs: []
        )
        public static func DeleteServiceConfirmation(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "DataActivity.DeleteServiceConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.DeleteServiceConfirmation.COPY",
            translationArgs: args
        )
        }
        public static func DeleteTokenConfirmation(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "DataActivity.DeleteTokenConfirmation",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.DeleteTokenConfirmation.COPY",
            translationArgs: args
        )
        }
        public static let DeleteToken = LocaliciousData(
            accessibilityIdentifier: "DataActivity.DeleteToken",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.DeleteToken.COPY",
            translationArgs: []
        )
        public static let Deleted = LocaliciousData(
            accessibilityIdentifier: "DataActivity.Deleted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.Deleted.COPY",
            translationArgs: []
        )
        public static let TokenDeleted = LocaliciousData(
            accessibilityIdentifier: "DataActivity.TokenDeleted",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "DataActivity.TokenDeleted.COPY",
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
        public static func Info(args: CVarArg...) -> LocaliciousData {
            return LocaliciousData(
            accessibilityIdentifier: "PollFromInstitution.Info",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PollFromInstitution.Info.COPY",
            translationArgs: args
        )
        }
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
        public static let BiometricsPrompt = LocaliciousData(
            accessibilityIdentifier: "PinAndBioMetrics.BiometricsPrompt",
            accessibilityHintKey: nil,
            accessibilityLabelKey: nil,
            accessibilityValueKey: nil,
            translationKey: "PinAndBioMetrics.BiometricsPrompt.COPY",
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
}