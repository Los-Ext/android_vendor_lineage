# Blurs
PRODUCT_PRODUCT_PROPERTIES += \
    ro.launcher.blur.appLaunch=0

# Disable default frame rate limit for games
PRODUCT_PRODUCT_PROPERTIES += \
    debug.graphics.game_default_frame_rate.disabled=true

# Disable touch video heatmap to reduce latency, motion jitter, and CPU usage
# on supported devices with Deep Press input classifier HALs and models
PRODUCT_PRODUCT_PROPERTIES += \
    ro.input.video_enabled=false

# GApps
ifeq ($(WITH_GMS),true)
$(call inherit-product-if-exists, vendor/google/gms/config.mk)
$(call inherit-product-if-exists, vendor/google/pixel/config.mk)
else
PRODUCT_PACKAGES += \
    ExactCalculator \
    Jelly \
    Twelve \
    Etar \
    LineageSetupWizard
endif

# Memtag
PRODUCT_PRODUCT_PROPERTIES += \
    arm64.memtag.process.system_server=off \
    persist.arm64.memtag.app.com.android.se=off \
    persist.arm64.memtag.app.com.android.bluetooth=off \
    persist.arm64.memtag.app.com.google.android.bluetooth=off \
    persist.arm64.memtag.app.com.android.nfc=off \
    persist.arm64.memtag.system_server=off
