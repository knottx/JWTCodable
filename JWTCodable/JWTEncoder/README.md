# JWTEncoder
**JWTEncoder** is a JSON Web Tokens Encoder framework for iOS in swift.

## 📲 Installation

`JWTEncoder` is available on [CocoaPods](https://cocoapods.org/pods/JWTEncoder):

```ruby
pod 'JWTEncoder'
```

## 📝 How
### Code Implementation
```swift
import JWTEncoder
```

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
