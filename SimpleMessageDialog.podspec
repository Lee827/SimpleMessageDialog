Pod::Spec.new do |spec|

  spec.name         = "SimpleMessageDialog"
  spec.version      = "1.2.2"
  spec.summary      = "Simple Message Dialog."
  spec.description  = "This is a Simple Message Dialog."
  spec.homepage     = "https://github.com/Lee827/SimpleMessageDialog"
  spec.license      = "MIT"
  spec.platform     = :ios, "12.0"
  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5.0"
  spec.author       = { "Elmo Lee" => "elmolee1992827@gmail.com" }
  spec.source       = { :git => "https://github.com/Lee827/SimpleMessageDialog.git", :tag => spec.version }
  spec.source_files = "SimpleMessageDialog/**/*.{h,m,swift}"

  spec.dependency "SnapKit"

end
