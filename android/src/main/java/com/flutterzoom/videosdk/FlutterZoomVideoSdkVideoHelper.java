package com.flutterzoom.videosdk;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.flutterzoom.videosdk.convert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKCameraDevice;
import us.zoom.sdk.ZoomVideoSDKVideoHelper;
import us.zoom.sdk.ZoomVideoSDKVideoPreferenceMode;
import us.zoom.sdk.ZoomVideoSDKVideoPreferenceSetting;

public class FlutterZoomVideoSdkVideoHelper {

    private Activity activity;

    FlutterZoomVideoSdkVideoHelper(Activity activity) {
        this.activity = activity;
    }

    private ZoomVideoSDKVideoHelper getVideoHelper() {
        ZoomVideoSDKVideoHelper videoHelper = null;
        try {
            videoHelper = ZoomVideoSDK.getInstance().getVideoHelper();
            if (videoHelper == null) {
                throw new Exception("No Video Helper Found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return videoHelper;
    }

    public void setVideoQualityPreference(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> settings = call.arguments();
        if (settings == null) {
            result.error("ZoomVideoSdkVideoHelper::setVideoQualityPreference", "Missing settings", null);
        }
        ZoomVideoSDKVideoPreferenceSetting videoPreference = new ZoomVideoSDKVideoPreferenceSetting();
        ZoomVideoSDKVideoPreferenceMode videoPreferenceMode = FlutterZoomVideoSdkVideoPreferenceMode.valueOf((String) settings.get("mode"));

        videoPreference.mode = videoPreferenceMode;

        if (videoPreferenceMode == ZoomVideoSDKVideoPreferenceMode.ZoomVideoSDKVideoPreferenceMode_Custom) {
            videoPreference.maximumFrameRate = (Integer) settings.get("maximumFrameRate");
            videoPreference.minimumFrameRate = (Integer) settings.get("minimumFrameRate");
        }

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(FlutterZoomVideoSdkErrors.valueOf(getVideoHelper().setVideoQualityPreference(videoPreference)));
            }
        });
    }

    public void getCameraList(@NonNull MethodChannel.Result result) {
        ArrayList<Map<String, String>> cameraList = new ArrayList<>();
        for (ZoomVideoSDKCameraDevice device : getVideoHelper().getCameraList()) {
            Map<String, String> camera = new HashMap<>();
            camera.put("deviceId", device.getDeviceId());
            camera.put("deviceName", device.getDeviceName());
            cameraList.add(camera);
        }

        result.success(cameraList);
    }

    public void getNumberOfCameras(@NonNull MethodChannel.Result result) {
        result.success(getVideoHelper().getNumberOfCameras());
    }

    public void rotateMyVideo(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> params = call.arguments();
        double rotation = (Double) params.get("rotation");

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(getVideoHelper().rotateMyVideo((int) rotation));
            }
        });
    }

    public void startVideo(@NonNull MethodChannel.Result result) {
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(FlutterZoomVideoSdkErrors.valueOf(getVideoHelper().startVideo()));
            }
        });
    }

    public void stopVideo(@NonNull MethodChannel.Result result) {
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(FlutterZoomVideoSdkErrors.valueOf(getVideoHelper().stopVideo()));
            }
        });
    }

    public void switchCamera(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> params = call.arguments();
        String deviceId = (String) params.get("deviceId");

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (deviceId != null) {
                    ZoomVideoSDKCameraDevice device = getVideoHelper().getCameraList()
                            .stream()
                            .filter(c -> c.getDeviceId().equals(deviceId))
                            .findAny()
                            .orElse(null);
                    if (device != null) {
                        result.success(getVideoHelper().switchCamera(device));
                    }
                }
                result.success(getVideoHelper().switchCamera());
            }
        });
    }

}
