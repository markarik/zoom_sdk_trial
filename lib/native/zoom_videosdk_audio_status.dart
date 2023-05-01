import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkAudioStatusPlatform extends PlatformInterface {
  ZoomVideoSdkAudioStatusPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkAudioStatusPlatform _instance =
      ZoomVideoSdkAudioStatus("0");
  static ZoomVideoSdkAudioStatusPlatform get instance => _instance;
  static set instance(ZoomVideoSdkAudioStatusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isMuted() async {
    throw UnimplementedError('isMuted() has not been implemented.');
  }

  Future<bool> isTalking() async {
    throw UnimplementedError('isTalking() has not been implemented.');
  }

  Future<String> getAudioType() async {
    throw UnimplementedError('getAudioType() has not been implemented.');
  }
}

class ZoomVideoSdkAudioStatus extends ZoomVideoSdkAudioStatusPlatform {
  final String userId;

  ZoomVideoSdkAudioStatus(this.userId);

  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<bool> isMuted() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<bool>('isMuted', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> isTalking() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<bool>('isTalking', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> getAudioType() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<String>('getAudioType', params)
        .then<String>((String? value) => value ?? "");
  }
}
