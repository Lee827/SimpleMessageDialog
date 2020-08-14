Pod::Spec.new do |spec|

  spec.name         = "SimpleMessageDialog"
  spec.version      = "0.0.2"
  spec.summary      = "Simple Message Dialog."
  spec.description  = "This is a Simple Message Dialog."
  spec.homepage     = "https://github.com/Lee827/SimpleMessageDialog"
  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.platform     = :ios, "10.0"
  spec.ios.deployment_target = "10.0"
  spec.swift_version = "5.0"
  spec.author       = { "Elmo Lee" => "elmolee1992827@gmail.com" }
  spec.source       = { :git => "https://github.com/Lee827/SimpleMessageDialog.git", :tag => spec.version }
  spec.source_files = "SimpleMessageDialog/**/*.{h,m,swift}"

  spec.dependency "SnapKit"
  # spec.dependency "Then"
  # spec.framework = "UIKit"

  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"

end
