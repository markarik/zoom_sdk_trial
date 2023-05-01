import 'package:flutter/services.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_audio_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_audio_setting_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_chat_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_cmd_channel.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_live_stream_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_live_transcription_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_phone_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_recording_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_session.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_share_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_test_audio_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_user_helper.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_video_helper.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class RawDataMemoryMode {
  static const Stack = 'ZoomVideoSDKRawDataMemoryModeStack';
  static const Heap = 'ZoomVideoSDKRawDataMemoryModeHeap';
}

class ShareStatus {
  static const None = 'ZoomVideoSDKShareStatus_None';
  static const Stop = 'ZoomVideoSDKShareStatus_Stop';
  static const Pause = 'ZoomVideoSDKShareStatus_Pause';
  static const Start = 'ZoomVideoSDKShareStatus_Start';
  static const Resume = 'ZoomVideoSDKShareStatus_Resume';
}

class LiveStreamStatus {
  static const None = 'ZoomVideoSDKLiveStreamStatus_None';
  static const InProgress = 'ZoomVideoSDKLiveStreamStatus_InProgress';
  static const Connecting = 'ZoomVideoSDKLiveStreamStatus_Connecting';
  static const FailedTimeout = 'ZoomVideoSDKLiveStreamStatus_FailedTimeout';
  static const StartFailed = 'ZoomVideoSDKLiveStreamStatus_StartFailed';
  static const Ended = 'ZoomVideoSDKLiveStreamStatus_Ended';
}

class RecordingStatus {
  static const None = 'ZoomVideoSDKRecordingStatus_None';
  static const Start = 'ZoomVideoSDKRecordingStatus_Start';
  static const Stop = 'ZoomVideoSDKRecordingStatus_Stop';
  static const DiskFull = 'ZoomVideoSDKRecordingStatus_DiskFull';
  static const Pause = 'ZoomVideoSDKRecordingStatus_Pause';
}

class AudioType {
  static const None = 'ZoomVideoSDKAudioType_None';
  static const VOIP = 'ZoomVideoSDKAudioType_VOIP';
  static const Telephony = 'ZoomVideoSDKAudioType_Telephony';
  static const Unknown = 'ZoomVideoSDKAudioType_Unknow';
}

class VideoAspect {
  static const Original = 'ZoomVideoSDKVideoAspect_Original';
  static const FullFilled = 'ZoomVideoSDKVideoAspect_Full_Filled';
  static const LetterBox = 'ZoomVideoSDKVideoAspect_LetterBox';
  static const PanAndScan = 'ZoomVideoSDKVideoAspect_PanAndScan';
}

class VideoResolution {
  static const Resolution90 = 'ZoomVideoSDKVideoResolution_90';
  static const Resolution180 = 'ZoomVideoSDKVideoResolution_180';
  static const Resolution360 = 'ZoomVideoSDKVideoResolution_360';
  static const Resolution720 = 'ZoomVideoSDKVideoResolution_720';
  static const Resolution1080 = 'ZoomVideoSDKVideoResoluton_1080';
}

class PhoneStatus {
  static const None = 'ZoomVideoSDKPhoneStatus_None';
  static const Calling = 'ZoomVideoSDKPhoneStatus_Calling';
  static const Ringing = 'ZoomVideoSDKPhoneStatus_Ringing';
  static const Accepted = 'ZoomVideoSDKPhoneStatus_Accepted';
  static const Success = 'ZoomVideoSDKPhoneStatus_Success';
  static const Failed = 'ZoomVideoSDKPhoneStatus_Failed';
  static const Canceling = 'ZoomVideoSDKPhoneStatus_Canceling';
  static const Canceled = 'ZoomVideoSDKPhoneStatus_Canceled';
  static const CancelFailed = 'ZoomVideoSDKPhoneStatus_Cancel_Failed';
  static const Timeout = 'ZoomVideoSDKPhoneStatus_Timeout';
}

