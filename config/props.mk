PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_mainline_BRAND?=google \
    persist.sys.pihooks_mainline_MANUFACTURER?=Google \
    persist.sys.pihooks_mainline_DEVICE?=caiman \
    persist.sys.pihooks_mainline_PRODUCT?=caiman

PRODUCT_BUILD_PROP_OVERRIDES += \
    PIHOOKS_BUILD_FINGERPRINT="google/caiman/caiman:14/AD1A.240530.047.U1/12150698:user/release-keys" \
    PIHOOKS_MODEL_SPOOF="Pixel 9 Pro"
