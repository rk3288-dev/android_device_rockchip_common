#
# Copyright 2014 Rockchip Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.rockchip.rc:root/init.rockchip.rc \
    $(LOCAL_PATH)/rootdir/init.rk30board.rc:root/init.rk30board.rc \
    $(LOCAL_PATH)/rootdir/init.rk30board.usb.rc:root/init.rk30board.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.rockchip.rc:root/ueventd.rk30board.rc

# Config panel
PRODUCT_PACKAGES += \
    ConfigPanel

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_default.xml:system/etc/media_profiles_default.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/rk29-keypad.kl:system/usr/keylayout/rk29-keypad.kl \
    $(LOCAL_PATH)/keylayout/20050030_pwm.kl:system/usr/keylayout/20050030_pwm.kl \
    $(LOCAL_PATH)/keylayout/ff680000_pwm.kl:system/usr/keylayout/ff680000_pwm.kl

# WLAN
PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    dhcpcd.conf

# PPPoE
PRODUCT_PACKAGES += \
    libpppoe-jni \
    pppoe-service

PRODUCT_SYSTEM_SERVER_JARS += \
    pppoe-service

$(call inherit-product, vendor/rockchip/pppoe/pppoe.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/pppoe/android.software.pppoe.xml:system/etc/permissions/android.software.pppoe.xml

# Connectivity
ifeq ($(filter MediaTek_mt7601 MediaTek RealTek Espressif,$(strip $(BOARD_CONNECTIVITY_VENDOR))),)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.connectivity.rc:root/init.connectivity.rc
endif

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_rk30board.conf:system/etc/audio_policy.conf

# For audio-recoard
PRODUCT_PACKAGES += \
    libsrec_jni

# For tts test
PRODUCT_PACKAGES += \
    libwebrtc_audio_coding

# Camera
$(call inherit-product-if-exists, hardware/rockchip/camera/Config/rk32xx_camera.mk)
$(call inherit-product-if-exists, hardware/rockchip/camera/Config/user.mk)

# Audio
$(call inherit-product-if-exists, hardware/rockchip/audio/tinyalsa_hal/codec_config/rk_audio.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    NoiseField \
    PhaseBeam \
    librs_jni \
    libjni_pinyinime \
    package_phonemode.xml

# HALs
PRODUCT_PACKAGES += \
    power.$(TARGET_BOARD_PLATFORM) \
    sensors.rk30board \
    gralloc.rk30board \
    hwcomposer.rk30board \
    lights.$(TARGET_BOARD_PLATFORM) \
    camera.rk30board \
    Camera \
    libvpu \
    libstagefrighthw \
    libgralloc_priv_omx \
    akmd

# iep
ifneq ($(filter rk3190 rk3026 rk3288 rk312x rk3188,$(strip $(TARGET_BOARD_PLATFORM))),)
PRODUCT_PACKAGES += \
    libiep
endif

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Allows healthd to boot directly from charger mode rather than initiating a reboot.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.enable_boot_charger_mode=0

# Audio
PRODUCT_PACKAGES += \
    audio_policy.rk30board \
    audio.primary.rk30board \
    audio.alsa_usb.rk30board \
    audio.a2dp.default\
    audio.r_submix.default\
    libaudioroute\
    audio.usb.default

PRODUCT_PACKAGES += \
    libasound \
    alsa.default \
    acoustics.default \
    libtinyalsa

PRODUCT_PACKAGES += \
    alsa.audio.primary.rk30board\
    alsa.audio_policy.rk30board

$(call inherit-product-if-exists, external/alsa-lib/copy.mk)
$(call inherit-product-if-exists, external/alsa-utils/copy.mk)

# Filesystem management tools
# EXT3/4 support
PRODUCT_PACKAGES += \
    mke2fs \
    e2fsck \
    tune2fs \
    resize2fs

ifeq ($(strip $(BOARD_HAVE_BLUETOOTH)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.bt_enable=true
else
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.bt_enable=false
endif

ifeq ($(strip $(MT6622_BT_SUPPORT)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.btchip=mt6622
endif

ifeq ($(strip $(BLUETOOTH_USE_BPLUS)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.btchip=broadcom.bplus
endif

ifeq ($(strip $(MT7601U_WIFI_SUPPORT)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.wifichip=mt7601u
endif

PRODUCT_TAGS += dalvik.gc.type-precise

# DRM
PRODUCT_PACKAGES += \
    drmservice

# GPS
ifeq ($(strip $(BOARD_HAS_GPS)),true)
PRODUCT_PROPERTY_OVERRIDES += ro.factory.hasGPS=true
else
PRODUCT_PROPERTY_OVERRIDES += ro.factory.hasGPS=false
endif

# Ethernet
ifneq ($(strip $(BOARD_HAS_ETHERNET)),true)
PRODUCT_PROPERTY_OVERRIDES += ro.rk.ethernet_enable=false
endif

# Battery
ifeq ($(strip $(BOARD_HAS_BATTERY)), true)
PRODUCT_PROPERTY_OVERRIDES += ro.factory.without_battery=false
else
PRODUCT_PROPERTY_OVERRIDES += ro.factory.without_battery=true
endif

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/init.recovery.rk30board.rc:root/init.recovery.rk30board.rc

# WLAN
ifneq ($(filter MediaTek combo_mt66xx, $(strip $(BOARD_CONNECTIVITY_MODULE))), )
$(call inherit-product-if-exists, hardware/mediatek/config/$(strip $(BOARD_CONNECTIVITY_MODULE))/product_package.mk)
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), mt5931_6622)
$(call inherit-product-if-exists, hardware/mediatek/config/$(strip $(BOARD_CONNECTIVITY_MODULE))/product_package.mk)
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), RealTek)
$(call inherit-product-if-exists, hardware/realtek/wlan/config/config-rtl.mk)
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), Espressif)
$(call inherit-product-if-exists, hardware/esp/wlan/config/config-espressif.mk)
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), ap6xxx_nfc)
#NFC packages
PRODUCT_PACKAGES += \
    nfc_nci.rk30board \
    NfcNci \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access.xml
else
NFCEE_ACCESS_PATH := $(LOCAL_PATH)/nfc/nfcee_access_debug.xml
endif

copyNfcFirmware = $(subst XXXX,$(strip $(1)),hardware/broadcom/nfc/firmware/XXXX:/system/vendor/firmware/XXXX)
# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/nfc/libnfc-brcm-20791b03.conf:system/etc/libnfc-brcm-20791b03.conf \
    $(LOCAL_PATH)/nfc/libnfc-brcm-20791b04.conf:system/etc/libnfc-brcm-20791b04.conf \
    $(LOCAL_PATH)/nfc/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf \
    $(LOCAL_PATH)/nfc/libnfc-brcm-43341b00.conf:system/etc/libnfc-brcm-43341b00.conf \
    $(call copyNfcFirmware, BCM20791B3_002.004.010.0161.0000_Generic_I2CLite_NCD_Signed_configdata.ncd) \
    $(call copyNfcFirmware, BCM20791B3_002.004.010.0161.0000_Generic_PreI2C_NCD_Signed_configdata.ncd) \
    $(call copyNfcFirmware, BCM20791B5_002.006.013.0011.0000_Generic_I2C_NCD_Unsigned_configdata.ncd) \
    $(call copyNfcFirmware, BCM43341NFCB0_002.001.009.0021.0000_Generic_I2C_NCD_Signed_configdata.ncd) \
    $(call copyNfcFirmware, BCM43341NFCB0_002.001.009.0021.0000_Generic_PreI2C_NCD_Signed_configdata.ncd)
endif # ap6xxx_nfc

# for realtek bluetooth
PRODUCT_PACKAGES += \
    bluetooth_rtk.default \
    libbt-vendor-rtl8723bs \
    libbt-vendor-rtl8723bu

# for realtek and esp8089 wifi
PRODUCT_PACKAGES += \
    wpa_supplicant_rtl \
    wpa_supplicant_esp \
    hostapd_rtl \
    hostapd_esp

$(call inherit-product-if-exists, vendor/rockchip/common/device-vendor.mk)

# Remote Control
ifeq ($(strip $(BOARD_HAS_REMOTECONTROL)),true)
PRODUCT_PROPERTY_OVERRIDES += ro.config.enable.remotecontrol=true
else
PRODUCT_PROPERTY_OVERRIDES += ro.config.enable.remotecontrol=false
endif

ifeq ($(strip $(BUILD_WITH_MTP_OPT)),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.enable.mtp_opt=true
endif

# HDMI CEC
ifeq ($(strip $(BOARD_SUPPORT_HDMI_CEC)),true)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml
PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=4
PRODUCT_PACKAGES += hdmi_cec.rk30board
endif # BOARD_SUPPORT_HDMI_CEC

PRODUCT_PACKAGES += \
    displayd
