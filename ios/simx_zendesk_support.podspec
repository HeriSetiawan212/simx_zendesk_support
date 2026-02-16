#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint simx_zendesk_support.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'simx_zendesk_support'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/simxstudio/simx_zendesk_support'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'SimxStudio' => 'setiawan.heri.bambang@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'simx_zendesk_support/Sources/simx_zendesk_support/**/*'
  s.dependency 'Flutter'
  s.dependency 'ZendeskCoreSDK'
  s.dependency 'ZendeskChatSDK'
  s.dependency 'ZendeskSupportSDK'
  s.dependency 'ZendeskAnswerBotSDK'
  s.dependency 'ZendeskCommonUISDK'
  
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  s.resource_bundles = {'simx_zendesk_support_privacy' => ['simx_zendesk_support/Sources/simx_zendesk_support/Resources/PrivacyInfo.xcprivacy']}
end
