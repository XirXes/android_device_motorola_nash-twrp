#
# Copyright (C) 2017 The Linux Foundation
# Copyright (C) 2017 The halogenOS Project
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

TARGET_OTA_ASSERT_DEVICE := Z2Force,nash,z2force,xt1789,XT1789

PLATFORM_PATH := device/motorola/nash

BOARD_VENDOR := motorola
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msm8998
TARGET_BOOTLOADER_BOARD_NAME := MSM8998
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Toolchain
# Add this to local manifest:
#   <remote name="bitbucket"
#           fetch="https://bitbucket.org/" />
#   <project name="xanaxdroid/aarch64-6.3" path="prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-6.3.1-kernel-linaro" remote="bitbucket" revision="linaro" />
# TARGET_GCC_VERSION_ARM64 := 6.3.1-kernel-linaro

# TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-
# TARGET_CROSS_COMPILE_PREFIX := aarch64-linux-android-
# KERNEL_TOOLCHAIN := $(realpath $(TOP))/prebuilts/gcc/$(strip $(HOST_OS))-x86/aarch64/$(TARGET_CROSS_COMPILE_PREFIX)$(TARGET_GCC_VERSION_ARM64)/bin

# Kernel
BOARD_KERNEL_CMDLINE := \
        androidboot.hardware=qcom \
        ehci-hcd.park=3 \
        sched_enable_hmp=1 \
        sched_enable_power_aware=1 \
        service_locator.enable=1 \
        swiotlb=2048 \
        androidboot.configfs=true \
        androidboot.usbcontroller=a800000.dwc3 \
        androidboot.selinux=permissive \
        lpm_levels.sleep_disabled=1

BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_PREBUILT_KERNEL := device/motorola/nash/kernel
TARGET_KERNEL_CONFIG := nash_defconfig
TARGET_FRESHLY_COMPILED_DTBTOOL := true
TARGET_KERNEL_BUILD_VARIANT := user
TARGET_KERNEL_APPEND_DTB := true
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_VERSION := 4.4

# Images
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_FRP_PARTITION_NAME := frp
PRODUCT_SUPPORTS_VERITY := true
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/bootdevice/by-name/system

# Graphics
USE_OPENGL_RENDERER := true
HWUI_COMPILE_FOR_PERF := true

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API := true
TARGET_USES_QCOM_BSP := true
TARGET_USES_COLOR_METADATA := true

BOARD_EGL_CFG := $(PLATFORM_PATH)/egl.cfg

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096

VSYNC_EVENT_PHASE_OFFSET_NS := 0
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 0

TARGET_BOARD_PLATFORM_GPU := qcom-adreno540
HAVE_ADRENO_SOURCE := false
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# List of AAPT configurations
PRODUCT_AAPT_CONFIG += xlarge large

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_INIT_COLDBOOT_TIMEOUT := 8

# HW encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# TWRP
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_CUSTOM_POWER_BUTTON := 116
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_SCREEN_WIDTH := 1440
TARGET_SCREEN_HEIGHT := 2560
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_CRYPTO := true
TW_IGNORE_MISC_WIPE_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_BRIGHTNESS := 240
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
AB_OTA_UPDATER := true

ifneq ($(TARGET_INCLUDED_DEVICE_MK),true)
include $(PLATFORM_PATH)/device.mk
endif

# Extras
BOARD_SUPPRESS_SECURE_ERASE := true
