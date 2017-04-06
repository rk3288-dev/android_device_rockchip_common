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

package org.mokee.settings.device;

import android.os.Bundle;
import android.preference.ListPreference;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import org.mokee.settings.device.utils.Constants;
import org.mokee.settings.device.utils.NodePreferenceActivity;

import org.mokee.internal.util.FileUtils;

public class VideoSettings extends NodePreferenceActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.video_panel);
    }

    @Override
    public void addPreferencesFromResource(int preferencesResId) {
        super.addPreferencesFromResource(preferencesResId);

        final ListPreference resolutionPref =
                (ListPreference) findPreference(Constants.VIDEO_HDMI_RESOLUTION_KEY);

        if (resolutionPref != null) {
            final ArrayList<CharSequence> modes = new ArrayList<>();

            String line = null;
            BufferedReader reader = null;

            try {
                reader = new BufferedReader(new FileReader(
                        Constants.VIDEO_HDMI_RESOLUTION_MODES_NODE), 512);

                while ((line = reader.readLine()) != null) {
                    modes.add(line);
                }
            } catch (Exception ignored) {
            } finally {
                try {
                    if (reader != null) {
                        reader.close();
                    }
                } catch (Exception ignored) {
                }
            }

            final CharSequence[] entries =
                    modes.toArray(new CharSequence[modes.size()]);

            resolutionPref.setEntries(entries);
            resolutionPref.setEntryValues(entries);
        }
    }

}
