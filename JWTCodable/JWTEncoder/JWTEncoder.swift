//
//  JWTEncoder.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 5/4/21.
//

import Foundation

public class JWTEncoder {
    
    public static let shared = JWTEncoder()
    
    public func encode() -> String {
        return "test"
    }
    
}

// MARK: - Private

extension JWTEncoder {
    
    private func log(_ string: String?) {
        guard let value = string else { return }
        print("✏️: [JWTEncoder] => \(value)")
    }
    
}
