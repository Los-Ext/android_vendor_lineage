PRODUCT_VERSION_MAJOR = 24
PRODUCT_VERSION_MINOR = 0
LINEAGE_BUILDTYPE ?= Community

ifeq ($(WITH_GMS),true)
LINEAGE-EXT_VARIANT ?= Gapps
else
LINEAGE-EXT_VARIANT ?= Vanilla
endif

LINEAGE_VERSION_SUFFIX := Ext-$(LINEAGE_BUILDTYPE)-$(LINEAGE_BUILD)-$(LINEAGE-EXT_VARIANT)-$(shell date +%Y%m%d-%H%M)

# Internal version
LINEAGE_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_VERSION_SUFFIX)

# Display version
LINEAGE_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(LINEAGE_VERSION_SUFFIX)

# LineageOS version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.lineage.version=$(LINEAGE_VERSION) \
    ro.lineage.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.lineage.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.lineage.releasetype=$(LINEAGE_BUILDTYPE)

# Axion
PERF_ANIM_OVERRIDE ?= false
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.activity_anim_perf_override=$(PERF_ANIM_OVERRIDE)

ifeq ($(PERF_ANIM_OVERRIDE),true)
PRODUCT_PRODUCT_PROPERTIES += \
    debug.sf.predict_hwc_composition_strategy=0
endif
