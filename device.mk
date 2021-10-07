# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2019 The OmniRom Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# fusefs / disable sdcardfs usage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/dtb:dtb.img

# Api
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 30

# Audio
TARGET_EXCLUDES_AUDIOFX := true

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    libaacwrapper

# Bluetooth
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/packages/apps/Bluetooth
PRODUCT_SOONG_NAMESPACES += vendor/qcom/opensource/commonsys/system/bt/conf

PRODUCT_PACKAGE_OVERLAYS += vendor/qcom/opensource/commonsys-intf/bluetooth/overlay/qva

PRODUCT_PACKAGES += BluetoothExt
PRODUCT_PACKAGES += libbluetooth_qti
PRODUCT_PACKAGES += vendor.qti.hardware.bluetooth_dun-V1.0-java

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl-qti.recovery \
    bootctrl.lahaina.recovery

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Display
PRODUCT_PACKAGES += \
    libion \
    libtinyxml2

PRODUCT_PACKAGES += \
    libtinyalsa

# DRM
PRODUCT_PACKAGES += \
    libdrm

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# NFC

TARGET_USES_NQ_NFC := true

PRODUCT_SOONG_NAMESPACES += \
    vendor/nxp/opensource/sn100x \
    vendor/nxp/opensource/packages/apps/Nfc

PRODUCT_PACKAGES += \
   NQNfcNci \
   libnqnfc-nci \
   libnqnfc_nci_jni \
   libsn100nfc_nci_jni \
   libsn100nfc-nci \
   com.nxp.nfc.nq \
   com.nxp.nfc.nq.xml \
   com.android.nfc_extras \
   vendor.nxp.hardware.nfc@2.0-service \
   nfc_nci.nqx.default.hw \
   se_nq_extn_client \
   ls_nq_client \
   jcos_nq_client 

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

# Netutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0 \
    libandroid_net

PRODUCT_PACKAGES += \
    vndk_package

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom \
    $(LOCAL_PATH)/rootdir/etc/init.renoir.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/init.renoir.rc

# Soong namespaces
PRODUCT_BOARD_PLATFORM := lahaina
PRODUCT_USES_QCOM_HARDWARE := true
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Systemhelper
PRODUCT_PACKAGES += \
    vendor.qti.hardware.systemhelper@1.0

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    tcmiface

# Update engine
PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# Init
PRODUCT_PACKAGES += \
    init.renoir.rc

PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Wifi Display
PRODUCT_PACKAGES += \
    libavservices_minijail \
    libnl \

PRODUCT_PRODUCT_PROPERTIES += \
    ro.control_privapp_permissions=log

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.renoir

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-dot

# VINTF
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vintf/android.hardware.lights-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/android.hardware.lights-qti.xml

-include $(LOCAL_PATH)/product_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

include vendor/xiaomi/renoir/renoir-vendor.mk
