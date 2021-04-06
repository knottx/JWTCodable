//
//  JWTHeader.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 6/4/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public struct JWTHeader: Codable {
    /// - Parameter alg: Algorithm Header Parameter
    public var alg: JWTAlgorithm?
    
    /// - Parameter typ: The Type Header Parameter
    public var typ: String?
    
    /// - Parameter jku: The JSON Web Token Set URL Header Parameter
    public var jku : String?
    
    /// - Parameter jwk: The JSON Web Key Header Parameter
    public var jwk: String?
    
    /// - Parameter kid: The Key ID Header Parameter
    public var kid: String?
    
    /// - Parameter x5u: The X.509 URL Header Parameter
    public var x5u: String?
    
    /// - Parameter x5c: The X.509 Certificate Chain Header Parameter
    public var x5c: [String]?
    
    /// - Parameter x5t: The X.509 Certificate SHA-1 Thumbprint Header Parameter
    public var x5t: String?
    
    /// - Parameter x5tS256: X.509 Certificate SHA-256 Thumbprint Header Parameter
    public var x5tS256: String?
    
    /// - Parameter cty: The Content Type Header Parameter
    public var cty: String?
    
    /// - Parameter crit: The Critical Header Parameter
    public var crit: [String]?
    
    
    public init(typ: String? = "JWT",
                alg: JWTAlgorithm? = nil,
                jku: String? = nil,
                jwk: String? = nil,
                kid: String? = nil,
                x5u: String? = nil,
                x5c: [String]? = nil,
                x5t: String? = nil,
                x5tS256: String? = nil,
                cty: String? = nil,
                crit: [String]? = nil) {
        self.typ = typ
        self.alg = alg
        self.jku = jku
        self.jwk = jwk
        self.kid = kid
        self.x5u = x5u
        self.x5c = x5c
        self.x5t = x5t
        self.x5tS256 = x5tS256
        self.cty = cty
        self.crit = crit
    }
    
}
