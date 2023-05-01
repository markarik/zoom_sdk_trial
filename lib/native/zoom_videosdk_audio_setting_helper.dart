import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkAudioSettingHelperPlatform
    extends PlatformInterface {
  ZoomVideoSdkAudioSettingHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkAudioSettingHelperPlatform _instance =
      ZoomVideoSdkAudioSettingHelper();
  static ZoomVideoSdkAudioSettingHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkAudioSettingHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isMicOriginalInputEnable() async {
    throw UnimplementedError(
        'isMicOriginalInputEnable() has not been implemented.');
  }

  Future<String> enableMicOriginalInput(bool enable) async {
    throw UnimplementedError(
        'enableMicOriginalInput() has not been implemented.');
  }
}

class ZoomVideoSdkAudioSettingHelper
    extends ZoomVideoSdkAudioSettingHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<bool> isMicOriginalInputEnable() async {
    return await methodChannel
        .invokeMethod<bool>('isMicOriginalInputEnable')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> enableMicOriginalInput(bool enable) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("enable", () => enable);

    return await methodChannel
        .invokeMethod<String>('enableMicOriginalInput', params)
        .then<String>((String? value) => value ?? "");
  }
}
