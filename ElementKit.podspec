#
# Be sure to run `pod lib lint ElementKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ElementKit"
  s.version          = "0.1.0"
  s.summary          = "ElementKit是受启发自Data-Flow编程的思想"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description      = <<-DESC
目前流行的数据流编程的框架有RAC，ReSwift，ComponentKit等等，他们都有自己优秀的一面，RAC和ReSwift比较擅长处理UI事件为主导的数据流，而ComponentKit则是擅长处理以底层到UI的数据流向，而数据流往往是双向的。因而简历一套可以处理处理双向数据流的编程框架。
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/ElementKit"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "stonedong" => "yishuiliunian@gmail.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/ElementKit.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ElementKit' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
