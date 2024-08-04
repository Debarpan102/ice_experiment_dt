#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm \

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := $(TARGET_CPU_VARIANT)
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := RE54BFL1,RMX3461

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lahaina
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Platform
TARGET_BOARD_PLATFORM := lahaina
TARGET_BOARD_PLATFORM_GPU := qcom-adreno642L
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true

# recovery as boot
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_RAMDISK_USE_LZ4 := true

# Kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x00000000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)

BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# Dtbo
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Partitions Sizes
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Partitions FileTypes
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

# includes make_ext4 to support userdata partition in ext4
TARGET_USERIMAGES_USE_EXT4 := true

# includes make_f2fs to support userdata partition in f2fs
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying product files to recovery ramdisk
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_PRODUCT := product

# Workaround for error copying system_ext files to recovery ramdisk
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

# Workaround for error copying odm files to recovery ramdisk
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_ODM := odm

# Workaround for error copying vendor files to recovery ramdis
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Workaround for error copying vendor_dlkm files to recovery ramdisk
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

# Partitions
BOARD_SUPER_PARTITION_SIZE := 10200547328
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor vendor_dlkm
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 10196353024 # BOARD_SUPER_PARTITION_SIZE - 4MB

# Enables proper handling of /data/media
RECOVERY_SDCARD_ON_DATA := true

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_HAS_LARGE_FILESYSTEM := true

# Add root folders
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist

# Metadata partition
BOARD_USES_METADATA_PARTITION := true

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem

# Enable chained vbmeta for system image mixing
BOARD_AVB_VBMETA_SYSTEM := product system system_ext
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Enable chained vbmeta for boot images
BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2

# Decryption support for /data
TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
TW_USE_FSCRYPT_POLICY := 2

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2127-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# haptic fix flags
# TW_SUPPORT_INPUT_AIDL_HAPTICS := true
# TW_SUPPORT_INPUT_AIDL_HAPTICS_FIX_OFF := true
TW_NO_HAPTICS := true

# Kernel module loading for touch, battery etc
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/prebuilt/modules)\")

# Add properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Fixes wrong theme color
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

# Fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# TWRP Configuration
TW_THEME := portrait_hdpi

# All language packs
TW_EXTRA_LANGUAGES := true

# Brightness flags
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 500
TW_DEFAULT_BRIGHTNESS := 150

# CPU temp sysfs path, if it is zero all the time
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone20/temp

# Battery 
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery/capacity 

# Calculate the system date and time
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Statusbar icons flags
TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := 170
TW_CUSTOM_CLOCK_POS := 460
TW_CUSTOM_BATTERY_POS := 790

# Use mke2fs for formatting ext4 partitions
TARGET_USES_MKE2FS := true

# For mounting NTFS
TW_INCLUDE_NTFS_3G := true

# For additional flags
TW_HAS_NO_RECOVERY_PARTITION := true
TW_HAS_DOWNLOAD_MODE := true
TW_FRAMERATE := 60

# Blacklist certain input devices that might break touch in TWRP
TW_INPUT_BLACKLIST := hbtp_vm

# Add support of able to wake with touch after sleep
TW_NO_SCREEN_BLANK := true

# Logical partitions
TW_INCLUDE_LOGICAL := my_reserve my_custom my_carrier my_region my_company my_engineering my_product my_version my_preload my_heytap my_stock my_manifest my_bigball

# EDL Mode (qcom)
TW_HAS_EDL_MODE := true

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# Python binary
TW_INCLUDE_PYTHON := true

# Skip compatibility packages
TW_SKIP_COMPATIBILITY_CHECK := true

# Include resetprop binary from the Magisk tools kit to the assembly
TW_INCLUDE_RESETPROP := true

# Include libresetprop binaries
TW_INCLUDE_LIBRESETPROP := true

# Include magiskboot for repacking bootimg
# TW_INCLUDE_REPACKTOOLS := true

# Don't mount apex files (no need for now)
TW_EXCLUDE_APEX := true

# Use our own USB config
TW_EXCLUDE_DEFAULT_USB_INIT := true

# MISC FLAGS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file

# Debug-tools
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace

# Log touch input
# TWRP_EVENT_LOGGING := true
