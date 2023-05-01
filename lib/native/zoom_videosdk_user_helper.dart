import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkUserHelperPlatform extends PlatformInterface {
  ZoomVideoSdkUserHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkUserHelperPlatform _instance = ZoomVideoSdkUserHelper();
  static ZoomVideoSdkUserHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkUserHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> changeName(String userId, String name) async {
    throw UnimplementedError('changeName() has not been implemented.');
  }

  Future<bool> makeHost(String userId) async {
    throw UnimplementedError('makeHost() has not been implemented.');
  }

  Future<bool> makeManager(String userId) async {
    throw UnimplementedError('makeManager() has not been implemented.');
  }

  Future<bool> revokeManager(String userId) async {
    throw UnimplementedError('revokeManager() has not been implemented.');
  }

  Future<String> removeUser(String userId) async {
    throw UnimplementedError('removeUser() has not been implemented.');
  }
}

class ZoomVideoSdkUserHelper extends ZoomVideoSdkUserHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<bool> changeName(String userId, String name) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);
    params.putIfAbsent("name", () => name);

    return await methodChannel
        .invokeMethod<bool>('changeName', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> makeHost(String userId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("makeHost", () => userId);

    return await methodChannel
        .invokeMethod<bool>('makeHost', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> makeManager(String userId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<bool>('makeManager', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> revokeManager(String userId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<bool>('revokeManager', params)
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> removeUser(String userId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<String>('removeUser', params)
        .then<String>((String? value) => value ?? "");
  }
}
