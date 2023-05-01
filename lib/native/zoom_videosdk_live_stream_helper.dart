import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkLiveStreamHelperPlatform extends PlatformInterface {
  ZoomVideoSdkLiveStreamHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkLiveStreamHelperPlatform _instance =
      ZoomVideoSdkLiveStreamHelper();
  static ZoomVideoSdkLiveStreamHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkLiveStreamHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> canStartLiveStream() async {
    throw UnimplementedError('canStartLiveStream() has not been implemented.');
  }

  Future<String> startLiveStream(
      String streamUrl, String streamKey, String broadcastUrl) async {
    throw UnimplementedError('startLiveStream() has not been implemented.');
  }

  Future<String> stopLiveStream() async {
    throw UnimplementedError('stopLiveStream() has not been implemented.');
  }
}

class ZoomVideoSdkLiveStreamHelper
    extends ZoomVideoSdkLiveStreamHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String> canStartLiveStream() async {
    return await methodChannel
        .invokeMethod<String>('canStartLiveStream')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> startLiveStream(
      String streamUrl, String streamKey, String broadcastUrl) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("streamUrl", () => streamUrl);
    params.putIfAbsent("streamKey", () => streamKey);
    params.putIfAbsent("broadcastUrl", () => broadcastUrl);

    return await methodChannel
        .invokeMethod<String>('startLiveStream', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopLiveStream() async {
    return await methodChannel
        .invokeMethod<String>('stopLiveStream')
        .then<String>((String? value) => value ?? "");
  }
}
