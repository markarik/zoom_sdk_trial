import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkCmdChannelPlatform extends PlatformInterface {
  ZoomVideoSdkCmdChannelPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkCmdChannelPlatform _instance = ZoomVideoSdkCmdChannel();
  static ZoomVideoSdkCmdChannelPlatform get instance => _instance;
  static set instance(ZoomVideoSdkCmdChannelPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> sendCommand(String receiverId, String strCmd) async {
    throw UnimplementedError('sendCommand() has not been implemented.');
  }
}

class ZoomVideoSdkCmdChannel extends ZoomVideoSdkCmdChannelPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String> sendCommand(String receiverId, String strCmd) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("receiverId", () => receiverId);
    params.putIfAbsent("strCmd", () => strCmd);

    return await methodChannel
        .invokeMethod<String>('sendCommand', params)
        .then<String>((String? value) => value ?? "");
  }
}
