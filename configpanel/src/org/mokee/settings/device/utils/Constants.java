/*
 * Copyright (C) 2017 The MoKee Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.mokee.settings.device.utils;

import java.util.HashMap;
import java.util.Map;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

public class Constants {

    // Preference keys
    public static final String VIDEO_HDMI_RESOLUTION_KEY = "video_hdmi_resolution";

    // Proc nodes
    public static final String VIDEO_HDMI_RESOLUTION_NODE = "/sys/class/display/HDMI/mode";
    public static final String VIDEO_HDMI_RESOLUTION_MODES_NODE = "/sys/class/display/HDMI/modes";

    // Proc nodes default values
    public static final String VIDEO_HDMI_RESOLUTION_DEFAULT = "auto";

    // Holds <preference_key> -> <proc_node> mapping
    public static final Map<String, String> sBooleanNodePreferenceMap = new HashMap<>();
    public static final Map<String, String> sStringNodePreferenceMap = new HashMap<>();

    // Holds <preference_key> -> <default_values> mapping
    public static final Map<String, Object> sNodeDefaultMap = new HashMap<>();

    public static final String[] sVideoPrefKeys = {
        VIDEO_HDMI_RESOLUTION_KEY,
    };

    static {
        sStringNodePreferenceMap.put(VIDEO_HDMI_RESOLUTION_KEY, VIDEO_HDMI_RESOLUTION_NODE);

        sNodeDefaultMap.put(VIDEO_HDMI_RESOLUTION_KEY, VIDEO_HDMI_RESOLUTION_DEFAULT);
    }

    public static String getPreferenceString(Context context, String key) {
        SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
        return preferences.getString(key, (String) sNodeDefaultMap.get(key));
    }

}
