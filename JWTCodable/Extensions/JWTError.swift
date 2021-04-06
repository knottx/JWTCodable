//
//  JWTError.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 6/4/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public enum JWTError: Error {
    case invalidJWTString
    case invalidJWTObject
}

extension JWTError: LocalizedError {
    
    public var localizedDescription:String {
        switch self {
        case .invalidJWTString:         return "Invalid JWT String"
        case .invalidJWTObject:         return "Invalid JWT Object"
        }
    }
    
}
