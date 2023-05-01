package com.flutterzoom.videosdk;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import us.zoom.sdk.ZoomVideoSDKLiveTranscriptionHelper;
import us.zoom.sdk.ZoomVideoSDKPhoneSupportCountryInfo;

public class FlutterZoomVideoSdkPhoneSupportCountryInfo {

    public static String jsonPhoneSupportCountryInfoArray(List<ZoomVideoSDKPhoneSupportCountryInfo> countryList) {
        JsonArray mappedCountryArray = new JsonArray();
        for (ZoomVideoSDKPhoneSupportCountryInfo country : countryList) {
            JsonElement jsonCountryInfo = new Gson().fromJson(jsonSupportCountryInfo(country), JsonElement.class);
            mappedCountryArray.add(jsonCountryInfo);
        }

        return mappedCountryArray.toString();
    }

    public static String jsonSupportCountryInfo(ZoomVideoSDKPhoneSupportCountryInfo country) {
        Map<String, Object> mappedCountry = new HashMap<>();
        mappedCountry.put("countryCode", country.getCountryCode());
        mappedCountry.put("countryID", country.getCountryID());
        mappedCountry.put("countryName", country.getCountryName());

        Gson gson = new GsonBuilder().create();
        String jsonSupportCountryInfo = gson.toJson(mappedCountry);
        return jsonSupportCountryInfo;
    }

}
