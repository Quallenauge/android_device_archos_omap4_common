#
# Copyright (C) 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(BOARD_VENDOR),archos)
ifeq ($(TARGET_BOARD_PLATFORM),omap4)

LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_SIMULATOR),true)

ifeq ($(BOARD_CREATE_ARCHOS_HDCP_KEYS_SYMLINK), true)

#Create HDCP symlink
HDCP_SYMLINK := $(TARGET_OUT_VENDOR)/firmware/hdcp.keys
$(HDCP_SYMLINK): HDCP_KEYS_FILE := /efs/hdcp/hdcp.kek.wrapped
$(HDCP_SYMLINK): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(HDCP_KEYS_FILE)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware
	@rm -rf $@
	$(hide) ln -fs $(HDCP_KEYS_FILE) $@

ALL_DEFAULT_INSTALLED_MODULES += $(HDCP_SYMLINK)

# for mm/mmm
all_modules: $(HDCP_SYMLINK)

endif

LOCAL_PATH := $(call my-dir)

#Creating Gralloc SymLink
GRALLOC_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/gralloc.$(TARGET_BOOTLOADER_BOARD_NAME).so
$(GRALLOC_SYMLINK): GRALLOC_FILE := gralloc.omap$(TARGET_BOARD_OMAP_CPU).so
$(GRALLOC_SYMLINK): $(LOCAL_INSTALLED_MODULE) $(LOCAL_PATH)/Android.mk
	@echo "Symlink: $@ -> $(GRALLOC_FILE)"
	@rm -rf $@
	$(hide) ln -fs $(GRALLOC_FILE) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GRALLOC_SYMLINK)

# for mm/mmm
all_modules: $(GRALLOC_SYMLINK)

include $(call first-makefiles-under,$(LOCAL_PATH))
endif

endif
endif

