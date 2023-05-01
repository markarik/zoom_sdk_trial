import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkAudioHelperPlatform extends PlatformInterface {
  ZoomVideoSdkAudioHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkAudioHelperPlatform _instance = ZoomVideoSdkAudioHelper();
  static ZoomVideoSdkAudioHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkAudioHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> canSwitchSpeaker() async {
    throw UnimplementedError('canSwitchSpeaker() has not been implemented.');
  }

  Future<bool> getSpeakerStatus() async {
    throw UnimplementedError('getSpeakerStatus() has not been implemented.');
  }

  Future<String> muteAudio(String userId) async {
    throw UnimplementedError('muteAudio() has not been implemented.');
  }

  Future<String> unMuteAudio(String userId) async {
    throw UnimplementedError('unMuteAudio() has not been implemented.');
  }

  Future<void> setSpeaker(bool isOn) async {
    throw UnimplementedError('setSpeaker() has not been implemented.');
  }

  Future<String> startAudio() async {
    throw UnimplementedError('startAudio() has not been implemented.');
  }

  Future<String> stopAudio() async {
    throw UnimplementedError('stopAudio() has not been implemented.');
  }

  Future<String> subscribe() async {
    throw UnimplementedError('subscribe() has not been implemented.');
  }

  Future<String> unSubscribe() async {
    throw UnimplementedError('unSubscribe() has not been implemented.');
  }

  Future<bool> resetAudioSession() async {
    throw UnimplementedError('resetAudioSession() has not been implemented.');
  }

  Future<void> cleanAudioSession() async {
    throw UnimplementedError('cleanAudioSession() has not been implemented.');
  }
}

class ZoomVideoSdkAudioHelper extends ZoomVideoSdkAudioHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<bool> canSwitchSpeaker() async {
    return await methodChannel
        .invokeMethod<bool>('canSwitchSpeaker')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> getSpeakerStatus() async {
    return await methodChannel
        .invokeMethod<bool>('getSpeakerStatus')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> muteAudio(String userId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<String>('muteAudio', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> unMuteAudio(String userId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<String>('unMuteAudio', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<void> setSpeaker(bool isOn) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("isOn", () => isOn);

    await methodChannel.invokeMethod<void>('setSpeaker', params);
  }

  @override
  Future<String> startAudio() async {
    return await methodChannel
        .invokeMethod<String>('startAudio')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopAudio() async {
    return await methodChannel
        .invokeMethod<String>('stopAudio')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> subscribe() async {
    return await methodChannel
        .invokeMethod<String>('startAudio')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> unSubscribe() async {
    return await methodChannel
        .invokeMethod<String>('startAudio')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<bool> resetAudioSession() async {
    return await methodChannel
        .invokeMethod<bool>('startAudio')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<void> cleanAudioSession() async {
    await methodChannel.invokeMethod<void>('cleanAudioSession');
  }
}
