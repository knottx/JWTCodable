# JWTCodable
**JWTCodable** is a JSON Web Tokens decoder framework for iOS in swift.

## 📲 Installation

`JWTCodable` is available on [CocoaPods](https://cocoapods.org/pods/JWTCodable):

```ruby
pod 'JWTCodable'
```

if you want to use **Decoder** only you can install only `JWTDecoder` [Readme](https://github.com/knottx/JWTCodable/tree/main/JWTCodable/JWTDecoder)
```ruby
pod 'JWTDecoder'
```

if you want to use **Encoder** only you can install only `JWTEncoder` [Readme](https://github.com/knottx/JWTCodable/tree/main/JWTCodable/JWTDecoder)
```ruby
pod 'JWTEncoder'
```

## 📝 How
### Code Implementation
```swift
import JWTCodable
```

## Decoder
### Example JWT Token
```swift
let jwtToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
```

Header
```json
{
  "alg": "HS256",
  "typ": "JWT"
}
```

Payload
```json
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022
}
```

Signature
```json
HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  your-256-bit-secret)
```
#### Example Payload object
Create your own Payload object Codable, For example reference from payload JSON
```swift
struct Payload: Codable {
    var sub: String?
    var name: String?
    var iat: Int?
}
```

### Decode to [String: Any]
```swift
let dict:[String: Any] = JWTDecoder.shared.decodeDict(jwtToken: jwtToken) 
// [String: Any]
```

### Decode only Payload to Object
```swift
let payload:Payload? = JWTDecoder.shared.decodePayload(jwtToken: jwtToken, type: Payload.self) 
// Payload?
```

### Decode to Object
```swift
let jwt:JWT? = JWTDecoder.shared.decode(jwtToken: jwtToken, payloadType: Payload.self) 
// JWT<Payload>?

jwt?.header 
// value as object JWTHeader?

jwt?.payload  
// value as object Payload? 
        
jwt?.signature  
// signature value as String?
        
jwt?.jwtToken  
// jwtToken value as String?
```

## Encoder
### Create JWT Token String
```swift
let header = JWTHeader(alg: .hs256)
let payload = Payload(sub: "1234567890", name: "John Doe", iat: 1516239022)
let signature = "SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
let jwt = JWT<Payload>(header: header, payload: payload, signature: signature)
// Create JWT Object

let jwtToken = JWTEncoder.shared.encode(jwt: jwt)
// Create jwtToken value as String?

```

## 📋 Requirements

* iOS 10.0+
* Xcode 11+
* Swift 5.1+
