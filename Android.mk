LOCAL_PATH := $(call my-dir)

ifneq ($(filter rockchip,$(BOARD_VENDOR)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
