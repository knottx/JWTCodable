//
//  JWT.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 6/4/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public struct JWT<T:Codable>:Codable {
    public var header: JWTHeader?
    public var payload: T?
    public var signature: String?
    public var jwtToken: String?
    
    init(header:JWTHeader, payload:T, signature:String) {
        self.header = header
        self.payload = payload
        self.signature = signature
    }
    
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
