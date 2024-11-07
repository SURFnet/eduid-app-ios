//
//  VerifyIdentityViewModel.swift
//  eduID
//
//  Created by Dániel Zolnai on 2024. 10. 02..
//
import UIKit
import OpenAPIClient

class VerifyIdentityViewModel: NSObject {
    
    private let userResponse: UserResponse
    
    var dataFetchErrorClosure: ((EduIdError) -> Void)?
    
    var isLinkedAccount: Bool {
        (userResponse.linkedAccounts?.count ?? 0) + (userResponse.externalLinkedAccounts?.count ?? 0) > 0
    }
    
    init(userResponse: UserResponse) {
        self.userResponse = userResponse
    }
    
    func startLinkingInstitution(_ control: VerifyIdentityControl) {
        control.isLoading = true
        Task {
            do {
                let authUrl = try await AccountLinkerControllerAPI.startSPLinkAccountFlow().url
                await openAuthUrl(URL(string: authUrl!)!, control: control)
            } catch {
                await processError(with: error, control: control)
            }
        }
    }
    
    func openEidasLink(_ control: VerifyIdentityControl) {
        control.isLoading = true
        Task {
            do {
                let authUrl = try await AccountLinkerControllerAPI.startSPVerifyIDLinkAccountFlow(
                    idpScoping: AccountLinkerControllerAPI.IdpScoping_startSPVerifyIDLinkAccountFlow.eherkenning,
                    bankId: nil
                ).url
                await openAuthUrl(URL(string: authUrl!)!, control: control)
            } catch {
                await processError(with: error, control: control)
            }
        }
    }
    
    @MainActor
    func openAuthUrl(_ url: URL, control: VerifyIdentityControl) {
        control.isLoading = false
        UIApplication.shared.open(url)
    }
    
    @MainActor
    private func processError(with error: Error, control: VerifyIdentityControl) {
        control.isLoading = false
        dataFetchErrorClosure?(EduIdError.from(error))
    }
}
