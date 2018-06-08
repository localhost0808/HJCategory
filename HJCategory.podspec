Pod::Spec.new do |s|
s.name     = 'HJCategory'
s.version  = '0.0.1'
#s.license  = 'MIT'
s.summary  = 'Create UIView object dot syntax Invoke.Set UIView property.(chain-type structure).'
s.homepage = 'https://github.com/localhost0808/HJCategory'
s.author   = { 'Harry' => 'harry@lingfeiwang.com' }
s.social_media_url = "http://www.lingfeiwang.com/iOS/"
s.source   = { :git => 'https://github.com/localhost0808/HJCategory.git', :tag => "v#{s.version}" }

s.description = %{
Decrease the amount of your code.
Create UIView object dot syntax Invoke.Set UIView property.(chain-type structure).
}

#pch_AF = <<-EOS

#EOS

s.source_files = 'HJCategoryDemo/HJCategory/*.{h,m}'

#s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/CommonCrypto" }
s.ios.frameworks = 'Foundation', 'UIKit'
s.tvos.frameworks = 'Foundation', 'UIKit'
s.osx.frameworks = 'Foundation', 'AppKit'

s.ios.deployment_target = '8.0' # minimum SDK with autolayout
s.osx.deployment_target = '10.7' # minimum SDK with autolayout
s.tvos.deployment_target = '9.0' # minimum SDK with autolayout
s.requires_arc = true
end
