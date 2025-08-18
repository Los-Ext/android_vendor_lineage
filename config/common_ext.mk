# Blurs
TARGET_ENABLE_BLUR ?= false
ifeq ($(TARGET_ENABLE_BLUR),true)
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=true
else
PRODUCT_SYSTEM_PROPERTIES += \
    ro.custom.blur.enable=false
endif

PRODUCT_SYSTEM_PROPERTIES += ro.surface_flinger.supports_background_blur?=1

# Boost surfaceflinger min uclamp utilization
PRODUCT_SYSTEM_PROPERTIES += \
    ro.surface_flinger.uclamp.min?=165

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-crdroid-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-crdroid-product.xml

# Default wifi country code
PRODUCT_SYSTEM_PROPERTIES += \
    ro.boot.wificountrycode?=00

# Disable default frame rate limit for games
PRODUCT_PRODUCT_PROPERTIES += \
    debug.graphics.game_default_frame_rate.disabled=true

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

# DeviceAsWebcam
ifeq ($(TARGET_BUILD_DEVICE_AS_WEBCAM), true)
    PRODUCT_PACKAGES += \
        DeviceAsWebcam

    PRODUCT_VENDOR_PROPERTIES += \
        ro.usb.uvc.enabled=true
endif

# Face Unlock
ifneq ($(TARGET_FACE_UNLOCK_SUPPORTED),false)
PRODUCT_PACKAGES += \
    FaceUnlock

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.hardware.biometrics.face.xml
endif

# GameSpace
PRODUCT_PACKAGES += \
    GameSpace

# GApps
ifeq ($(WITH_GMS),true)
# Don't dexpreopt prebuilts
DONT_DEXPREOPT_PREBUILTS := true
$(call inherit-product-if-exists, vendor/google/gms/config.mk)
$(call inherit-product-if-exists, vendor/google/pixel/config.mk)
else
PRODUCT_PACKAGES += \
    ExactCalculator \
    Jelly \
    Etar \
    LineageSetupWizard
endif

# LMODroid Apps
PRODUCT_PACKAGES += \
    LMOFreeform \
    LMOFreeformSidebar

# Memtag
PRODUCT_PRODUCT_PROPERTIES += \
    arm64.memtag.process.system_server=off \
    persist.arm64.memtag.app.com.android.se=off \
    persist.arm64.memtag.app.com.android.bluetooth=off \
    persist.arm64.memtag.app.com.google.android.bluetooth=off \
    persist.arm64.memtag.app.com.android.nfc=off \
    persist.arm64.memtag.system_server=off

# Music player
PRODUCT_PACKAGES += \
    Accord

# Omni
PRODUCT_PACKAGES += \
    OmniJaws
