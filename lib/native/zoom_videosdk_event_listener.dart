import 'package:flutter/services.dart';
import 'package:events_emitter/events_emitter.dart';

class EventType {
  static const onSessionJoin = 'onSessionJoin';
  static const onSessionLeave = 'onSessionLeave';
  static const onUserJoin = 'onUserJoin';
  static const onUserLeave = 'onUserLeave';
  static const onUserVideoStatusChanged = 'onUserVideoStatusChanged';
  static const onUserAudioStatusChanged = 'onUserAudioStatusChanged';
  static const onUserShareStatusChanged = 'onUserShareStatusChanged';
  static const onLiveStreamStatusChanged = 'onLiveStreamStatusChanged';
  static const onChatNewMessageNotify = 'onChatNewMessageNotify';
  static const onUserNameChanged = 'onUserNameChanged';
  static const onUserHostChanged = 'onUserHostChanged';
  static const onUserManagerChanged = 'onUserManagerChanged';
  static const onUserActiveAudioChanged = 'onUserActiveAudioChanged';
  static const onSessionNeedPassword = 'onSessionNeedPassword';
  static const onSessionPasswordWrong = 'onSessionPasswordWrong';
  static const onError = 'onError';
  static const onCommandReceived = 'onCommandReceived';
  static const onCommandChannelConnectResult = 'onCommandChannelConnectResult';
  static const onCloudRecordingStatus = 'onCloudRecordingStatus';
  static const onHostAskUnmute = 'onHostAskUnmute';
  static const onInviteByPhoneStatus = 'onInviteByPhoneStatus';
  static const onChatDeleteMessageNotify = 'onChatDeleteMessageNotify';
  static const onLiveTranscriptionStatus = 'onLiveTranscriptionStatus';
  static const onLiveTranscriptionMsgReceived =
      'onLiveTranscriptionMsgReceived';
  static const onLiveTranscriptionMsgError = 'onLiveTranscriptionMsgError';
  static const onMultiCameraStreamStatusChanged =
      'onMultiCameraStreamStatusChanged';
  static const onRequireSystemPermission = 'onRequireSystemPermission';
  static const onSSLCertVerifiedFailNotification =
      'onSSLCertVerifiedFailNotification';
  static const onProxySettingNotification = 'onProxySettingNotification';
}

class ZoomVideoSdkEventListener {
  /// The event channel used to interact with the native platform.
  final EventChannel eventChannel = const EventChannel('eventListener');
  var eventEmitter = EventEmitter();

  addEventListener() {
    eventChannel.receiveBroadcastStream().cast().listen((event) {
      eventEmitter.emit(event['name'], event['message']);
    });
  }
}
