package com.flutterzoom.videosdk;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.flutterzoom.videosdk.convert.*;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import us.zoom.sdk.ZoomVideoSDK;
import us.zoom.sdk.ZoomVideoSDKChatHelper;
import us.zoom.sdk.ZoomVideoSDKUser;

public class FlutterZoomVideoSdkChatHelper {

    private Activity activity;

    FlutterZoomVideoSdkChatHelper(Activity activity) {
        this.activity = activity;
    }

    private ZoomVideoSDKChatHelper getChatHelper() {
        ZoomVideoSDKChatHelper chatHelper = null;
        try {
            chatHelper = ZoomVideoSDK.getInstance().getChatHelper();
            if (chatHelper == null) {
                throw new Exception("No Chat Helper Available");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return chatHelper;
    }

    public void isChatDisabled(@NonNull MethodChannel.Result result) {
        ZoomVideoSDKChatHelper chatHelper = getChatHelper();
        result.success(chatHelper.isChatDisabled());
    }

    public void isPrivateChatDisabled(@NonNull MethodChannel.Result result) {
        ZoomVideoSDKChatHelper chatHelper = getChatHelper();
        result.success(chatHelper.isPrivateChatDisabled());
    }

    public void sendChatToUser(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> param = call.arguments();
        String userId = (String) param.get("userId");
        String message = (String) param.get("message");

        ZoomVideoSDKChatHelper chatHelper = getChatHelper();
        if (chatHelper.isChatDisabled() || chatHelper.isPrivateChatDisabled()) {
            return;
        }
        ZoomVideoSDKUser user = FlutterZoomVideoSdkUser.getUser(userId);

        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(FlutterZoomVideoSdkErrors.valueOf(chatHelper.sendChatToUser(user, message)));
            }
        });
    }

    public void sendChatToAll(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> args = call.arguments();
        String message = (String) args.get("message");

        ZoomVideoSDKChatHelper chatHelper = getChatHelper();
        if (chatHelper.isChatDisabled()) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(FlutterZoomVideoSdkErrors.valueOf(chatHelper.sendChatToAll(message)));
            }
        });
    }

    public void deleteChatMessage(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> args = call.arguments();
        String msgId = (String) args.get("msgId");

        ZoomVideoSDKChatHelper chatHelper = getChatHelper();
        if (chatHelper.isChatDisabled()) {
            return;
        }
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                result.success(FlutterZoomVideoSdkErrors.valueOf(chatHelper.deleteChatMessage(msgId)));
            }
        });
    }

    public void canChatMessageBeDeleted(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        Map<String, Object> args = call.arguments();
        String msgId = (String) args.get("msgId");

        ZoomVideoSDKChatHelper chatHelper = getChatHelper();
        if (chatHelper.isChatDisabled()) {
            return;
        }
        result.success(chatHelper.canChatMessageBeDeleted(msgId));
    }

}
