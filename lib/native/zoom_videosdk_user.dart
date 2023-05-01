import 'dart:core';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_audio_status.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_share_statistic_info.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_video_statistic_info.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_video_status.dart';

class ZoomVideoSdkUser {
  String userId;
  String customUserId;
  String userName;
  bool? isHost;
  bool? isManager;
  bool isSharing;
  bool? hasMultiCamera;
  String? multiCameraIndex;
  ZoomVideoSdkAudioStatus? audioStatus;
  ZoomVideoSdkVideoStatus? videoStatus;
  ZoomVideoSdkVideoStatisticInfo? videoStatisticInfo;
  ZoomVideoSdkShareStatisticInfo? shareStatisticInfo;

  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  ZoomVideoSdkUser(
      this.userId,
      this.customUserId,
      this.userName,
      this.isHost,
      this.isManager,
      this.hasMultiCamera,
      this.multiCameraIndex,
      this.isSharing);

  ZoomVideoSdkUser.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        customUserId = json['customUserId'],
        userName = json['userName'],
        isHost = json['isHost'],
        isManager = json['isManager'],
        isSharing = false,
        hasMultiCamera = json['hasMultiCamera'],
        multiCameraIndex = json['multiCameraIndex'],
        audioStatus = ZoomVideoSdkAudioStatus(json['userId']),
        videoStatus = ZoomVideoSdkVideoStatus(json['userId']),
        videoStatisticInfo = ZoomVideoSdkVideoStatisticInfo(json['userId']),
        shareStatisticInfo = ZoomVideoSdkShareStatisticInfo(json['userId']);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'customUserId': customUserId,
        'userName': userName,
        'isHost': isHost,
        'isManager': isManager,
        'hasMultiCamera': hasMultiCamera,
        'multiCameraIndex': multiCameraIndex
      };

  Future<String> getUserName() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<String>('getUserName', params)
        .then<String>((String? value) => value ?? "");
  }

  Future<String> getShareStatus() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<String>('getShareStatus', params)
        .then<String>((String? value) => value ?? "");
  }

  Future<bool> getIsHost() async {
    var params = <String, dynamic>{};
    params.putIfAbsent("userId", () => userId);

    return await methodChannel
        .invokeMethod<bool>('isHost', params)
        .then<bool>((bool? value) => value ?? false);
  }
}
