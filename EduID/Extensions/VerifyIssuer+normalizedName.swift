//
//  VerifyIssuer+normalizedName.swift
//  eduID
//
//  Created by Dániel Zolnai on 2024. 11. 15..
//
import OpenAPIClient

extension VerifyIssuer {
    var normalizedName: String? {
        if name == ExternalLinkedAccount.IdpScoping.eherkenning.rawValue {
            return L.ReferenceNames.Eherkenning.localization
        } else if name == ExternalLinkedAccount.IdpScoping.idin.rawValue {
            return L.ReferenceNames.Idin.localization
        }
        return name
    }
}
