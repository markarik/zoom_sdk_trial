import 'dart:convert';
import 'dart:core';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_user.dart';

class ZoomVideoSdkChatMessage {
  String content;
  ZoomVideoSdkUser? receiverUser;
  ZoomVideoSdkUser senderUser;
  num timestamp;
  bool? isSelfSend;
  bool? isChatToAll;
  String messageID;

  ZoomVideoSdkChatMessage(this.content, this.receiverUser, this.senderUser,
      this.timestamp, this.isSelfSend, this.isChatToAll, this.messageID);

  ZoomVideoSdkChatMessage.fromJson(Map<String, dynamic> json)
      : content = json['content'],
        receiverUser = (json['receiverUser'] == null)
            ? null
            : ZoomVideoSdkUser.fromJson(jsonDecode(json['receiverUser'])),
        senderUser = ZoomVideoSdkUser.fromJson(jsonDecode(json['senderUser'])),
        timestamp = json['timestamp'],
        isSelfSend = json['isSelfSend'],
        isChatToAll = json['isChatToAll'],
        messageID = json['messageID'];

  Map<String, dynamic> toJson() => {
        'content': content,
        'receiverUser': receiverUser,
        'senderUser': senderUser,
        'timestamp': timestamp,
        'isSelfSend': isSelfSend,
        'hisChatToAll': isChatToAll,
        'messageID': messageID
      };
}
