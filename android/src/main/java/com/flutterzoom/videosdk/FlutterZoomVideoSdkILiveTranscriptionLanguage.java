package com.flutterzoom.videosdk;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKChatMessage;
import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;

public class FlutterZoomVideoSdkILiveTranscriptionLanguage {

    public static String jsonLanguageArray(List<ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage> languageList) {
        JsonArray mappedLanguageArray = new JsonArray();
        for (ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage language : languageList) {
            JsonElement jsonLanguage = new Gson().fromJson(jsonLanguage(language), JsonElement.class);
            mappedLanguageArray.add(jsonLanguage);
        }

        return mappedLanguageArray.toString();
    }

    public static String jsonLanguage(ZoomVideoSDKLiveTranscriptionHelper.ILiveTranscriptionLanguage language) {
        Map<String, Object> mappedLanguage = new HashMap<>();
        mappedLanguage.put("languageId", language.getLTTLanguageID());
        mappedLanguage.put("languageName", language.getLTTLanguageName());

        Gson gson = new GsonBuilder().create();
        String jsonLanguage = gson.toJson(mappedLanguage);

        return jsonLanguage;
    }

}
