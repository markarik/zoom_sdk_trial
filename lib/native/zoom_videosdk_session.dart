import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_session_static_info.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_user.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkSessionPlatform extends PlatformInterface {
  ZoomVideoSdkSessionPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkSessionPlatform _instance = ZoomVideoSdkSession();
  static ZoomVideoSdkSessionPlatform get instance => _instance;
  static set instance(ZoomVideoSdkSessionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<ZoomVideoSdkUser?> getMySelf() async {
    throw UnimplementedError('getMySelf() has not been implemented.');
  }

  Future<List<ZoomVideoSdkUser>?> getRemoteUsers() async {
    throw UnimplementedError('getRemoteUsers() has not been implemented.');
  }

  Future<ZoomVideoSdkUser?> getSessionHost() async {
    throw UnimplementedError('getSessionHost() has not been implemented.');
  }

  Future<String?> getSessionHostName() async {
    throw UnimplementedError('getSessionHostName() has not been implemented.');
  }

  Future<String?> getSessionName() async {
    throw UnimplementedError('getSessionName() has not been implemented.');
  }

  Future<String?> getSessionPassword() async {
    throw UnimplementedError('getSessionPassword() has not been implemented.');
  }

  Future<String?> getSessionID() async {
    throw UnimplementedError('getSessionID() has not been implemented.');
  }

  Future<String?> getSessionNumber() async {
    throw UnimplementedError('getSessionNumber() has not been implemented.');
  }

  Future<String?> getSessionPhonePasscode() async {
    throw UnimplementedError(
        'getSessionPhonePasscode() has not been implemented.');
  }

  Future<ZoomVideoSdkSessionAudioStatisticsInfo?>
      getAudioStatisticsInfo() async {
    throw UnimplementedError(
        'getAudioStatisticsInfo() has not been implemented.');
  }

  Future<ZoomVideoSdkSessionVideoStatisticsInfo?>
      getVideoStatisticsInfo() async {
    throw UnimplementedError(
        'getVideoStatisticsInfo() has not been implemented.');
  }

  Future<ZoomVideoSdkSessionShareStatisticsInfo?>
      getShareStatisticsInfo() async {
    throw UnimplementedError(
        'getShareStatisticsInfo() has not been implemented.');
  }
}

class ZoomVideoSdkSession extends ZoomVideoSdkSessionPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String?> getSessionName() async {
    return await methodChannel
        .invokeMethod<String?>('getSessionName')
        .then<String?>((String? value) => value);
  }

  @override
  Future<String> getSessionPassword() async {
    var pwd = await methodChannel
        .invokeMethod<String?>('getSessionPassword')
        .then<String?>((String? value) => value);
    return (pwd == null) ? "" : pwd;
  }

  @override
  Future<ZoomVideoSdkUser?> getMySelf() async {
    var userString = await methodChannel
        .invokeMethod<String?>('getMySelf')
        .then<String?>((String? value) => value);

    Map<String, dynamic> userMap = jsonDecode(userString!);
    var zoomVideoSdkUser = ZoomVideoSdkUser.fromJson(userMap);
    return zoomVideoSdkUser;
  }

  @override
  Future<List<ZoomVideoSdkUser>?> getRemoteUsers() async {
    var userListString = await methodChannel
        .invokeMethod<String?>('getRemoteUsers')
        .then<String?>((String? value) => value);

    var userListJson = jsonDecode(userListString!) as List;
    List<ZoomVideoSdkUser> userList = userListJson
        .map((userJson) => ZoomVideoSdkUser.fromJson(userJson))
        .toList();

    return userList;
  }

  @override
  Future<ZoomVideoSdkUser?> getSessionHost() async {
    var userString = await methodChannel
        .invokeMethod<String?>('getSessionHost')
        .then<String?>((String? value) => value);

    Map<String, dynamic> userMap = jsonDecode(userString!);
    var zoomVideoSdkUser = ZoomVideoSdkUser.fromJson(userMap);
    return zoomVideoSdkUser;
  }

  @override
  Future<String?> getSessionHostName() async {
    return await methodChannel
        .invokeMethod<String?>('getSessionHostName')
        .then<String?>((String? value) => value);
  }

  @override
  Future<String?> getSessionID() async {
    return await methodChannel
        .invokeMethod<String?>('getSessionID')
        .then<String?>((String? value) => value);
  }

  @override
  Future<String?> getSessionNumber() async {
    return await methodChannel
        .invokeMethod<String?>('getSessionNumber')
        .then<String?>((String? value) => value);
  }

  @override
  Future<String?> getSessionPhonePasscode() async {
    return await methodChannel
        .invokeMethod<String?>('getSessionPhonePasscode')
        .then<String?>((String? value) => value);
  }

  @override
  Future<ZoomVideoSdkSessionAudioStatisticsInfo?>
      getAudioStatisticsInfo() async {
    var infoString = await methodChannel
        .invokeMethod<String?>('getAudioStatisticsInfo')
        .then<String?>((String? value) => value);

    Map<String, dynamic> infoMap = jsonDecode(infoString!);
    var sessionAudioStatisticsInfo =
        ZoomVideoSdkSessionAudioStatisticsInfo.fromJson(infoMap);
    return sessionAudioStatisticsInfo;
  }

  @override
  Future<ZoomVideoSdkSessionVideoStatisticsInfo?>
      getVideoStatisticsInfo() async {
    var infoString = await methodChannel
        .invokeMethod<String?>('getVideoStatisticsInfo')
        .then<String?>((String? value) => value);

    Map<String, dynamic> infoMap = jsonDecode(infoString!);
    var sessionVideoStatisticsInfo =
        ZoomVideoSdkSessionVideoStatisticsInfo.fromJson(infoMap);
    return sessionVideoStatisticsInfo;
  }

  @override
  Future<ZoomVideoSdkSessionShareStatisticsInfo?>
      getShareStatisticsInfo() async {
    var infoString = await methodChannel
        .invokeMethod<String?>('getShareStatisticsInfo')
        .then<String?>((String? value) => value);

    Map<String, dynamic> infoMap = jsonDecode(infoString!);
    var sessionShareStatisticsInfo =
        ZoomVideoSdkSessionShareStatisticsInfo.fromJson(infoMap);
    return sessionShareStatisticsInfo;
  }
}
