# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Auctix' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Auctix
  pod 'FirebaseUI/Storage'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'PinLayout'
  pod 'SnapKit'
end

post_install do |installer|
 installer.pods_project.build_configurations.each do |config|
   config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
 end
end