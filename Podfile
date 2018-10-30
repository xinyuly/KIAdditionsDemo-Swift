

platform:ios,'10.0'
use_frameworks!
inhibit_all_warnings!

def pods
pod 'SnapKit'
pod 'MBProgressHUD'
end

target 'KIAdditionsDemo-Swift' do
pods
end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['ENABLE_BITCODE'] = 'YES'
config.build_settings['SWIFT_VERSION'] = '4.2'
end
end
end
