#
# Be sure to run `pod lib lint RichLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RichLabel'
  s.version          = '1.0.0'
  s.summary          = "Overview ActiveLabel An UILabel's class"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  UILabel drop-in replacement supporting Hashtags (#), Mentions (@), URLs (http://) and custom regex patterns, written in Swift

  Features
      * Swift 5.0 +
      * Default support for **Hashtags, Mentions, Links, Emails**
      * Support for custom types via regex
      * Ability to enable highlighting only for the desired types
      * Ability to trim urls
      * Super easy to use and lightweight
      * Works as UILabel drop-in replacement
      * Well tested and documented
DESC

  s.homepage         = 'https://github.com/fengmingdev/RichLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fengming' => '1028708571@qq.com' }
  s.source           = { :git => 'https://github.com/fengmingdev/RichLabel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'RichLabel/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RichLabel' => ['RichLabel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
