//
// VerifyIssuer.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct VerifyIssuer: Codable, JSONEncodable, Hashable {

    public var id: String?
    public var name: String?
    public var logo: String?

    public init(id: String? = nil, name: String? = nil, logo: String? = nil) {
        self.id = id
        self.name = name
        self.logo = logo
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case logo
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(logo, forKey: .logo)
    }
}
