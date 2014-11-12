{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww19000\viewh10780\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 ##############################################\
# OpenWrt Makefile for Bell Script package\
##############################################\
include $(TOPDIR)/rules.mk\
\
PKG_NAME := bellscript\
PKG_VERSION := 0.1.0\
PKG_RELEASE := 1\
\
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)\
\
include $(INCLUDE_DIR)/package.mk\
\
define Package/bellscript\
	SECTION:=utils\
	CATEGORY:=Utilities\
	TITLE:=Bell Script\
endef\
\
define Build/Prepare\
	mkdir -p $(PKG_BUILD_DIR)\
	$(CP) ./src/* $(PKG_BUILD_DIR)/\
endef\
\
define Package/bellscript/install\
	$(INSTALL_DIR) $(1)/usr/bin/\
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/usr/bin/bell $(1)/usr/bin/\
	$(INSTALL_DIR) $(1)/etc/init.d\
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/init.d/bell $(1)/etc/init.d/bell  # copy directly to init dir (required for post-inst enabling)\
	$(INSTALL_DIR) $(1)/etc/config/\
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/firewall $(1)/etc/config/\
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/network $(1)/etc/config/\
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/config/wireless $(1)/etc/config/\
	$(INSTALL_DIR) $(1)/etc/rc.button/\
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/etc/rc.button/reset $(1)/etc/rc.button/\
endef\
\
define Package/webcamstreamer/postinst\
	$$\{IPKG_INSTROOT\}/usr/bin/bell install\
endef\
\
$(eval $(call BuildPackage,bellscript))\
}