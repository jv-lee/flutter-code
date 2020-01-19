#import "NrtcPlugin.h"
#import <nrtc_plugin/nrtc_plugin-Swift.h>

@implementation NrtcPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNrtcPlugin registerWithRegistrar:registrar];
}
@end