class PhoneFailedReason {
  static const None = 'ZoomVideoSDKPhoneFailedReason_None';
  static const Busy = 'ZoomVideoSDKPhoneFailedReason_Busy';
  static const NotAvailable = 'ZoomVideoSDKPhoneFailedReason_Not_Available';
  static const UserHangup = 'ZoomVideoSDKPhoneFailedReason_User_Hangup';
  static const OtherFail = 'ZoomVideoSDKPhoneFailedReason_Other_Fail';
  static const NoAnswer = 'ZoomVideoSDKPhoneFailedReason_No_Answer';
  static const BlockNoHost = 'ZoomVideoSDKPhoneFailedReason_Block_No_Host';
  static const BlockHighRate = 'ZoomVideoSDKPhoneFailedReason_Block_High_Rate';
  static const BlockTooFrequent =
      'ZoomVideoSDKPhoneFailedReason_Block_Too_Frequent';
}

class ChatMessageDeleteType {
  static const None = 'ZoomVideoSDKChatMsgDeleteBy_NONE';
  static const Self = 'ZoomVideoSDKChatMsgDeleteBy_SELF';
  static const Host = 'ZoomVideoSDKChatMsgDeleteBy_HOST';
  static const Dlp = 'ZoomVideoSDKChatMsgDeleteBy_DLP';
}

class MultiCameraStreamStatus {
  static const Joined = 'ZoomVideoSDKMultiCameraStreamStatus_Joined';
  static const Left = 'ZoomVideoSDKMultiCameraStreamStatus_Left';
}

class LiveTranscriptionStatus {
  static const Stop = 'ZoomVideoSDKLiveTranscription_Status_Stop';
  static const Start = 'ZoomVideoSDKLiveTranscription_Status_Start';
}

class SystemPermissionType {
  static const Camera = 'ZoomVideoSDKSystemPermissionType_Camera';
  static const Microphone = 'ZoomVideoSDKSystemPermissionType_Microphone';
}

class LiveTranscriptionOperationType {
  static const None = 'ZoomVideoSDKLiveTranscription_OperationType_None';
  static const Update = 'ZoomVideoSDKLiveTranscription_OperationType_Update';
  static const Delete = 'ZoomVideoSDKLiveTranscription_OperationType_Delete';
  static const Complete =
      'ZoomVideoSDKLiveTranscription_OperationType_Complete';
  static const Add = 'ZoomVideoSDKLiveTranscription_OperationType_Add';
  static const NotSupport =
      'ZoomVideoSDKLiveTranscription_OperationType_NotSupported';
}

class DialInNumberType {
  static const None = 'ZoomVideoSDKDialInNumType_None';
  static const Toll = 'ZoomVideoSDKDialInNumType_Toll';
  static const TollFree = 'ZoomVideoSDKDialInNumType_TollFree';
}

