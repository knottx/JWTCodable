//
//  JWTAlgorithm.swift
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
    case ps256 = "PS256"
    case ps384 = "PS384"
    case ps512 = "PS512"
    case rs256 = "RS256"
    case rs384 = "RS384"
    case rs512 = "RS512"
}
