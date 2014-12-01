##############################################
## OpenWrt Makefile for Bell Script package ##
##############################################
include $(TOPDIR)/rules.mk

PKG_NAME := bell
PKG_VERSION := 0.1.0
PKG_RELEASE := 1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/bell
	SECTION:=mods
	CATEGORY:=Bell
	TITLE:=Bell
endef

define Package/bell/description
	This is a networked doorbell system
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/bell/install
	 $(INSTALL_DIR) $(1)/usr/bin/
	 $(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/bell $(1)/usr/bin/
	 $(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/ncat $(1)/usr/bin/
	 $(INSTALL_DIR) $(1)/etc/init.d
	 $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/bellinit $(1)/etc/init.d/bellinit
	 $(INSTALL_DIR) $(1)/etc/config/
	 $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/network $(1)/etc/config/
	 $(INSTALL_DIR) $(1)/etc/rc.button/
	 $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/rc.button/reset $(1)/etc/rc.button/
	 $(INSTALL_DIR) $(1)/etc/
	 $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/banner $(1)/etc/
endef

define Package/bell/postinst
#!/bin/sh
$${IPKG_INSTROOT}/etc/init.d/bellinit enable
rm /etc/init.d/bell
exit 0
endef

$(eval $(call BuildPackage,bell))