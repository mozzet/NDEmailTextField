Pod::Spec.new do |s|
  s.name         = "NDEmailTextField"
  s.version      = "1.0.1"
  s.summary      = "Autocomplete email text field for iOS."
  s.homepage     = "https://github.com/mozzet/NDEmailTextField"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "KimDarren" => "korean.darren@gmail.com" }
  s.source       = { :git => "https://github.com/mozzet/NDEmailTextField.git",
                     :tag => "#{s.version}" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
