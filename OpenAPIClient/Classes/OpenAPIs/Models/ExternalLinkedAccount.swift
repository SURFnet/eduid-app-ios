//
// ExternalLinkedAccount.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ExternalLinkedAccount: Codable, JSONEncodable, Hashable {

    public enum IdpScoping: String, Codable, CaseIterable {
        case idin = "idin"
        case eherkenning = "eherkenning"
        case studielink = "studielink"
    }
    public enum Verification: String, Codable, CaseIterable {
        case geverifieerd = "Geverifieerd"
        case verifai = "Verifai"
        case decentraal = "Decentraal"
        case ongeverifieerd = "Ongeverifieerd"
    }
    public var subjectId: String?
    public var idpScoping: IdpScoping?
    public var issuer: VerifyIssuer?
    public var verification: Verification?
    public var serviceUUID: String?
    public var serviceID: String?
    public var subjectIssuer: String?
    public var brinCode: String?
    public var initials: String?
    public var chosenName: String?
    public var firstName: String?
    public var preferredLastName: String?
    public var legalLastName: String?
    public var partnerLastNamePrefix: String?
    public var legalLastNamePrefix: String?
    public var preferredLastNamePrefix: String?
    public var partnerLastName: String?
    public var dateOfBirth: Int64?
    public var createdAt: Int64?
    public var expiresAt: Int64?
    public var external: Bool?

    public init(subjectId: String? = nil, idpScoping: IdpScoping? = nil, issuer: VerifyIssuer? = nil, verification: Verification? = nil, serviceUUID: String? = nil, serviceID: String? = nil, subjectIssuer: String? = nil, brinCode: String? = nil, initials: String? = nil, chosenName: String? = nil, firstName: String? = nil, preferredLastName: String? = nil, legalLastName: String? = nil, partnerLastNamePrefix: String? = nil, legalLastNamePrefix: String? = nil, preferredLastNamePrefix: String? = nil, partnerLastName: String? = nil, dateOfBirth: Int64? = nil, createdAt: Int64? = nil, expiresAt: Int64? = nil, external: Bool? = nil) {
        self.subjectId = subjectId
        self.idpScoping = idpScoping
        self.issuer = issuer
        self.verification = verification
        self.serviceUUID = serviceUUID
        self.serviceID = serviceID
        self.subjectIssuer = subjectIssuer
        self.brinCode = brinCode
        self.initials = initials
        self.chosenName = chosenName
        self.firstName = firstName
        self.preferredLastName = preferredLastName
        self.legalLastName = legalLastName
        self.partnerLastNamePrefix = partnerLastNamePrefix
        self.legalLastNamePrefix = legalLastNamePrefix
        self.preferredLastNamePrefix = preferredLastNamePrefix
        self.partnerLastName = partnerLastName
        self.dateOfBirth = dateOfBirth
        self.createdAt = createdAt
        self.expiresAt = expiresAt
        self.external = external
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case subjectId
        case idpScoping
        case issuer
        case verification
        case serviceUUID
        case serviceID
        case subjectIssuer
        case brinCode
        case initials
        case chosenName
        case firstName
        case preferredLastName
        case legalLastName
        case partnerLastNamePrefix
        case legalLastNamePrefix
        case preferredLastNamePrefix
        case partnerLastName
        case dateOfBirth
        case createdAt
        case expiresAt
        case external
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(subjectId, forKey: .subjectId)
        try container.encodeIfPresent(idpScoping, forKey: .idpScoping)
        try container.encodeIfPresent(issuer, forKey: .issuer)
        try container.encodeIfPresent(verification, forKey: .verification)
        try container.encodeIfPresent(serviceUUID, forKey: .serviceUUID)
        try container.encodeIfPresent(serviceID, forKey: .serviceID)
        try container.encodeIfPresent(subjectIssuer, forKey: .subjectIssuer)
        try container.encodeIfPresent(brinCode, forKey: .brinCode)
        try container.encodeIfPresent(initials, forKey: .initials)
        try container.encodeIfPresent(chosenName, forKey: .chosenName)
        try container.encodeIfPresent(firstName, forKey: .firstName)
        try container.encodeIfPresent(preferredLastName, forKey: .preferredLastName)
        try container.encodeIfPresent(legalLastName, forKey: .legalLastName)
        try container.encodeIfPresent(partnerLastNamePrefix, forKey: .partnerLastNamePrefix)
        try container.encodeIfPresent(legalLastNamePrefix, forKey: .legalLastNamePrefix)
        try container.encodeIfPresent(preferredLastNamePrefix, forKey: .preferredLastNamePrefix)
        try container.encodeIfPresent(partnerLastName, forKey: .partnerLastName)
        try container.encodeIfPresent(dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(createdAt, forKey: .createdAt)
        try container.encodeIfPresent(expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(external, forKey: .external)
    }
}

