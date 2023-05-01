import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkShareHelperPlatform extends PlatformInterface {
  ZoomVideoSdkShareHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkShareHelperPlatform _instance = ZoomVideoSdkShareHelper();
  static ZoomVideoSdkShareHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkShareHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> shareScreen() async {
    throw UnimplementedError('shareScreen() has not been implemented.');
  }

  Future<void> shareView() async {
    throw UnimplementedError('shareView() has not been implemented.');
  }

  Future<String?> lockShare(bool lock) async {
    throw UnimplementedError('lockShare() has not been implemented.');
  }

  Future<String?> stopShare() async {
    throw UnimplementedError('stopShare() has not been implemented.');
  }

  Future<bool> isOtherSharing() async {
    throw UnimplementedError('isOtherSharing() has not been implemented.');
  }

  Future<bool> isScreenSharingOut() async {
    throw UnimplementedError('isScreenSharingOut() has not been implemented.');
  }

  Future<bool> isShareLocked() async {
    throw UnimplementedError('isShareLocked() has not been implemented.');
  }

  Future<bool> isSharingOut() async {
    throw UnimplementedError('isSharingOut() has not been implemented.');
  }

  Future<bool> isShareDeviceAudioEnabled() async {
    throw UnimplementedError(
        'isShareDeviceAudioEnabled() has not been implemented.');
  }
}

class ZoomVideoSdkShareHelper extends ZoomVideoSdkShareHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<void> shareScreen() async {
    return await methodChannel.invokeMethod<void>('shareScreen');
  }

  @override
  Future<void> shareView() async {
    return await methodChannel.invokeMethod<void>('shareView');
  }

  @override
  Future<String> lockShare(bool lock) async {
    var params = <String, dynamic>{};
    params.putIfAbsent('lock', () => lock);
    return await methodChannel
        .invokeMethod<String>('lockShare', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String?> stopShare() async {
    return await methodChannel
        .invokeMethod<String?>('stopShare')
        .then<String?>((String? value) => value);
  }

  @override
  Future<bool> isOtherSharing() async {
    return await methodChannel
        .invokeMethod<bool>('isOtherSharing')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> isScreenSharingOut() async {
    return await methodChannel
        .invokeMethod<bool>('isScreenSharingOut')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> isShareLocked() async {
    return await methodChannel
        .invokeMethod<bool>('isShareLocked')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> isSharingOut() async {
    return await methodChannel
        .invokeMethod<bool>('isSharingOut')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> isShareDeviceAudioEnabled() async {
    return await methodChannel
        .invokeMethod<bool>('isShareDeviceAudioEnabled')
        .then<bool>((bool? value) => value ?? false);
  }
}
