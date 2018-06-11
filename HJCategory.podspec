Pod::Spec.new do |s|
s.name     = 'HJCategory'
s.version  = '0.0.3'
s.license  = 'MIT'
s.summary  = 'Create UIView object dot syntax Invoke.Set UIView property.(chain-type structure).'
s.homepage = 'https://github.com/localhost0808/HJCategory'
s.author   = { 'Harry' => 'harry@lingfeiwang.com' }
s.social_media_url = "http://www.lingfeiwang.com/iOS/"
s.source   = { :git => 'https://github.com/localhost0808/HJCategory.git', :tag => "v#{s.version}" }

s.description = %{
Decrease the amount of your code.
Create UIView object dot syntax Invoke.Set UIView property.(chain-type structure).
}

s.source_files = 'HJCategory/**/*.{h,m}'


s.frameworks = "Foundation","UIKit"
s.ios.deployment_target = '8.0'
s.requires_arc = true
end
