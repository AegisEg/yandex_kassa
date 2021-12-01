#import "YandexKassaPlugin.h"
#if __has_include(<yookassa_flutter_sdk/yookassa_flutter_sdk-Swift.h>)
#import <yookassa_flutter_sdk/yookassa_flutter_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "yookassa_flutter_sdk-Swift.h"
#endif

@implementation YandexKassaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftYandexKassaPlugin registerWithRegistrar:registrar];
}
@end
