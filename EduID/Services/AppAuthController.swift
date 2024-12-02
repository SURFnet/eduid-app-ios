import UIKit
import AppAuth

public class AppAuthController: NSObject {
    
    //MARK: - singleton
    public static var shared = AppAuthController()
    
    //MARK: - properties of AppAuth
    private var authConfig: AuthConfig
    private var currentAuthorizationFlow: OIDExternalUserAgentSession?
    private var authState: OIDAuthState? {
        didSet {
            if let state = authState {
                _ = OIDTokenStorage
                    .storeAuthState(state, forService: authConfig.clientId)
                    .inspectError { err in
                        NSLog("Failed to store auth state \(err)")
                    }
                state.stateChangeDelegate = self
            } else {
                _ = OIDTokenStorage
                    .removeAuthState(forService: authConfig.clientId)
                    .inspectError { err in
                        NSLog("Failed to remove auth state \(err)")
                    }
            }
        }
    }
    var request: OIDAuthorizationRequest!
    var tokenRefreshRequest: OIDTokenRequest {
        let config = OIDServiceConfiguration(
            authorizationEndpoint: URL(string: authConfig.authorizationEndpointUri)!,
            tokenEndpoint: URL(string: authConfig.tokenEndpointUri)!
        )
        
        let codeVerifier = OIDAuthorizationRequest.generateCodeVerifier()
        
        return OIDTokenRequest(
            configuration: config,
            grantType: OIDGrantTypeRefreshToken,
            authorizationCode: nil,
            redirectURL: URL(string: authConfig.redirectUri),
            clientID: authConfig.clientId,
            clientSecret: nil,
            scope: "eduid.nl/mobile",
            refreshToken: authState?.refreshToken,
            codeVerifier: codeVerifier,
            additionalParameters: nil
        )
    }
    var hasPendingAuthFlow: Bool {
        get {
            return currentAuthorizationFlow != nil
        }
    }
    var pendingTaskUntilAuthCompletes: ((Bool) -> Void)? = nil
    
    var clientId: String {
        get {
            authConfig.clientId
        }
    }
    
    //MARK: - init
    private override init() {
        authConfig = EnvironmentService.shared.currentEnvironment.getAuthConfig()
        
        super.init()
        
        loadAuthState() { result in
            _ = result.inspectError { error in
                NSLog("Unable to load auth state from storage: \(error)")
            }
        }
    
        loadConfig()
    }
    
    private func loadConfig() {
        let config = OIDServiceConfiguration(
            authorizationEndpoint: URL(string: authConfig.authorizationEndpointUri)!,
            tokenEndpoint: URL(string: authConfig.tokenEndpointUri)!
        )
        
        let codeVerifier = OIDAuthorizationRequest.generateCodeVerifier()
        let codeChallenge = OIDAuthorizationRequest.codeChallengeS256(forVerifier: codeVerifier)
        
        request = OIDAuthorizationRequest(
            configuration: config,
            clientId: authConfig.clientId,
            clientSecret: nil,
            scope: "eduid.nl/mobile",
            redirectURL: URL(string: authConfig.redirectUri)!,
            responseType: OIDResponseTypeCode,
            state: UUID().uuidString,
            nonce: UUID().uuidString,
            codeVerifier: codeVerifier,
            codeChallenge: codeChallenge,
            codeChallengeMethod: OIDOAuthorizationRequestCodeChallengeMethodS256,
            additionalParameters: nil
        )
    }
    
    internal func loadAuthConfig(_ authConfig: AuthConfig) {
        self.authConfig = authConfig
        clearAuthState()
        currentAuthorizationFlow = nil
        loadConfig()
    }
    
    /// Loads the Auth state.
    /// - Parameter completion: The result of the load operation.
    ///                         After a successful load, the `state` peroperty will be initialized.
    func loadAuthState(completion: @escaping (Result<Void, Error>) -> Void) {
        if let state = try? OIDTokenStorage.getAuthState(forService: authConfig.clientId).get() {
            self.authState = state
            completion(.success(()))
            return
        }
    }
    
    public func isRedirectURI(_ uri: URL) -> Bool {
        let expectedRedirectPath = URLComponents(string: authConfig.redirectUri)?.path
        let inputPath = URLComponents(string: uri.absoluteString)?.path
        return expectedRedirectPath != nil &&
            inputPath != nil &&
            inputPath!.caseInsensitiveCompare(expectedRedirectPath!) == .orderedSame
    }
    
    @discardableResult
    public func tryResumeAuthorizationFlow(with uri: URL) -> Bool {
        if let authFlow = currentAuthorizationFlow,
           isRedirectURI(uri) {
            // Normalize URL, because it might be a custom scheme one
            guard var normalizedUrl = URLComponents(string: uri.absoluteString) else {
                return false
            }
            if normalizedUrl.scheme == "eduid" {
                let expectedUrlComponents = URLComponents(string: authConfig.redirectUri)!
                normalizedUrl.scheme = expectedUrlComponents.scheme
                normalizedUrl.host = expectedUrlComponents.host
            }
            return authFlow.resumeExternalUserAgentFlow(with: normalizedUrl.url!)
        } else {
            currentAuthorizationFlow = nil
            return false
        }
    }
    
    public func isLoggedIn() -> Bool {
        return authState != nil
    }
    
    public func authorize(
        navigationController: UINavigationController,
        isRegistrationFlow: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        let externalUserAgent = OIDExternalUserAgentUsingWebViewController(
            navigationController: navigationController,
            isRegistrationFlow: isRegistrationFlow
        )
        currentAuthorizationFlow = OIDAuthState.authState(byPresenting: request, externalUserAgent: externalUserAgent) {
            [weak self] authState, error in
            guard let self else { return }
            
            if let authState = authState {
                self.authState = authState
                completion?()
            } else {
                fatalError("authorization failed")
            }
            self.currentAuthorizationFlow = nil
            self.pendingTaskUntilAuthCompletes?(authState != nil)
            self.pendingTaskUntilAuthCompletes = nil
        }
    }
    
    public func performWithFreshTokens(completion: @escaping((String?) -> Void)) {
        if authState == nil {
            completion(nil)
        } else {
            authState!.performAction(freshTokens: { accessToken, idToken, error in
                if let error {
                    NSLog("Could not refresh tokens: \(error)")
                }
                completion(accessToken)
            })
        }
    }

    /// Ends user session by clearing the auth state
    public func clearAuthState() {
       self.authState = nil
   }
    
}


extension AppAuthController: OIDAuthStateChangeDelegate {
    // Handle state changes when token is refreshed or invalidated.
    public func didChange(_ state: OIDAuthState) {
        self.authState = state
    }
}
