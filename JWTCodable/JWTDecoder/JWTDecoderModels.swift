//
//  JWTDecoderModels.swift
//  JWTDecoder
//
//  Created by Visarut Tippun on 31/3/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public struct JWTHeader: Decodable {
    public var algorithm: String?
    public var type: String?
    
    private enum CodingKeys: String, CodingKey {
        case algorithm = "alg"
        case type = "typ"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.algorithm = try? container.decodeIfPresent(String.self, forKey: .algorithm)
        self.type = try? container.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct DecodedJWT<T:Decodable>: Decodable {
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
}