class Errors {
  static const Success = 'ZoomVideoSDKError_Success';
  static const WrongUsage = 'ZoomVideoSDKError_Wrong_Usage';
  static const InternalError = 'ZoomVideoSDKError_Internal_Error';
  static const Uninitialize = 'ZoomVideoSDKError_Uninitialize';
  static const MemoryError = 'ZoomVideoSDKError_Memory_Error';
  static const LoadModuleError = 'ZoomVideoSDKError_Load_Module_Error';
  static const UnLoadModuleError = 'ZoomVideoSDKError_UnLoad_Module_Error';
  static const InvalidParameter = 'ZoomVideoSDKError_Invalid_Parameter';
  static const CallTooFrequntly = 'ZoomVideoSDKError_Call_Too_Frequently';
  static const NoImpl = 'ZoomVideoSDKError_No_Impl';
  static const DontSupportFeature = 'ZoomVideoSDKError_Dont_Support_Feature';
  static const Unknown = 'ZoomVideoSDKError_Unknown';
  static const AuthBase = 'ZoomVideoSDKError_Auth_Base';
  static const AuthError = 'ZoomVideoSDKError_Auth_Error';
  static const AuthEmptyKeyorSecret =
      'ZoomVideoSDKError_Auth_Empty_Key_or_Secret';
  static const AuthWrongKeyorSecret =
      'ZoomVideoSDKError_Auth_Wrong_Key_or_Secret';
  static const AuthDoesNotSupportSDK =
      'ZoomVideoSDKError_Auth_DoesNot_Support_SDK';
  static const AuthDisableSDK = 'ZoomVideoSDKError_Auth_Disable_SDK';
  static const JoinSessionNoSessioName =
      'ZoomVideoSDKError_JoinSession_NoSessionName';
  static const JoinSessioNoSessionToken =
      'ZoomVideoSDKError_JoinSession_NoSessionToken';
  static const JoinSessionNoUserName =
      'ZoomVideoSDKError_JoinSession_NoUserName';
  static const JoinSessionInvalidSessionName =
      'ZoomVideoSDKError_JoinSession_Invalid_SessionName';
  static const JoinSessionInvalidPassword =
      'ZoomVideoSDKError_JoinSession_InvalidPassword';
  static const JoinSessionInvalidSessionToken =
      'ZoomVideoSDKError_JoinSession_Invalid_SessionToken';
  static const JoinSessionSessionNameTooLong =
      'ZoomVideoSDKError_JoinSession_SessionName_TooLong';
  static const JoinSessionTokenMismatchedSessionName =
      'ZoomVideoSDKError_JoinSession_Token_MismatchedSessionName';
  static const JoinSessionTokenNoSessionName =
      'ZoomVideoSDKError_JoinSession_Token_NoSessionName';
  static const JoinSessionTokenRoleTypeEmptyOrWrong =
      'ZoomVideoSDKError_JoinSession_Token_RoleType_EmptyOrWrong';
  static const JoinSessionTokenUserIdentityTooLong =
      'ZoomVideoSDKError_JoinSession_Token_UserIdentity_TooLong';
  static const SessionBase = 'ZoomVideoSDKError_Session_Base';
  static const SessionModuleNotFound =
      'ZoomVideoSDKError_Session_Module_Not_Found';
  static const SessionServiceInvaild =
      'ZoomVideoSDKError_Session_Service_Invaild';
  static const SessionJoinFailed = 'ZoomVideoSDKError_Session_Join_Failed';
  static const SessionNoRights = 'ZoomVideoSDKError_Session_No_Rights';
  static const SessionAlreadyInProgress =
      'ZoomVideoSDKError_Session_Already_In_Progress';
  static const SessionDontSupportSessionType =
      'ZoomVideoSDKError_Session_Dont_Support_SessionType';
  static const SessionReconncting = 'ZoomVideoSDKError_Session_Reconncting';
  static const SessionDisconncting = 'ZoomVideoSDKError_Session_Disconncting';
  static const SessionNotStarted = 'ZoomVideoSDKError_Session_Not_Started';
  static const SessionNeedPassword = 'ZoomVideoSDKError_Session_Need_Password';
  static const SessionPasswordWrong =
      'ZoomVideoSDKError_Session_Password_Wrong';
  static const SessionRemoteDBError =
      'ZoomVideoSDKError_Session_Remote_DB_Error';
  static const SessionInvalidParam = 'ZoomVideoSDKError_Session_Invalid_Param';
  static const SessionAudioError = 'ZoomVideoSDKError_Session_Audio_Error';
  static const SessionAudioNoMicrophone =
      'ZoomVideoSDKError_Session_Audio_No_Microphone';
  static const SessionVideoError = 'ZoomVideoSDKError_Session_Video_Error';
  static const SessionVideoDeviceError =
      'ZoomVideoSDKError_Session_Video_Device_Error';
  static const SessionLiveStreamError =
      'ZoomVideoSDKError_Session_Live_Stream_Error';
  static const SessionPhoneError = 'ZoomVideoSDKError_Session_Phone_Error';
  static const DontSupportMultiStreamVideoUser =
      'ZoomVideoSDKError_Dont_Support_Multi_Stream_Video_User';
  static const FailAssignUserPrivilege =
      'ZoomVideoSDKError_Fail_Assign_User_Privilege';
  static const NoRecordingInProcess =
      'ZoomVideoSDKError_No_Recording_In_Process';
  static const MallocFailed = 'ZoomVideoSDKError_Malloc_Failed';
  static const NotInSession = 'ZoomVideoSDKError_Not_In_Session';
  static const NoLicense = 'ZoomVideoSDKError_No_License';
  static const VideoModuleNotReady = 'ZoomVideoSDKError_Video_Module_Not_Ready';
  static const VideoModuleError = 'ZoomVideoSDKError_Video_Module_Error';
  static const VideoDeviceError = 'ZoomVideoSDKError_Video_device_error';
  static const NoVideoData = 'ZoomVideoSDKError_No_Video_Data';
  static const ShareModuleNotReady = 'ZoomVideoSDKError_Share_Module_Not_Ready';
  static const ShareModuleError = 'ZoomVideoSDKError_Share_Module_Error';
  static const NoShareData = 'ZoomVideoSDKError_No_Share_Data';
  static const AudioModuleNotReady = 'ZoomVideoSDKError_Audio_Module_Not_Ready';
  static const AudioModuleError = 'ZoomVideoSDKError_Audio_Module_Error';
  static const NoAudioData = 'ZoomVideoSDKError_No_Audio_Data';
  static const PreprocessRawdataError =
      'ZoomVideoSDKError_Preprocess_Rawdata_Error';
  static const RawdataNoDeviceRunning =
      'ZoomVideoSDKError_Rawdata_No_Device_Running';
  static const RawdataInitDevice = 'ZoomVideoSDKError_Rawdata_Init_Device';
  static const RawdataVirtualDevice =
      'ZoomVideoSDKError_Rawdata_Virtual_Device';
  static const RawdataCannotChangeVirtualDeviceInPreview =
      'ZoomVideoSDKError_Rawdata_Cannot_Change_Virtual_Device_In_Preview';
  static const RawdataInternalError =
      'ZoomVideoSDKError_Rawdata_Internal_Error';
  static const RawdataSendTooMuchDataInSingleTime =
      'ZoomVideoSDKError_Rawdata_Send_Too_Much_Data_In_Single_Time';
  static const RawdataSendTooFrequently =
      'ZoomVideoSDKError_Rawdata_Send_Too_Frequently';
  static const RawdataVirtualMicIsTerminate =
      'ZoomVideoSDKError_Rawdata_Virtual_Mic_Is_Terminate';
  static const SessionShareError = 'ZoomVideoSDKError_Session_Share_Error';
  static const SessionShareModuleNotReady =
      'ZoomVideoSDKError_Session_Share_Module_Not_Ready';
  static const SessionShareYouAreNotSharing =
      'ZoomVideoSDKError_Session_Share_You_Are_Not_Sharing';
  static const SessionShareTypeIsNotSupport =
      'ZoomVideoSDKError_Session_Share_Type_Is_Not_Support';
  static const SessionShareInternalError =
      'ZoomVideoSDKError_Session_Share_Internal_Error';
  static const Permission_RECORD_AUDIO =
      'ZoomVideoSDKError_Permission_RECORD_AUDIO';
  static const Permission_READ_PHONE_STATE =
      'ZoomVideoSDKError_Permission_READ_PHONE_STATE';
  static const BLUETOOTH_CONNECT =
      'ZoomVideoSDKError_Permission_BLUETOOTH_CONNECT';
}

