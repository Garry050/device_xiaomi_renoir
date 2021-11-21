#
# Copyright (C) 2021 The Havoc-OS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from renoir device
$(call inherit-product, device/xiaomi/renoir/device.mk)

# Inherit some common Havoc-OS stuff.
$(call inherit-product, vendor/havoc/config/common_full_phone.mk)

# Setup Gapps options
IS_PHONE := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := false

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := renoir
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Mi 11 Lite 5G
PRODUCT_NAME := dot_renoir

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
WITH_GAPPS := true