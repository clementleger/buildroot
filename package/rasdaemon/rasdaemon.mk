################################################################################
#
# rasdaemon
#
################################################################################

RASDAEMON_VERSION = 0.8.2
RASDAEMON_SITE = $(call github,mchehab,rasdaemon,v$(RASDAEMON_VERSION))
RASDAEMON_LICENSE = GPL-2.0+
RASDAEMON_LICENSE_FILES = COPYING
RASDAEMON_AUTORECONF = YES
RASDAEMON_DEPENDENCIES += sqlite libtraceevent

ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
RASDAEMON_ARCH_SUPPORT = --enable-arm
else ifeq ($(BR2_riscv),y)
RASDAEMON_ARCH_SUPPORT = --enable-riscv
endif

RASDAEMON_CONF_OPTS += --enable-memory-failure \
			--enable-aer \
			--enable-cxl \
			--enable-abrt-report \
			--enable-devlink \
			--enable-non-standard \
			--enable-cpu-fault-isolation \
			$(RASDAEMON_ARCH_SUPPORT) \
			--enable-sqlite3

$(eval $(autotools-package))
