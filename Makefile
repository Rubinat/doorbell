##############################################
# OpenWrt Makefile for Bell Script package
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

define Package/bell/config
	#source "$(SOURCE)/Config.in"
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	# $(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
#	no configuration necessary
endef

define Build/Compile directives
#	no compilation necessary (although possible with luac?)
endef

define Package/bell/install
	# $(INSTALL_DIR) $(1)/usr/bin/
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/bell $(1)/usr/bin/
	# $(INSTALL_DIR) $(1)/etc/init.d
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/bell $(1)/etc/init.d/bell  # copy directly to init dir (required for post-inst enabling)
	# $(INSTALL_DIR) $(1)/etc/config/
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/firewall $(1)/etc/config/
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/network $(1)/etc/config/
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/wireless $(1)/etc/config/
	# $(INSTALL_DIR) $(1)/etc/rc.button/
	# $(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/rc.button/reset $(1)/etc/rc.button/
endef

define Package/bell/postinst
# 	$${IPKG_INSTROOT}/usr/bin/bell install
endef

$(eval $(call BuildPackage,bell))
