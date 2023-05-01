
class ZoomVideoSdkSessionAudioStatisticsInfo {
  num recvFrequency;
  num recvJitter;
  num recvLatency;
  num recvPacketLossAvg;
  num recvPacketLossMax;
  num sendFrequency;
  num sendJitter;
  num sendLatency;
  num sendPacketLossAvg;
  num sendPacketLossMax;

  ZoomVideoSdkSessionAudioStatisticsInfo(
      this.recvFrequency,
      this.recvJitter,
      this.recvLatency,
      this.recvPacketLossAvg,
      this.recvPacketLossMax,
      this.sendFrequency,
      this.sendJitter,
      this.sendLatency,
      this.sendPacketLossAvg,
      this.sendPacketLossMax);

  ZoomVideoSdkSessionAudioStatisticsInfo.fromJson(Map<String, dynamic> json)
      : recvFrequency = json['recvFrequency'],
        recvJitter = json['recvJitter'],
        recvLatency = json['recvLatency'],
        recvPacketLossAvg = json['recvPacketLossAvg'],
        recvPacketLossMax = json['recvPacketLossMax'],
        sendFrequency = json['sendFrequency'],
        sendJitter = json['sendJitter'],
        sendLatency = json['sendLatency'],
        sendPacketLossAvg = json['sendPacketLossAvg'],
        sendPacketLossMax = json['sendPacketLossMax'];

  Map<String, dynamic> toJson() => {
        'recvFrequency': recvFrequency,
        'recvJitter': recvJitter,
        'recvLatency': recvLatency,
        'recvPacketLossAvg': recvPacketLossAvg,
        'recvPacketLossMax': recvPacketLossMax,
        'sendFrequency': sendFrequency,
        'sendJitter': sendJitter,
        'sendLatency': sendLatency,
        'sendPacketLossAvg': sendPacketLossAvg,
        'sendPacketLossMax': sendPacketLossMax,
      };
}

class ZoomVideoSdkSessionVideoStatisticsInfo {
  num recvFps;
  num recvFrameHeight;
  num recvFrameWidth;
  num recvJitter;
  num recvLatency;
  num recvPacketLossAvg;
  num recvPacketLossMax;
  num sendFps;
  num sendFrameHeight;
  num sendFrameWidth;
  num sendJitter;
  num sendLatency;
  num sendPacketLossAvg;
  num sendPacketLossMax;

  ZoomVideoSdkSessionVideoStatisticsInfo(
      this.recvFps,
      this.recvFrameHeight,
      this.recvFrameWidth,
      this.recvJitter,
      this.recvLatency,
      this.recvPacketLossAvg,
      this.recvPacketLossMax,
      this.sendFps,
      this.sendFrameHeight,
      this.sendFrameWidth,
      this.sendJitter,
      this.sendLatency,
      this.sendPacketLossAvg,
      this.sendPacketLossMax);

  ZoomVideoSdkSessionVideoStatisticsInfo.fromJson(Map<String, dynamic> json)
      : recvFps = json['recvFps'],
        recvFrameHeight = json['recvFps'],
        recvFrameWidth = json['recvFps'],
        recvJitter = json['recvJitter'],
        recvLatency = json['recvLatency'],
        recvPacketLossAvg = json['recvPacketLossAvg'],
        recvPacketLossMax = json['recvPacketLossMax'],
        sendFps = json['sendFps'],
        sendFrameHeight = json['sendFrameHeight'],
        sendFrameWidth = json['sendFrameWidth'],
        sendJitter = json['sendJitter'],
        sendLatency = json['sendLatency'],
        sendPacketLossAvg = json['sendPacketLossAvg'],
        sendPacketLossMax = json['sendPacketLossMax'];

  Map<String, dynamic> toJson() => {
        'recvFps': recvFps,
        'recvFrameHeight': recvFrameHeight,
        'recvFrameWidth': recvFrameWidth,
        'recvJitter': recvJitter,
        'recvLatency': recvLatency,
        'recvPacketLossAvg': recvPacketLossAvg,
        'recvPacketLossMax': recvPacketLossMax,
        'sendFps': sendFps,
        'sendFrameHeight': sendFrameHeight,
        'sendFrameWidth': sendFrameWidth,
        'sendJitter': sendJitter,
        'sendLatency': sendLatency,
        'sendPacketLossAvg': sendPacketLossAvg,
        'sendPacketLossMax': sendPacketLossMax,
      };
}

class ZoomVideoSdkSessionShareStatisticsInfo {
  num recvFps;
  num recvFrameHeight;
  num recvFrameWidth;
  num recvJitter;
  num recvLatency;
  num recvPacketLossAvg;
  num recvPacketLossMax;
  num sendFps;
  num sendFrameHeight;
  num sendFrameWidth;
  num sendJitter;
  num sendLatency;
  num sendPacketLossAvg;
  num sendPacketLossMax;

  ZoomVideoSdkSessionShareStatisticsInfo(
      this.recvFps,
      this.recvFrameHeight,
      this.recvFrameWidth,
      this.recvJitter,
      this.recvLatency,
      this.recvPacketLossAvg,
      this.recvPacketLossMax,
      this.sendFps,
      this.sendFrameHeight,
      this.sendFrameWidth,
      this.sendJitter,
      this.sendLatency,
      this.sendPacketLossAvg,
      this.sendPacketLossMax);

  ZoomVideoSdkSessionShareStatisticsInfo.fromJson(Map<String, dynamic> json)
      : recvFps = json['recvFps'],
        recvFrameHeight = json['recvFps'],
        recvFrameWidth = json['recvFps'],
        recvJitter = json['recvJitter'],
        recvLatency = json['recvLatency'],
        recvPacketLossAvg = json['recvPacketLossAvg'],
        recvPacketLossMax = json['recvPacketLossMax'],
        sendFps = json['sendFps'],
        sendFrameHeight = json['sendFrameHeight'],
        sendFrameWidth = json['sendFrameWidth'],
        sendJitter = json['sendJitter'],
        sendLatency = json['sendLatency'],
        sendPacketLossAvg = json['sendPacketLossAvg'],
        sendPacketLossMax = json['sendPacketLossMax'];

  Map<String, dynamic> toJson() => {
        'recvFps': recvFps,
        'recvFrameHeight': recvFrameHeight,
        'recvFrameWidth': recvFrameWidth,
        'recvJitter': recvJitter,
        'recvLatency': recvLatency,
        'recvPacketLossAvg': recvPacketLossAvg,
        'recvPacketLossMax': recvPacketLossMax,
        'sendFps': sendFps,
        'sendFrameHeight': sendFrameHeight,
        'sendFrameWidth': sendFrameWidth,
        'sendJitter': sendJitter,
        'sendLatency': sendLatency,
        'sendPacketLossAvg': sendPacketLossAvg,
        'sendPacketLossMax': sendPacketLossMax,
      };
}
