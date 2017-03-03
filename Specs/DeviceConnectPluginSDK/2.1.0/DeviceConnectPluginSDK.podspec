# TODO: plistの変数展開はどうすれば良いだろうか。
Pod::Spec.new do |s|

    s.name         = "DeviceConnectPluginSDK"
    s.version      = "2.1.0"
    s.summary      = "Device Connect Plugin SDK"
    s.author       = "NTT DOCOMO, INC."
    s.license      = {:type => "MIT", :file => "LICENSE.TXT"}
    s.homepage     = "https://github.com/DeviceConnect/DeviceConnect-iOS"
    s.description  = <<-DESC
    Device Connect plugin SDK for iOS.
    
    This SDK defines Device Connect profiles that are in the incubation phase.
    
    Device Connect is an IoT solution for interconnecting various modern devices.
    Also available in Android: https://github.com/DeviceConnect/DeviceConnect-Android .
    DESC
    

    # プロパティのweak属性と、automatic property synthesisをサポートするために6.0以降が必要。
    s.platform     = :ios, "9.0"

    s.source       = {
        :git => "https://github.com/DeviceConnect/DeviceConnect-iOS", :branch => "master"
    }

    # エンドターゲット（アプリとか）のDebugビルドの際、対応するアーキテクチャが含まれていない
    # という旨で提供するライブラリがビルドされない問題への対処。
    s.pod_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'NO' }

    dcm_base_path = "dConnectDevicePlugin/DCMDevicePluginSDK"
    sdk_base_path = "dConnectSDK/dConnectSDKForIOS"

    # エンドターゲット（アプリとか）のプリコンパイルドヘッダー汚染の恐れあり。
    s.header_dir = "DConnectSDK", "DCMDevicePluginSDK"
    s.public_header_files = dcm_base_path + "/DCMDevicePluginSDK/Headers/*.h", sdk_base_path + "/DConnectSDK/DConnectSDK/*.h"

    s.dependency "DeviceConnectPluginSDK"

end
