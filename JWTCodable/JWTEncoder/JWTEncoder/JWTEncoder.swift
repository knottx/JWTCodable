//
//  JWTEncoder.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 6/4/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public class JWTEncoder {
    
    public static let shared:JWTEncoder = JWTEncoder()
    
    public func encode(jwt:JWT) -> String? {
        return ""
    }
    
}

extension JWTEncoder {
    
    private func log(_ string: String?) {
        guard let value = string else { return }
        print("✏️: [JWTEncoder] => \(value)")
    }
    
}
