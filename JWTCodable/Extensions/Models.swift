//
//  Models.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 6/4/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public enum JWTAlgorithm:String, Codable {
    case hs256 = "HS256"
    case hs384 = "HS384"
    case hs512 = "HS512"
    case rs256 = "RS256"
    case rs384 = "RS384"
    case rs512 = "RS512"
}

public struct JWTHeader: Codable {
    public var algorithm: JWTAlgorithm?
    public var type: String?
    
    private enum CodingKeys: String, CodingKey {
        case algorithm = "alg"
        case type = "typ"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.algorithm = try? container.decodeIfPresent(JWTAlgorithm.self, forKey: .algorithm)
        self.type = try? container.decodeIfPresent(String.self, forKey: .type)
    }
    
    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try? values.encodeIfPresent(self.algorithm, forKey: .algorithm)
        try? values.encodeIfPresent(self.type, forKey: .type)
    }
}

public struct JWT<T:Codable>: Codable {
    public var header: JWTHeader?
    public var payload: T?
    public var signature: String?
    public var jwtToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case header
        case payload
        case signature
        case jwtToken
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.header = try? container.decodeIfPresent(JWTHeader.self, forKey: .header)
        self.payload = try? container.decodeIfPresent(T.self, forKey: .payload)
        self.signature = try? container.decodeIfPresent(String.self, forKey: .signature)
        self.jwtToken = try? container.decodeIfPresent(String.self, forKey: .jwtToken)
    }
    
    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try? values.encodeIfPresent(self.header, forKey: .header)
        try? values.encodeIfPresent(self.payload, forKey: .payload)
        try? values.encodeIfPresent(self.signature, forKey: .signature)
    }
}
