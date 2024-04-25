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
