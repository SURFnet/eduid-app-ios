//
// EmailExistsResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct EmailExistsResponse: Codable, JSONEncodable, Hashable {

    public var status: Int?
    public var eduIDValue: String?

    public init(status: Int? = nil, eduIDValue: String? = nil) {
        self.status = status
        self.eduIDValue = eduIDValue
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case eduIDValue
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(eduIDValue, forKey: .eduIDValue)
    }
}

