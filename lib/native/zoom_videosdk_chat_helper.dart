import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkChatHelperPlatform extends PlatformInterface {
  ZoomVideoSdkChatHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkChatHelperPlatform _instance = ZoomVideoSdkChatHelper();
  static ZoomVideoSdkChatHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkChatHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isChatDisabled() async {
    throw UnimplementedError('isChatDisabled() has not been implemented.');
  }

  Future<bool> isPrivateChatDisabled() async {
    throw UnimplementedError(
        'isPrivateChatDisabled() has not been implemented.');
  }

  Future<String> sendChatToUser(String userId, String message) async {
    throw UnimplementedError('sendChatToUser() has not been implemented.');
  }

  Future<String> sendChatToAll(String message) async {
    throw UnimplementedError('sendChatToAll() has not been implemented.');
  }

  Future<String> deleteChatMessage(String msgId) async {
    throw UnimplementedError('deleteChatMessage() has not been implemented.');
  }

  Future<bool> canChatMessageBeDeleted(String msgId) async {
    throw UnimplementedError(
        'canChatMessageBeDeleted() has not been implemented.');
  }
}

class ZoomVideoSdkChatHelper extends ZoomVideoSdkChatHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<bool> isChatDisabled() async {
    return await methodChannel
        .invokeMethod<bool>('isChatDisabled')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<bool> isPrivateChatDisabled() async {
    return await methodChannel
        .invokeMethod<bool>('isPrivateChatDisabled')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> sendChatToUser(String userId, String message) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);
    params.putIfAbsent("message", () => message);

    return await methodChannel
        .invokeMethod<String>('sendChatToUser', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> sendChatToAll(String message) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("message", () => message);

    return await methodChannel
        .invokeMethod<String>('sendChatToAll', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> deleteChatMessage(String msgId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("msgId", () => msgId);

    return await methodChannel
        .invokeMethod<String>('deleteChatMessage', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<bool> canChatMessageBeDeleted(String msgId) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("msgId", () => msgId);

    return await methodChannel
        .invokeMethod<bool>('canChatMessageBeDeleted', params)
        .then<bool>((bool? value) => value ?? false);
  }
}
