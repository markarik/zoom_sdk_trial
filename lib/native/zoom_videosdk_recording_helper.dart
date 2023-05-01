import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkRecordingHelperPlatform extends PlatformInterface {
  ZoomVideoSdkRecordingHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkRecordingHelperPlatform _instance =
      ZoomVideoSdkRecordingHelper();
  static ZoomVideoSdkRecordingHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkRecordingHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> canStartRecording() async {
    throw UnimplementedError('canStartRecording() has not been implemented.');
  }

  Future<String> startCloudRecording() async {
    throw UnimplementedError('startCloudRecording() has not been implemented.');
  }

  Future<String> stopCloudRecording() async {
    throw UnimplementedError('stopCloudRecording() has not been implemented.');
  }

  Future<String> pauseCloudRecording() async {
    throw UnimplementedError('pauseCloudRecording() has not been implemented.');
  }

  Future<String> resumeCloudRecording() async {
    throw UnimplementedError(
        'resumeCloudRecording() has not been implemented.');
  }

  Future<String> getCloudRecordingStatus() async {
    throw UnimplementedError(
        'getCloudRecordingStatus() has not been implemented.');
  }
}

class ZoomVideoSdkRecordingHelper extends ZoomVideoSdkRecordingHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String> canStartRecording() async {
    return await methodChannel
        .invokeMethod<String>('canStartRecording')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> startCloudRecording() async {
    return await methodChannel
        .invokeMethod<String>('startCloudRecording')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopCloudRecording() async {
    return await methodChannel
        .invokeMethod<String>('stopCloudRecording')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> pauseCloudRecording() async {
    return await methodChannel
        .invokeMethod<String>('pauseCloudRecording')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> resumeCloudRecording() async {
    return await methodChannel
        .invokeMethod<String>('resumeCloudRecording')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> getCloudRecordingStatus() async {
    return await methodChannel
        .invokeMethod<String>('getCloudRecordingStatus')
        .then<String>((String? value) => value ?? "");
  }
}
