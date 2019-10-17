#
# Be sure to run `pod lib lint hrossouw2019.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'hrossouw2019'
  s.version          = '0.1.0'
  s.summary          = 'This is something we needed to do for IOS Bootcamp Day07.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Wow. Much pod. Very new!
                       DESC

  #s.homepage         = 'https://github.com/HRossouw42/hrossouw2019'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HRossouw42' => 'hrossouw@student.wethinkcode.co.za' }
  s.source           = { :git => 'https://github.com/HRossouw42/hrossouw2019.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'hrossouw2019/Classes/**/*'
  
  # s.resource_bundles = {
  #   'hrossouw2019' => ['hrossouw2019/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = ''UIKit', 'CoreData''
  # s.dependency 'AFNetworking', '~> 2.3'
end
