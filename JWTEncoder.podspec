Pod::Spec.new do |spec|

  spec.name         = "JWTEncoder"
  spec.version      = "1.3.0"
  spec.summary      = "JSON Web Tokens Encoder framework for iOS in swift"

  spec.homepage     = "https://github.com/knottx/JWTCodable"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Visarut Tippun" => "knotto.vt@gmail.com" }
  spec.source       = { :git => "https://github.com/knottx/JWTCodable.git", :tag => "#{spec.version}" }
  
  spec.swift_version   = "5.1"
  spec.ios.deployment_target = "10.0"
  spec.source_files  = "JWTCodable/JWTEncoder/JWTEncoder/**/*.swift", 
                        "JWTCodable/Extensions/**/*.swift"
  spec.requires_arc  = true

end