class InitConfig {
  String? domain;
  bool? enableLog;
  String? logFilePrefix;
  String? appGroupId;
  bool? enableFullHD; // Availble for certain Android hardware only.
  RawDataMemoryMode? videoRawDataMemoryMode;
  RawDataMemoryMode? audioRawDataMemoryMode;
  RawDataMemoryMode? shareRawDataMemoryMode;
  String? speakerFilePath;

  //Constructor
  InitConfig(
      {required this.domain,
      required this.enableLog,
      this.logFilePrefix,
      this.appGroupId,
      this.enableFullHD,
      this.videoRawDataMemoryMode,
      this.audioRawDataMemoryMode,
      this.shareRawDataMemoryMode,
      this.speakerFilePath});
}

class JoinSessionConfig {
  String? sessionName;
  String? sessionPassword;
  String? token;
  String? userName;
  Map<String, bool>? audioOptions;
  Map<String, bool>? videoOptions;
  num? sessionIdleTimeoutMins;

  //Constructor
  JoinSessionConfig(
      {required this.sessionName,
      this.sessionPassword,
      required this.token,
      required this.userName,
      this.audioOptions,
      this.videoOptions,
      this.sessionIdleTimeoutMins});
}

abstract class ZoomVideoSdkPlatform extends PlatformInterface {
  ZoomVideoSdkPlatform() : super(token: _token);

