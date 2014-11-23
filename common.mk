# Copyright (C) 2013 The CyanogenMod Project
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

# This file includes all definitions that apply to ALL Amazon Kindle Fire devices, and
# are also specific to otter devices
#
# Everything in this directory will become public

COMMON_FOLDER := device/archos/omap4-common

# set to allow building from omap4-common
BOARD_VENDOR := archos

# Setup custom omap4xxx defines
BOARD_USE_CUSTOM_LIBION := true

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# DRM
PRODUCT_PACKAGES += \
    libwvm \

# Misc / Testing
PRODUCT_PACKAGES += \
    evtest \
    strace \
    libjni_pinyinime \
    sh \

# Extra apps (not always included by AOSP)
PRODUCT_PACKAGES += \
    Email \

#symlinks
PRODUCT_PACKAGES += \
    libion.so

# Needed for gfx drivers
PRODUCT_PACKAGES += \
    libcorkscrew

# TI OMAP4
PRODUCT_PACKAGES += \
    libdomx \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.H264E \
    libOMX.TI.DUCATI1.VIDEO.H264SVCE \
    libOMX.TI.DUCATI1.VIDEO.VC1E \
    libOMX.TI.DUCATI1.VIDEO.MPEG4E \
    libOMX.TI.DUCATI1.VIDEO.DECODER \
    libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
    libOMX.TI.DUCATI1.VIDEO.CAMERA \
    libOMX.TI.DUCATI1.MISC.SAMPLE \
    libstagefrighthw \
    libI420colorconvert \
    libtiutils_custom \
    libion_ti \
    smc_pa_ctrl \
    tf_daemon \
    libtf_crypto_sst
