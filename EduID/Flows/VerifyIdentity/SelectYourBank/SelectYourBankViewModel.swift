//
//  SelectYourBankViewModel.swift
//  eduID
//
//  Created by Dániel Zolnai on 01/10/2024.
//
import OpenAPIClient
import UIKit

class SelectYourBankViewModel: NSObject {

    var issuers: [VerifyIssuer]?
    
    var dataHandler: ((Result<[VerifyIssuer], SelectYourBankError>) -> Void)?
    
    var urlHandler: ((URL) -> Void)?
    
    func fetchIssuerList() {
        Task {
            let result = await fetchIssuers()
            await handleIssuerListResult(result)
        }
    }
    
    func openIssuerLink(with issuer: VerifyIssuer, control: SelectBankOptionControl) {
        control.isLoading = true
        Task {
            let result = await startSPVerifyIDLinkAccountFlow(issuer: issuer)
            await handleAuthUrlResult(result, control: control)
        }
    }

    @MainActor
    private func handleIssuerListResult(_ result: Result<[VerifyIssuer], SelectYourBankError>) {
        switch result {
        case .success(let issuers):
            self.issuers = issuers
            dataHandler?(.success(issuers))
        case .failure(let error):
            dataHandler?(.failure(error))
        }
    }

    @MainActor
    private func handleAuthUrlResult(_ result: Result<URL, SelectYourBankError>, control: SelectBankOptionControl) {
        control.isLoading = false
        switch result {
        case .success(let url):
            urlHandler?(url)
        case .failure(let error):
            dataHandler?(.failure(error))
        }
    }
    
    private func fetchIssuers() async -> Result<[VerifyIssuer], SelectYourBankError> {
        do {
            let issuers = try await AccountLinkerControllerAPI.issuers()
            return .success(issuers)
        } catch {
            return .failure(handleError(error))
        }
    }
    
    private func startSPVerifyIDLinkAccountFlow(issuer: VerifyIssuer) async -> Result<URL, SelectYourBankError> {
        do {
            let authUrl = try await AccountLinkerControllerAPI.startSPVerifyIDLinkAccountFlow(
                idpScoping: AccountLinkerControllerAPI.IdpScoping_startSPVerifyIDLinkAccountFlow.idin,
                bankId: issuer.id
            ).url
            if let authUrlString = authUrl, let url = URL(string: authUrlString) {
                return .success(url)
            } else {
                return .failure(SelectYourBankError.invalidUrl)
            }
        } catch {
            return .failure(handleError(error))
        }
    }
    
    private func handleError(_ error: Error) -> SelectYourBankError {
        let eduIdError = EduIdError.from(error)
        return SelectYourBankError(
            title: eduIdError.title,
            message: eduIdError.message,
            statusCode: eduIdError.statusCode
        )
    }
}

// Custom error type to wrap eduIdResponseError
struct SelectYourBankError: Error {
    let title: String
    let message: String
    let statusCode: Int

    static let invalidUrl = SelectYourBankError(title: "Invalid URL", message: "The generated URL is invalid.", statusCode: 400)
}
