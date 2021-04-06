**JWTDecoder** is a JSON Web Tokens decoder framework for iOS in swift.

## 📲 Installation

`JWTDecoder` is available on [CocoaPods](https://cocoapods.org/pods/JWTCodable):

```ruby
pod 'JWTDecoder'
```

## 📝 How
### Code Implementation
```swift
import JWTDecoder
```

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
Create your own Payload object, For example reference from payload JSON
```swift
struct Payload: Decodable {
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
let decodedJWT:DecodedJWT? = JWTDecoder.shared.decode(jwtToken: jwtToken, payloadType: Payload.self) 
// DecodedJWT<Payload>?

decodedJWT?.header 
// JWTHeader Object

decodedJWT?.header?.algorithm  
// decode key "alg" value as String

decodedJWT?.header?.type  
// decode key "typ" value as String
        
decodedJWT?.payload  
// Payload Object
        
decodedJWT?.signature  
// signature value as String
        
decodedJWT?.jwtToken  
// jwtToken value as String
```


## 📋 Requirements

* iOS 10.0+
* Xcode 11+
* Swift 5.1+
