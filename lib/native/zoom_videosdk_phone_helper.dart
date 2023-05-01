import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_phone_support_country_info.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_session_dial_in_number_info.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkPhoneHelperPlatform extends PlatformInterface {
  ZoomVideoSdkPhoneHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkPhoneHelperPlatform _instance = ZoomVideoSdkPhoneHelper();
  static ZoomVideoSdkPhoneHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkPhoneHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> cancelInviteByPhone() async {
    throw UnimplementedError('cancelInviteByPhone() has not been implemented.');
  }

  Future<String> getInviteByPhoneStatus() async {
    throw UnimplementedError(
        'getInviteByPhoneStatus() has not been implemented.');
  }

  Future<ZoomVideoSdkSupportCountryInfo?> getSupportCountryInfo() async {
    throw UnimplementedError(
        'getSupportCountryInfo() has not been implemented.');
  }

  Future<String> inviteByPhone(
      String countryCode, String phoneNumber, String name) async {
    throw UnimplementedError(
        'getSupportCountryInfo() has not been implemented.');
  }

  Future<bool> isSupportPhoneFeature() async {
    throw UnimplementedError(
        'isSupportPhoneFeature() has not been implemented.');
  }

  Future<ZoomVideoSdkSessionDialInNumberInfo?> getSessionDialInNumbers() async {
    throw UnimplementedError(
        'getSessionDialInNumbers() has not been implemented.');
  }
}

class ZoomVideoSdkPhoneHelper extends ZoomVideoSdkPhoneHelperPlatform {
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

  @override
  Future<String> cancelInviteByPhone() async {
    return await methodChannel
        .invokeMethod<String>('cancelInviteByPhone')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> getInviteByPhoneStatus() async {
    return await methodChannel
        .invokeMethod<String>('getInviteByPhoneStatus')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<ZoomVideoSdkSupportCountryInfo?> getSupportCountryInfo() async {
    var countryInfoString = await methodChannel
        .invokeMethod<String?>('getSupportCountryInfo')
        .then<String?>((String? value) => value);

    Map<String, dynamic> countryMap = jsonDecode(countryInfoString!);
    var countryInfo = ZoomVideoSdkSupportCountryInfo.fromJson(countryMap);
    return countryInfo;
  }

  @override
  Future<String> inviteByPhone(
      String countryCode, String phoneNumber, String name) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("countryCode", () => countryCode);
    params.putIfAbsent("phoneNumber", () => phoneNumber);
    params.putIfAbsent("name", () => name);

    return await methodChannel
        .invokeMethod<String>('inviteByPhone', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<bool> isSupportPhoneFeature() async {
    return await methodChannel
        .invokeMethod<bool>('isSupportPhoneFeature')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<ZoomVideoSdkSessionDialInNumberInfo?> getSessionDialInNumbers() async {
    var dialInNumberString = await methodChannel
        .invokeMethod<String?>('getSessionDialInNumbers')
        .then<String?>((String? value) => value);

    Map<String, dynamic> dialInNumberMap = jsonDecode(dialInNumberString!);
    var dialInNumber =
        ZoomVideoSdkSessionDialInNumberInfo.fromJson(dialInNumberMap);
    return dialInNumber;
  }
}
