package com.flutterzoom.videosdk.convert;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKRecordingStatus;

public class FlutterZoomVideoSdkRecordingStatus {

    private static final Map<ZoomVideoSDKRecordingStatus, String> recordingStatus =
            new HashMap<ZoomVideoSDKRecordingStatus, String>() {{
                put(ZoomVideoSDKRecordingStatus.Recording_Start, "Recording_Start");
                put(ZoomVideoSDKRecordingStatus.Recording_Stop, "Recording_Stop");
                put(ZoomVideoSDKRecordingStatus.Recording_DiskFull, "Recording_DiskFull");
                put(ZoomVideoSDKRecordingStatus.Recording_Pause, "Recording_Pause");
            }};

    public static String valueOf(ZoomVideoSDKRecordingStatus status) {
        if (status == null) return null;

        String result;
        result = recordingStatus.containsKey(status)? recordingStatus.get(status) : null;
        return result;
    }

}