  static final Object _token = Object();
  static ZoomVideoSdkPlatform _instance = ZoomVideoSdk();
  static ZoomVideoSdkPlatform get instance => _instance;
  static set instance(ZoomVideoSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> initSdk(InitConfig configs) async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String> joinSession(JoinSessionConfig configs) async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String> leaveSession(bool endSession) async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<String> getSdkVersion() async {
    throw UnimplementedError('initZoom() has not been implemented.');
  }

  Future<void> openBrowser(String url) async {
    throw UnimplementedError('openBrowser() has not been implemented.');
  }
}

class ZoomVideoSdk extends ZoomVideoSdkPlatform {
  var session = ZoomVideoSdkSession();
  var audioHelper = ZoomVideoSdkAudioHelper();
  var audioSettingHelper = ZoomVideoSdkAudioSettingHelper();
  var chatHelper = ZoomVideoSdkChatHelper();
  var cmdChannel = ZoomVideoSdkCmdChannel();
  var liveStreamHelper = ZoomVideoSdkLiveStreamHelper();
  var liveTranscriptionHelper = ZoomVideoSdkLiveTranscriptionHelper();
  var phoneHelper = ZoomVideoSdkPhoneHelper();
  var recordingHelper = ZoomVideoSdkRecordingHelper();
  var userHelper = ZoomVideoSdkUserHelper();
  var testAudioHelper = ZoomVideoSdkTestAudioHelper();
  var videoHelper = ZoomVideoSdkVideoHelper();
  var shareHelper = ZoomVideoSdkShareHelper();

  final methodChannel = const MethodChannel('flutter_zoom_videosdk');

  @override
  Future<String> initSdk(InitConfig configs) async {
    var configMap = <String, dynamic>{};
    configMap.putIfAbsent("domain", () => configs.domain);
    configMap.putIfAbsent("enableLog", () => configs.enableLog);
    configMap.putIfAbsent("logFilePrefix", () => configs.logFilePrefix);
    configMap.putIfAbsent("appGroupId", () => configs.appGroupId);
    configMap.putIfAbsent("enableFullHD", () => configs.enableFullHD);
    configMap.putIfAbsent(
        "videoRawDataMemoryMode", () => configs.videoRawDataMemoryMode);
    configMap.putIfAbsent(
        "audioRawDataMemoryMode", () => configs.audioRawDataMemoryMode);
    configMap.putIfAbsent(
        "shareRawDataMemoryMode", () => configs.shareRawDataMemoryMode);
    configMap.putIfAbsent("speakerFilePath", () => configs.speakerFilePath);

    return await methodChannel
        .invokeMethod<String>('initSdk', configMap)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> joinSession(JoinSessionConfig configs) async {
    var configMap = <String, dynamic>{};
    configMap.putIfAbsent("sessionName", () => configs.sessionName);
    configMap.putIfAbsent("sessionPassword", () => configs.sessionPassword);
    configMap.putIfAbsent("token", () => configs.token);
    configMap.putIfAbsent("userName", () => configs.userName);
    configMap.putIfAbsent("audioOptions", () => configs.audioOptions);
    configMap.putIfAbsent("videoOptions", () => configs.videoOptions);
    configMap.putIfAbsent(
        "sessionIdleTimeoutMins", () => configs.sessionIdleTimeoutMins);

    return await methodChannel
        .invokeMethod<String>('joinSession', configMap)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> leaveSession(bool endSession) async {
    var configMap = <String, dynamic>{};
    configMap.putIfAbsent('endSession', () => endSession);
    return await methodChannel
        .invokeMethod<String>('leaveSession', configMap)
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<String> getSdkVersion() async {
    return await methodChannel
        .invokeMethod<String>('getSdkVersion')
        .then<String>((String? value) => value ?? "");
  }

  @override
  Future<void> openBrowser(String url) async {
    var params = <String, dynamic>{};
    params.putIfAbsent('url', () => url);

    await methodChannel.invokeMethod<void>('openBrowser', params);
  }
}
