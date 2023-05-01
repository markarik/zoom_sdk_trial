import 'dart:core';

class ZoomVideoSdkSessionDialInNumberInfo {
  String countryCode;
  String countryID;
  String countryName;
  String number;
  String displayNumber;
  String type;

  ZoomVideoSdkSessionDialInNumberInfo(this.countryCode, this.countryID,
      this.countryName, this.number, this.displayNumber, this.type);

  ZoomVideoSdkSessionDialInNumberInfo.fromJson(Map<String, dynamic> json)
      : countryCode = json['countryCode'],
        countryID = json['countryID'],
        countryName = json['countryName'],
        number = json['number'],
        displayNumber = json['displayNumber'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'countryCode': countryCode,
        'countryID': countryID,
        'countryName': countryName,
        'number': number,
        'displayNumber': displayNumber,
        'type': type,
      };
}
