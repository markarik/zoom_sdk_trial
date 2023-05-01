package com.flutterzoom.videosdk_example;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;

import io.flutter.embedding.android.FlutterActivity;
import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKShareHelper;

public class MainActivity extends FlutterActivity {

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 0 && resultCode == Activity.RESULT_OK) {
            Intent intent = new Intent(this, NotificationService.class);
            ZoomVideoSDKShareHelper shareHelper = ZoomVideoSDK.getInstance().getShareHelper();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(intent);
            } else {
                startService(intent);
            }
            shareHelper.startShareScreen(data);
        }
    }

}
