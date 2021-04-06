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
    
    public func encode<T:Codable>(jwt:JWT<T>) -> String? {
        guard let headerData = self.encode(jwt.header),
              let payloadData = self.encode(jwt.payload),
              let signature = jwt.signature else {
            self.log(JWTError.invalidJWTObject.localizedDescription)
            return nil
        }
        let header = self.base64EncodedString(data: headerData)
        let payload = self.base64EncodedString(data: payloadData)
        let jwtToken = [header,payload,signature].joined(separator: ".")
        self.log(jwtToken)
        return jwtToken
    }
    
}

extension JWTEncoder {
    
    private func base64EncodedString(data: Data) -> String {
        let result = data.base64EncodedString()
        return result.replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
    
    private func encode<T:Codable>(_ object:T?) -> Data? {
        guard let data = try? JSONEncoder().encode(object) else {
            return nil
        }
        return data
    }
    
    private func log(_ string: String?) {
        guard let value = string else { return }
        print("✏️: [JWTEncoder] => \(value)")
    }
    
}
