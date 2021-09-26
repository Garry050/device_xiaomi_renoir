LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.renoir.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := init.renoir.rc
LOCAL_MODULE_PATH  := $(TARGET_OUT_SYSTEM)/etc/init
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE       := init.zram.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := bin/init.zram.sh
LOCAL_MODULE_PATH  := $(TARGET_OUT_SYSTEM)/bin
include $(BUILD_PREBUILT)