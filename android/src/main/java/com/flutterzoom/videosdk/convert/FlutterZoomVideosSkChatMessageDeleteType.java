package com.flutterzoom.videosdk.convert;

import java.util.HashMap;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKChatMessageDeleteType;

public class FlutterZoomVideosSkChatMessageDeleteType {

    private static final Map<ZoomVideoSDKChatMessageDeleteType, String> chatMessageDeleteType =
            new HashMap<ZoomVideoSDKChatMessageDeleteType, String>() {{
                put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_DLP, "ZoomVideoSDKChatMsgDeleteBy_NONE");
                put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_HOST, "ZoomVideoSDKChatMsgDeleteBy_SELF");
                put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_NONE, "ZoomVideoSDKChatMsgDeleteBy_HOST");
                put(ZoomVideoSDKChatMessageDeleteType.SDK_CHAT_DELETE_BY_SELF, "ZoomVideoSDKChatMsgDeleteBy_DLP");
            }};

    public static String valueOf(ZoomVideoSDKChatMessageDeleteType name) {
        if (name == null) return null;

        String result;
        result = chatMessageDeleteType.containsKey(name)? chatMessageDeleteType.get(name) : null;
        return result;
    }
}
