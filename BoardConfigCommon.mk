USE_CAMERA_STUB := true

COMMON_PATH := device/samsung/rhea-common

# legacy MMAP 
BOARD_USES_LEGACY_MMAP := true

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := rhea
TARGET_BOARD_PLATFORM := rhea
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_NEON := true
TARGET_ARCH_LOWMEM := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_SAMSUNG_DUAL_SIM := true
# Audio-CFLAGS
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB -DRHEA_HWC -DBOARD_CANT_REALLOCATE_OMX_BUFFERS

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := $(COMMON_PATH)/bluetooth/libbt_vndcfg.txt

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
  ifeq ($(WITH_DEXPREOPT),)
WITH_DEXPREOPT := true
  endif
 endif
endif
DONT_DEXPREOPT_PREBUILTS := true

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Properties (reset them here, include more in device if needed)
TARGET_SYSTEM_PROP := device/samsung/rhea-common/system.prop

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Non pie binary support
TARGET_ENABLE_NON_PIE_SUPPORT := true

# Power
TARGET_POWERHAL_VARIANT := rhea
TARGET_USES_CPU_BOOST_HINT := true

# Kernel
TARGET_NO_KERNEL := false
TARGET_KERNEL_SOURCE := kernel/samsung/rhea
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7/bin
BOARD_KERNEL_BASE := 0x82000000
BOARD_KERNEL_PAGESIZE := 4096

# Partitions
# This is actually 1002438656, but reducing to 0 MB to support users using repartition.
# Feel free to increase when needed
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1002438656
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00800000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00800000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2236070912
BOARD_FLASH_BLOCK_SIZE := 131072

#File System
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# Connectivity - Wi-Fi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI     := true
BOARD_LEGACY_NL80211_STA_EVENTS := true
BOARD_NO_APSME_ATTR         := true

# GPS
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Hardware rendering
HWUI_COMPILE_FOR_PERF := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_NEEDS_FNW := true
BOARD_USES_LEGACY_ACQUIRE_WVM := true
OVERRIDE_RS_DRIVER := libRSDriverArm_rhea.so
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS -DREFBASE_JB_MR1_COMPAT_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB -DEGL_NEEDS_FNW

# OpenGL
USE_OPENGL_RENDERER := true
BOARD_USE_BGRA_8888 := true

# H/W acceleration 
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/rhea-common/ril/
BOARD_NEEDS_SEC_RIL_WORKAROUND := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_7x16.h>"
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/rhea-common/recovery/recovery_keys.c
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 18
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
TARGET_USE_CUSTOM_SECOND_LUN_NUM := 1

# MTP
BOARD_MTP_DEVICE := /dev/mtp_usb

# dumpstate
BOARD_HAL_STATIC_LIBRARIES := libdumpstate.rhea

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.rhea

# CMHW
BOARD_HARDWARE_CLASS := hardware/samsung/cmhw/ $(COMMON_PATH)/cmhw/

# ART
# jemalloc causes a lot of random crash on free()
MALLOC_IMPL := dlmalloc

# SELinux
BOARD_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy
