import 'dart:core';

class ZoomVideoSdkLiveTranscriptionLanguage {
  String languageId;
  String languageName;

  ZoomVideoSdkLiveTranscriptionLanguage(this.languageId, this.languageName);

  ZoomVideoSdkLiveTranscriptionLanguage.fromJson(Map<String, dynamic> json)
      : languageId = json['languageId'],
        languageName = json['languageName'];

  Map<String, dynamic> toJson() => {
        'languageId': languageId,
        'languageName': languageName,
      };
}
