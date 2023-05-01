#import <Flutter/Flutter.h>
#import <ZoomVideoSdk/ZoomVideoSDKDelegate.h>

@interface FlutterZoomVideoSdkPlugin: NSObject<FlutterPlugin, FlutterStreamHandler, ZoomVideoSDKDelegate>

@property (nonatomic, strong) FlutterEventSink eventSink;

-(void) initSDK:(FlutterMethodCall *)call withResult:(FlutterResult) result;

-(void) joinSession:(FlutterMethodCall *)call withResult:(FlutterResult) result;

-(void) leaveSession:(FlutterMethodCall *)call withResult:(FlutterResult) result;

-(void) getSdkVersion:(FlutterResult) result;

-(void) openBrowser:(FlutterMethodCall *)call withResult:(FlutterResult) result;

@end
