LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),samsung)
ifneq ($(filter corsica nevisp, $(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
