//
//  JWTDecoder.swift
//  JWTCodable
//
//  Created by Visarut Tippun on 6/4/21.
//  Copyright © 2021 knottx. All rights reserved.
//

import Foundation

public class JWTDecoder {
    
    public static let shared:JWTDecoder = JWTDecoder()
    
    public func decodeDict(jwtToken: String) -> [String: Any] {
        let segments = jwtToken.components(separatedBy: ".")
        var dict: [String: Any] = [:]
        guard let headerString = segments.getElement(at: 0),
           let header = self.decodeJWTPart(headerString) else {
            self.log(JWTError.invalidJWTString.localizedDescription)
            return [:]
        }
        dict.updateValue(header, forKey: "header")
        
        guard let payloadString = segments.getElement(at: 1),
           let payload = self.decodeJWTPart(payloadString) else {
            self.log(JWTError.invalidJWTString.localizedDescription)
            return [:]
        }
        dict.updateValue(payload, forKey: "payload")
        
        guard let signature = segments.getElement(at: 2) else {
            self.log(JWTError.invalidJWTString.localizedDescription)
            return [:]
        }
        dict.updateValue(signature, forKey: "signature")
        dict.updateValue(jwtToken, forKey: "jwtToken")
        self.log(try? dict.data().asString())
        return dict
    }
    
    public func decode<T: Codable>(jwtToken: String, payloadType: T.Type) -> JWT<T>? {
        let dict = self.decodeDict(jwtToken: jwtToken)
        guard let obj = try? JSONDecoder().decode(JWT<T>.self, from: dict.data()) else { return nil }
        return obj
    }
    
    public func decodePayload<T: Codable>(jwtToken: String, type: T.Type) -> T? {
        let decodedJWT = self.decode(jwtToken: jwtToken, payloadType: type)
        return decodedJWT?.payload
    }
    
}

// MARK: - Private
extension JWTDecoder {
    
    private func base64Decode(_ value: String) -> Data? {
        var base64 = value
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        let length = Double(base64.lengthOfBytes(using: .utf8))
        let requiredLength = 4 * ceil(length / 4.0)
        let paddingLength = requiredLength - length
        if paddingLength > 0 {
            let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
            base64 = base64 + padding
        }
        return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }
    
    private func decodeJWTPart(_ value: String) -> [String: Any]? {
        guard let bodyData = self.base64Decode(value),
              let json = try? JSONSerialization.jsonObject(with: bodyData, options: []),
              let dict = json as? [String: Any] else { return nil }
        return dict
    }
    
    private func log(_ string: String?) {
        guard let value = string else { return }
        print("✏️: [JWTDecoder] => \(value)")
    }
    
}


