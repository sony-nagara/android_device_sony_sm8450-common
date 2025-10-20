
# Copyright (C) 2018 The LineageOS Project
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

BUILD_BROKEN_DUP_RULES := true

# TODO: disable when stable
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

BOARD_VENDOR := sony

COMMON_PATH := device/sony/sm8450-common

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    recovery \
    odm \
    vendor \
    vendor_boot \
    vendor_dlkm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# Boot
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
# TODO: partially added in commit with dtbo building
#   https://github.com/LineageOS/android_device_sony_sm8550-common/commit/c7c327186b7a0a654851053b0ca5122e9a85d23c

BOARD_USES_QCOM_MERGE_DTBS_SCRIPT := true
#TARGET_NEEDS_DTBOIMAGE := true

# TODO: limit dtbs inclusion
#   https://github.com/LineageOS/android_device_sony_sm8550-common/commit/c4c8891f4c3130a7bd2faaa7e7045b85cfce9c04
# not in sm8350
# TARGET_MERGE_DTBS_WILDCARD ?= taro*base

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := taro
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000

# removed: not in pdx223
# BOARD_KERNEL_CMDLINE += nosoftlockup
BOARD_BOOTCONFIG := \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=a600000.dwc3

BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_IMAGE_NAME := Image

TARGET_KERNEL_SOURCE := kernel/sony/sm8450
TARGET_KERNEL_CONFIG := \
    gki_defconfig \
    vendor/waipio_GKI.config \
    vendor/sony/nagara.config

BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load.vendor_dlkm))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load.vendor_boot))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(COMMON_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(strip $(shell cat $(COMMON_PATH)/modules.load.recovery $(COMMON_PATH)/modules.load.vendor_boot))

# Kernel Modules
TARGET_KERNEL_EXT_MODULE_ROOT := kernel/sony/sm8450-modules
TARGET_KERNEL_EXT_MODULES := \
    qcom/opensource/mmrm-driver \
    qcom/opensource/audio-kernel \
    qcom/opensource/camera-kernel \
    qcom/opensource/cvp-kernel \
    qcom/opensource/dataipa/drivers/platform/msm \
    qcom/opensource/datarmnet/core \
    qcom/opensource/datarmnet-ext/aps \
    qcom/opensource/datarmnet-ext/offload \
    qcom/opensource/datarmnet-ext/shs \
    qcom/opensource/datarmnet-ext/perf \
    qcom/opensource/datarmnet-ext/perf_tether \
    qcom/opensource/datarmnet-ext/sch \
    qcom/opensource/datarmnet-ext/wlan \
    qcom/opensource/display-drivers/msm \
    qcom/opensource/eva-kernel \
    qcom/opensource/video-driver \
    qcom/opensource/wlan/qcacld-3.0/.qca6490 \
    cirrus/kernel-modules/cs35l41/sound/soc/codecs \
    cirrus/kernel-modules/cs40l25/drivers/misc \
    cirrus/kernel-modules/cs40l25/sound/soc/codecs \
    semc/hardware/camera-kernel-module/camera_sync \
    semc/hardware/camera-kernel-module/sony_camera \
    semc/hardware/camera-kernel-module/tcs3490 \
    semc/hardware/camera-kernel-module/slg51000_regulator \
    semc/hardware/charge/kernel-modules/battman_dbg \
    semc/hardware/charge/kernel-modules/battchg_ext \
    semc/hardware/kernel-modules/misc/bu520x1nvx \
    semc/hardware/kernel-modules/misc/et6xx \
    semc/hardware/kernel-modules/misc/last_logs \
    semc/hardware/kernel-modules/misc/ldo_vibrator \
    semc/hardware/kernel-modules/misc/powerkey_forcecrash \
    semc/hardware/kernel-modules/msm/sec_ts \
    semc/hardware/nfc/drivers/sn1x0_i2c \
    semc/hardware/nfc/drivers/sn1x0_spi

# Platform
TARGET_BOARD_PLATFORM := taro

# Qcom
BOARD_USES_QCOM_HARDWARE := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# Audio
AUDIO_FEATURE_ENABLED_DLKM := true
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_LSM_HIDL := true
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_SUPPORTS_SOUND_TRIGGER := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
TARGET_PROVIDES_AUDIO_HAL := true
TARGET_PROVIDES_AUDIO_AGM := true

# Display
TARGET_NO_RAW10_CUSTOM_FORMAT := true
TARGET_GRALLOC_HANDLE_HAS_RESERVED_SIZE := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_EGL_DISPLAY_ARRAY := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_HAS_HDR_DISPLAY := true
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_DRM_PP := true
TARGET_USES_GRALLOC4 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/battchg_ext/smart_charging_interruption
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED := 0
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED := 1

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
    $(COMMON_PATH)/framework_compatibility_matrix.xml \
    hardware/qcom-caf/common/vendor_framework_compatibility_matrix.xml \
    vendor/lineage/config/device_framework_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE += $(COMMON_PATH)/framework_manifest.xml
DEVICE_MATRIX_FILE := hardware/qcom-caf/common/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := \
    $(COMMON_PATH)/manifest.xml \
    $(COMMON_PATH)/network_manifest.xml

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_PRODUCTIMAGE_MINIMAL_PARTITION_RESERVED_SIZE := false
-include vendor/lineage/config/BoardConfigReservedSize.mk
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x6000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
# userdata defined for each device separately as it is different for
# pdx223 and pdx224
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SOMC_DYNAMIC_PARTITIONS_PARTITION_LIST := product system vendor odm system_ext vendor_dlkm
# Dynamic partition size = Super partition size - 4MB
# looks to have the same size in nagara
BOARD_SOMC_DYNAMIC_PARTITIONS_SIZE := 14491320320
BOARD_SUPER_PARTITION_GROUPS := somc_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 14495514624
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Power
TARGET_POWERHAL_MODE_EXT := $(COMMON_PATH)/power/power-mode.cpp

# PowerShare
SOONG_CONFIG_NAMESPACES += SONY_POWERSHARE
SOONG_CONFIG_SONY_POWERSHARE := WIRELESS_TX_ENABLE_PATH
SOONG_CONFIG_SONY_POWERSHARE_WIRELESS_TX_ENABLE_PATH := /sys/class/qcom-battery/wireless_boost_en

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop
TARGET_SYSTEM_EXT_PROP += $(COMMON_PATH)/system_ext.prop

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
BOOT_SECURITY_PATCH := 2024-07-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
include hardware/sony/sepolicy/qti/SEPolicy.mk
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_VBMETA_SYSTEM := system system_ext product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
CONFIG_IEEE80211AX := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Include vendor BoardConfig
include vendor/sony/sm8450-common/BoardConfigVendor.mk
