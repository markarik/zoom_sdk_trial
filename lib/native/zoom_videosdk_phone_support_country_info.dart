import 'dart:core';

class ZoomVideoSdkSupportCountryInfo {
  String countryCode;
  String countryID;
  String countryName;

  ZoomVideoSdkSupportCountryInfo(
      this.countryCode, this.countryID, this.countryName);

  ZoomVideoSdkSupportCountryInfo.fromJson(Map<String, dynamic> json)
      : countryCode = json['countryCode'],
        countryID = json['countryID'],
        countryName = json['countryName'];

  Map<String, dynamic> toJson() => {
        'countryCode': countryCode,
        'countryID': countryID,
        'countryName': countryName,
      };
}
