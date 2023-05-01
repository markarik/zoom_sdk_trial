import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkTestAudioHelperPlatform extends PlatformInterface {
  ZoomVideoSdkTestAudioHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkTestAudioHelperPlatform _instance =
      ZoomVideoSdkTestAudioHelper();
  static ZoomVideoSdkTestAudioHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkTestAudioHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> startMicTest() async {
    throw UnimplementedError('startMicTest() has not been implemented.');
  }

  Future<String> stopMicTest() async {
    throw UnimplementedError('stopMicTest() has not been implemented.');
  }

  Future<String> playMicTest() async {
    throw UnimplementedError('playMicTest() has not been implemented.');
  }

  Future<String> startSpeakerTest() async {
    throw UnimplementedError('startSpeakerTest() has not been implemented.');
  }

  Future<String> stopSpeakerTest() async {
    throw UnimplementedError('stopSpeakerTest() has not been implemented.');
  }
}

class ZoomVideoSdkTestAudioHelper extends ZoomVideoSdkTestAudioHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String> startMicTest() async {
    return await methodChannel
        .invokeMethod<String>('startMicTest')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopMicTest() async {
    return await methodChannel
        .invokeMethod<String>('stopMicTest')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> playMicTest() async {
    return await methodChannel
        .invokeMethod<String>('playMicTest')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> startSpeakerTest() async {
    return await methodChannel
        .invokeMethod<String>('startSpeakerTest')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopSpeakerTest() async {
    return await methodChannel
        .invokeMethod<String>('stopSpeakerTest')
        .then<String>((String? value) => value ?? "");
  }
}
