#
# Copyright 2014 The Android Open-Source Project
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

COMMON_DEVICE_PATH := device/rockchip/common
COMMON_VENDOR_PATH := vendor/rockchip/common

# Use the non-open-source parts, if they're present
-include $(COMMON_VENDOR_PATH)/BoardConfigVendor.mk

# Platform
TARGET_BOARD_HARDWARE ?= rk30board

# Kernel
BOARD_KERNEL_BASE ?= 0x60080000
BOARD_KERNEL_PAGESIZE ?= 16384
BOARD_KERNEL_IMAGE_NAME ?= zImage
BOARD_CUSTOM_BOOTIMG_MK ?= $(COMMON_DEVICE_PATH)/mkbootimg.mk

TARGET_KERNEL_ARCH ?= arm
TARGET_KERNEL_HEADER_ARCH ?= arm
TARGET_KERNEL_CROSS_COMPILE_PREFIX ?= arm-eabi-

KERNEL_TOOLCHAIN ?= $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-4.8/bin

# GPU configration
BOARD_USE_LCDC_COMPOSER ?= false
GRAPHIC_MEMORY_PROVIDER ?= ump
USE_OPENGL_RENDERER ?= true
TARGET_DISABLE_TRIPLE_BUFFERING ?= false
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK ?= false

DEVICE_HAVE_LIBRKVPU ?= true

ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali400)
BOARD_EGL_CFG := $(COMMON_VENDOR_PATH)/gpu/Mali400/lib/arm/egl.cfg
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali450)
BOARD_EGL_CFG := $(COMMON_VENDOR_PATH)/gpu/Mali450/lib/x86/egl.cfg
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), mali-t760)
BOARD_EGL_CFG := $(COMMON_VENDOR_PATH)/gpu/MaliT760/etc/egl.cfg
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM_GPU)), PVR540)
BOARD_EGL_CFG ?= $(COMMON_VENDOR_PATH)/gpu/PVR540/egl.cfg
endif

TARGET_BOOTLOADER_BOARD_NAME ?= rk30sdk
TARGET_NO_BOOTLOADER ?= true

DEVICE_PACKAGE_OVERLAYS += $(COMMON_DEVICE_PATH)/overlay

TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_DEVICE_PATH)

BOARD_HAL_STATIC_LIBRARIES ?= libhealthd.$(TARGET_PRODUCT)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE ?= 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE ?= 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE ?= 134217728
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE ?= ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE ?= 1073741824
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE ?= ext4
BOARD_FLASH_BLOCK_SIZE ?= 131072

TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT), user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT ?= true
      WITH_DEXPREOPT_PIC := true
    endif
  endif
endif

ART_USE_HSPACE_COMPACT ?= true

TARGET_USES_LOGD ?= true

# Seccomp filters
BOARD_SECCOMP_POLICY ?= $(COMMON_DEVICE_PATH)/seccomp

# Recovery
TARGET_NO_RECOVERY ?= false
TARGET_ROCHCHIP_RECOVERY ?= true

# to flip screen in recovery
BOARD_HAS_FLIPPED_SCREEN ?= false

# Auto update package from USB
RECOVERY_AUTO_USB_UPDATE ?= false

# To use bmp as kernel logo, uncomment the line below to use bgra 8888 in recovery
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_ROCKCHIP_PCBATEST ?= false
TARGET_USERIMAGES_USE_EXT4 ?= true
TARGET_USERIMAGES_USE_F2FS ?= false
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE ?= ext4
RECOVERY_UPDATEIMG_RSA_CHECK ?= false

RECOVERY_BOARD_ID ?= false
# RECOVERY_BOARD_ID ?= true

# for widevine drm
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# for tablet encryption
BUILD_WITH_CRYPTO := false

# Audio
BOARD_USES_GENERIC_AUDIO ?= true

# Wifi&Bluetooth
BOARD_HAVE_BLUETOOTH ?= true

include $(COMMON_DEVICE_PATH)/wifi_bt_common.mk

# Sensors
BOARD_SENSOR_ST ?= true

BOARD_BP_AUTO ?= true

# phone pad codec list
BOARD_CODEC_WM8994 ?= false
BOARD_CODEC_RT5625_SPK_FROM_SPKOUT ?= false
BOARD_CODEC_RT5625_SPK_FROM_HPOUT ?= false
BOARD_CODEC_RT3261 ?= false
BOARD_CODEC_RT3224 ?= true
BOARD_CODEC_RT5631 ?= false
BOARD_CODEC_RK616 ?= false

# Vold configrations
# if set to true m-user would be disabled and UMS enabled, if set to disable
# UMS would be disabled and m-user enabled
BUILD_WITH_UMS ?= true
# if set to true BUILD_WITH_UMS must be false.
BUILD_WITH_CDROM ?= false
BUILD_WITH_CDROM_PATH ?= /system/etc/cd.iso
# multi usb partitions
BUILD_WITH_MULTI_USB_PARTITIONS ?= false

# GPS
BOARD_HAS_GPS ?= false

# Ethernet
BOARD_HAS_ETHERNET ?= true

# manifest
SYSTEM_WITH_MANIFEST ?= true

# Battery
BOARD_HAS_BATTERY ?= true

BOARD_CHARGER_ENABLE_SUSPEND ?= true
CHARGER_ENABLE_SUSPEND ?= true
CHARGER_DISABLE_INIT_BLANK ?= true
BOARD_CHARGER_DISABLE_INIT_BLANK ?= true

#remotecontrol by phone apk
BOARD_HAS_REMOTECONTROL ?= false

#Board use IOMMU
BOARD_WITH_IOMMU ?= true

#boot optimization
BOARD_WITH_BOOT_BOOST ?= false

# PPPoE
BOARD_USE_PPPOE ?= true
