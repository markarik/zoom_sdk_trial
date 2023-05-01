package com.flutterzoom.videosdk.convert;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKMultiCameraStreamStatus;

public class FlutterZoomVideoSdkMultiCameraStreamStatus {

    private static final Map<ZoomVideoSDKMultiCameraStreamStatus, String> multiCameraStreamStatus =
            new HashMap<ZoomVideoSDKMultiCameraStreamStatus, String>() {{
                put(ZoomVideoSDKMultiCameraStreamStatus.Status_Joined, "ZoomVideoSDKMultiCameraStreamStatus_Joined");
                put(ZoomVideoSDKMultiCameraStreamStatus.Status_Left, "ZoomVideoSDKMultiCameraStreamStatus_Left");
            }};

    public static String valueOf(ZoomVideoSDKMultiCameraStreamStatus name) {
        if (name == null) return null;

        String result;
        result = multiCameraStreamStatus.containsKey(name)? multiCameraStreamStatus.get(name) : null;
        return result;
    }

}
