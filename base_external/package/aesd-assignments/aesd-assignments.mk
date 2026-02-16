################################################################################
#
# aesd-assignments
#
################################################################################

AESD_ASSIGNMENTS_VERSION = cf65db5
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-pranavshastry16.git
AESD_ASSIGNMENTS_SITE_METHOD = git

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/server CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket

	$(INSTALL) -d $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef


$(eval $(generic-package))
