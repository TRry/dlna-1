LOCAL_PATH := $(call my-dir)

PLT_ROOT := $(LOCAL_PATH)/../../../../../..
PLT_SRC_ROOT := $(PLT_ROOT)/Source

ifeq ($(NDK_DEBUG),1)
PLT_PREBUILT_PATH := ../../../../../../Build/Targets/arm-android-linux/Debug
else
PLT_PREBUILT_PATH := ../../../../../../Build/Targets/arm-android-linux/Release
endif

include $(CLEAR_VARS)
LOCAL_MODULE := Platinum
LOCAL_SRC_FILES := $(PLT_PREBUILT_PATH)/libPlatinum.a
LOCAL_EXPORT_C_INCLUDES += $(PLT_SRC_ROOT)/Platinum
LOCAL_EXPORT_C_INCLUDES += $(PLT_SRC_ROOT)/Core
LOCAL_EXPORT_C_INCLUDES += $(PLT_SRC_ROOT)/Devices/MediaConnect
LOCAL_EXPORT_C_INCLUDES += $(PLT_SRC_ROOT)/Devices/MediaServer
LOCAL_EXPORT_C_INCLUDES += $(PLT_SRC_ROOT)/Devices/MediaRenderer
LOCAL_EXPORT_C_INCLUDES += $(PLT_SRC_ROOT)/Extras
LOCAL_C_INCLUDES += $(PLT_ROOT)/../Neptune/Source/Core
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Neptune
LOCAL_SRC_FILES := $(PLT_PREBUILT_PATH)/libNeptune.a
LOCAL_EXPORT_C_INCLUDES += $(PLT_ROOT)/../Neptune/Source/Core
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := axTLS
LOCAL_SRC_FILES := $(PLT_PREBUILT_PATH)/libaxTLS.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := MediaRender
LOCAL_SRC_FILES := $(PLT_PREBUILT_PATH)/libPltMediaRenderer.a
include $(PREBUILT_STATIC_LIBRARY)


#LOCAL_MODULE := MediaServer
#LOCAL_SRC_FILES := $(PLT_PREBUILT_PATH)/libPltMediaServer.a
#include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE     := sinadlna_jni
LOCAL_SRC_FILES  := PltMicroMediaController.cpp \
					sinadlna_notify.cpp \
					sinadlna.cpp	\
					sinadlna_jni.cpp 
					
LOCAL_LDLIBS     += -llog
LOCAL_LDLIBS     += -landroid

LOCAL_CFLAGS += -DNPT_CONFIG_ENABLE_LOGGING

LOCAL_STATIC_LIBRARIES := Platinum

#LOCAL_STATIC_LIBRARIES := axTLS
#LOCAL_STATIC_LIBRARIES += Neptune
#LOCAL_STATIC_LIBRARIES += Platinum
#LOCAL_STATIC_LIBRARIES += MediaServer
#LOCAL_STATIC_LIBRARIES += MediaRender

LOCAL_STATIC_LIBRARIES := \
	MediaRender \
	Platinum \
	Neptune \
	axTLS

#LOCAL_STATIC_LIBRARIES := \
#        MediaRender \
#        MediaServer \
#        Platinum \
#        Neptune \
#        axTLS


include $(BUILD_SHARED_LIBRARY)
