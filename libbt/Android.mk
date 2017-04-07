LOCAL_PATH := $(call my-dir)

ifeq ($(strip $(BOARD_HAVE_BLUETOOTH_BCM_RK)),true)

include $(CLEAR_VARS)

ifneq ($(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR),)
  bdroid_C_INCLUDES := $(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR)
  bdroid_CFLAGS += -DHAS_BDROID_BUILDCFG
else
  bdroid_C_INCLUDES :=
  bdroid_CFLAGS += -DHAS_NO_BDROID_BUILDCFG
endif

BDROID_DIR := $(TOP_DIR)system/bt

ifeq ($(strip $(USE_BLUETOOTH_BCM4343)),true)
LOCAL_CFLAGS += -DUSE_BLUETOOTH_BCM4343
endif

ifeq ($(BOARD_HAVE_BCM_FM), true)
LOCAL_CFLAGS += -DBLUEDROID_ENABLE_V4L2
endif

LOCAL_SRC_FILES := \
        src/bt_vendor_brcm.c \
        src/bt_vendor_brcm_a2dp.c \
        src/hardware.c \
        src/userial_vendor.c \
        src/upio.c \
        src/conf.c

LOCAL_C_INCLUDES += \
        $(LOCAL_PATH)/include \
        $(BDROID_DIR)/hci/include \
        $(BDROID_DIR)/include \
        $(BDROID_DIR)/stack/include \
        $(BDROID_DIR)/gki/ulinux

LOCAL_C_INCLUDES += $(bdroid_C_INCLUDES)
LOCAL_CFLAGS += $(bdroid_CFLAGS)

LOCAL_SHARED_LIBRARIES := \
        libcutils \
        liblog

LOCAL_MODULE := libbt-vendor
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_OWNER := broadcom
LOCAL_PROPRIETARY_MODULE := true

ifeq ($(BOARD_HAVE_SAMSUNG_BLUETOOTH),true)
    LOCAL_CFLAGS += -DSAMSUNG_BLUETOOTH
    LOCAL_C_INCLUDES += hardware/samsung/macloader/include
endif

ifeq ($(BCM_BLUETOOTH_MANTA_BUG), true)
    LOCAL_CFLAGS += -DMANTA_BUG
endif

LOCAL_CFLAGS += -DBT_ROCKCHIP
LOCAL_SRC_FILES += src/rockchip.c

include $(LOCAL_PATH)/vnd_buildcfg.mk

include $(BUILD_SHARED_LIBRARY)

include $(LOCAL_PATH)/conf/Android.mk

endif # BOARD_HAVE_BLUETOOTH_BCM
