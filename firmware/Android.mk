#
# Copyright (C) 2009-2011 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

LOCAL_FIRMWARES_DIR ?= $(call my-dir)
LOCAL_PATH := $(LOCAL_FIRMWARES_DIR)
LOCAL_FIRMWARES ?= $(filter-out %.mk,$(subst $(LOCAL_PATH)/,,$(shell find $(LOCAL_PATH) -type f)))

define include-firmware
LOCAL_PATH := $(1)
include $$(CLEAR_VARS)
LOCAL_MODULE := $(2)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $$(TARGET_OUT_ETC)/firmware
LOCAL_SRC_FILES := $(2)
include $$(BUILD_PREBUILT)

ALL_DEFAULT_INSTALLED_MODULES += $$(LOCAL_INSTALLED_MODULE)
endef

$(foreach f,$(LOCAL_FIRMWARES),$(eval $(call include-firmware,$(LOCAL_PATH),$(f))))
