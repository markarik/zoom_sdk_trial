import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_live_transcription_language.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ZoomVideoSdkLiveTranscriptionHelperPlatform
    extends PlatformInterface {
  ZoomVideoSdkLiveTranscriptionHelperPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkLiveTranscriptionHelperPlatform _instance =
      ZoomVideoSdkLiveTranscriptionHelper();
  static ZoomVideoSdkLiveTranscriptionHelperPlatform get instance => _instance;
  static set instance(ZoomVideoSdkLiveTranscriptionHelperPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> canStartLiveTranscription() async {
    throw UnimplementedError(
        'canStartLiveTranscription() has not been implemented.');
  }

  Future<String> startLiveTranscription() async {
    throw UnimplementedError(
        'startLiveTranscription() has not been implemented.');
  }

  Future<String> stopLiveTranscription() async {
    throw UnimplementedError(
        'stopLiveTranscription() has not been implemented.');
  }

  Future<String> getLiveTranscriptionStatus() async {
    throw UnimplementedError(
        'getLiveTranscriptionStatus() has not been implemented.');
  }

  Future<List<ZoomVideoSdkLiveTranscriptionLanguage>?>
      getAvailableSpokenLanguages() async {
    throw UnimplementedError(
        'getAvailableSpokenLanguages() has not been implemented.');
  }

  Future<String> setSpokenLanguage(num languageID) async {
    throw UnimplementedError('setSpokenLanguage() has not been implemented.');
  }

  Future<ZoomVideoSdkLiveTranscriptionLanguage> getSpokenLanguage() async {
    throw UnimplementedError('getSpokenLanguage() has not been implemented.');
  }

  Future<List<ZoomVideoSdkLiveTranscriptionLanguage>?>
      getAvailableTranslationLanguages() async {
    throw UnimplementedError(
        'getAvailableTranslationLanguages() has not been implemented.');
  }

  Future<String> setTranslationLanguage(num languageID) async {
    throw UnimplementedError(
        'setTranslationLanguage() has not been implemented.');
  }

  Future<ZoomVideoSdkLiveTranscriptionLanguage> getTranslationLanguage() async {
    throw UnimplementedError(
        'getTranslationLanguage() has not been implemented.');
  }
}

class ZoomVideoSdkLiveTranscriptionHelper
    extends ZoomVideoSdkLiveTranscriptionHelperPlatform {
  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<bool> canStartLiveTranscription() async {
    return await methodChannel
        .invokeMethod<bool>('canStartLiveTranscription')
        .then<bool>((bool? value) => value ?? false);
  }

  @override
  Future<String> startLiveTranscription() async {
    return await methodChannel
        .invokeMethod<String>('startLiveTranscription')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> stopLiveTranscription() async {
    return await methodChannel
        .invokeMethod<String>('stopLiveTranscription')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> getLiveTranscriptionStatus() async {
    return await methodChannel
        .invokeMethod<String>('getLiveTranscriptionStatus')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<List<ZoomVideoSdkLiveTranscriptionLanguage>?>
      getAvailableSpokenLanguages() async {
    var languageListString = await methodChannel
        .invokeMethod<String?>('getAvailableSpokenLanguages')
        .then<String?>((String? value) => value);

    var languageListJson = jsonDecode(languageListString!) as List;
    List<ZoomVideoSdkLiveTranscriptionLanguage> languageList = languageListJson
        .map((languageJson) =>
            ZoomVideoSdkLiveTranscriptionLanguage.fromJson(languageJson))
        .toList();

    return languageList;
  }

  @override
  Future<String> setSpokenLanguage(num languageID) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("languageID", () => languageID);

    return await methodChannel
        .invokeMethod<String>('setSpokenLanguage', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<ZoomVideoSdkLiveTranscriptionLanguage> getSpokenLanguage() async {
    var languageString = await methodChannel
        .invokeMethod<String?>('getSpokenLanguage')
        .then<String?>((String? value) => value);

    Map<String, dynamic> languageMap = jsonDecode(languageString!);
    var transcriptionLanguage =
        ZoomVideoSdkLiveTranscriptionLanguage.fromJson(languageMap);
    return transcriptionLanguage;
  }

  @override
  Future<List<ZoomVideoSdkLiveTranscriptionLanguage>?>
      getAvailableTranslationLanguages() async {
    var languageListString = await methodChannel
        .invokeMethod<String?>('getAvailableTranslationLanguages')
        .then<String?>((String? value) => value);

    var languageListJson = jsonDecode(languageListString!) as List;
    List<ZoomVideoSdkLiveTranscriptionLanguage> languageList = languageListJson
        .map((languageJson) =>
            ZoomVideoSdkLiveTranscriptionLanguage.fromJson(languageJson))
        .toList();

    return languageList;
  }

  @override
  Future<String> setTranslationLanguage(num languageID) async {
    var params = <String, dynamic>{};
    params.putIfAbsent("languageID", () => languageID);

    return await methodChannel
        .invokeMethod<String>('setTranslationLanguage', params)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<ZoomVideoSdkLiveTranscriptionLanguage> getTranslationLanguage() async {
    var languageString = await methodChannel
        .invokeMethod<String?>('getTranslationLanguage')
        .then<String?>((String? value) => value);

    Map<String, dynamic> languageMap = jsonDecode(languageString!);
    var transcriptionLanguage =
        ZoomVideoSdkLiveTranscriptionLanguage.fromJson(languageMap);
    return transcriptionLanguage;
  }
}
