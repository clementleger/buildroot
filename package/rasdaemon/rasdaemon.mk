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

RASDAEMON_CONF_OPTS += --enable-memory-failure \
			--enable-aer \
			--enable-cxl \
			--enable-sqlite3

$(eval $(autotools-package))
