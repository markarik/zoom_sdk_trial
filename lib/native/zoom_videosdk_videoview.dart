import 'package:flutter/services.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_user.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkVideoViewPlatform extends PlatformInterface {
  ZoomVideoSdkVideoViewPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkVideoViewPlatform _instance = ZoomVideoSdkVideoView();
  static ZoomVideoSdkVideoViewPlatform get instance => _instance;
  static set instance(ZoomVideoSdkVideoViewPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<ZoomVideoSdkUser?> getMySelf() async {
    throw UnimplementedError('getMySelf() has not been implemented.');
  }

  Future<ZoomVideoSdkUser?> createViewInstance() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<List<ZoomVideoSdkUser>?> getRemoteUsers() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<ZoomVideoSdkUser?> getSessionHost() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String?> getSessionHostName() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String?> getSessionName() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String?> getSessionID() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String?> getSessionPassword() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }
}

class ZoomVideoSdkVideoView extends ZoomVideoSdkVideoViewPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<ZoomVideoSdkUser?> getMySelf() async {
    return await methodChannel
        .invokeMethod<ZoomVideoSdkUser?>('getMySelf')
        .then<ZoomVideoSdkUser?>((ZoomVideoSdkUser? value) => value);
  }

  @override
  Future<List<ZoomVideoSdkUser>?> getRemoteUsers() async {
    return await methodChannel
        .invokeMethod<List<ZoomVideoSdkUser>?>('getRemoteUsers')
        .then<List<ZoomVideoSdkUser>?>(
            (List<ZoomVideoSdkUser>? value) => value);
  }

  @override
  Future<ZoomVideoSdkUser?> getSessionHost() async {
    return await methodChannel
        .invokeMethod<ZoomVideoSdkUser?>('getSessionHost')
        .then<ZoomVideoSdkUser?>((ZoomVideoSdkUser? value) => value);
  }

  @override
  Future<String?> getSessionHostName() async {
    return await methodChannel
        .invokeMethod<String?>('getSessionHostName')
        .then<String?>((String? value) => value);
  }
}
