import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkVideoHelperPlatform extends PlatformInterface {
  ZoomVideoSdkVideoHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkVideoHelperPlatform _instance = ZoomVideoSdkVideoHelper();
  static ZoomVideoSdkVideoHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkVideoHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> startVideo() async {
    throw UnimplementedError('startVideo() has not been implemented.');
  }

  Future<String> stopVideo() async {
    throw UnimplementedError('stopVideo() has not been implemented.');
  }

  Future<bool> switchCamera(String deviceId) async {
    throw UnimplementedError('switchCamera() has not been implemented.');
  }

  Future<bool> rotateMyVideo(num rotation) async {
    throw UnimplementedError('rotateMyVideo() has not been implemented.');
  }

  Future<String> getCameraList() async {
    throw UnimplementedError('getCameraList() has not been implemented.');
  }

  Future<num> getNumberOfCameras() async {
    throw UnimplementedError('getNumberOfCameras() has not been implemented.');
  }
}

class ZoomVideoSdkVideoHelper extends ZoomVideoSdkVideoHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String> startVideo() async {
    return await methodChannel
        .invokeMethod<String>('startVideo')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopVideo() async {
    return await methodChannel
        .invokeMethod<String>('stopVideo')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<bool> switchCamera(String deviceId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("deviceId", () => deviceId);

    return await methodChannel
        .invokeMethod<bool>('switchCamera', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> rotateMyVideo(num rotation) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("rotation", () => rotation);

    return await methodChannel
        .invokeMethod<bool>('rotateMyVideo', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> getCameraList() async {
    return await methodChannel
        .invokeMethod<String>('getCameraList')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<num> getNumberOfCameras() async {
    return await methodChannel
        .invokeMethod<num>('getNumberOfCameras')
        .then<num>((num? value) => value ?? 0);
  }
}
