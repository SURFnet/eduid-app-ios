import UIKit

enum Constants {
    
    enum RegEx {
        static let emailRegex = #"^(?=.{6,})[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        static let nameRegex = #"^(?!\s*$).+"# // Checks for "is-not-empty"
        static let shortPasswordRegex = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$"#
        static let longPasswordRegex = #".{15,}"#
        static let phoneRegex = #"^(?:(?:00|\+)?\d{1,2}\s?)?\(?(?:\d{3}[\s-]?\d{3}[\s-]?\d{4}|\d{10})\)?$"#
    }
    
    enum InvalidInput {
        static let name = L.RegEXError.Name.localization
        static let email = L.RegEXError.Email.localization
        static let phone = L.RegEXError.Phone.localization
        static let password = L.RegEXError.Password.localization
    }
    
    enum BiometricDefaults {
        static let key = "USER_HAS_SETUP_BIOMETRICS"
    }
    
    enum Enrolment {
        static let challenge = "EnrollmentChallenge"
    }
    
    enum KeyChain {
        static let keyPrefix = Bundle.main.bundleIdentifier ?? "nl.eduid"
        static let uuid = UUID()
    }
    
    enum Headers {
        static let authorization = "Authorization"
    }
    
    enum UserInfoKey {
        static let tiqrAuthObject = "tiqrAuthenticationObject"
        static let emailUpdateUrl = "emailUpdateUrl"
        static let passwordChangeUrl = "passwordChangeUrl"
        static let linkedAccountEmail = "linkedAccountEmail"
        static let linkedAccountInstitution = "linkedAccountInstitution"
        static let magicLinkUrl = "magicLinkUrl"
    }
    
    enum RegistrationCheck {
        static let useApp = "useApp"
        static let phoneVerified = "phoneVerified"
    }
    
    enum Urls {
        static let OrganizationLogo = "https://static.surfconext.nl/logos/org/"
    }
}
