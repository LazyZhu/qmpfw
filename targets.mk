# targets.mk
# Copyright (C) 2011-2013 qmp.cat
#
# This is free software, licensed under the GNU General Public License v3. 
# See LICENSE for more information.
# 
#
# For each target the next variables must be defined
#  NAME := The name of the device used for output firmware file name
#  ARCH := The OpenWRT architecture
#  IMAGE := The file path (relative to buildroot) to the firmware

# Optional
#  TBUILD := The buildroot directory (relative to BUILD_DIR)
#  TARGET_MASTER := If defined the config files will be taken from the master target
#  SYSUPGRADE := The file path (relative to buildroot) to the firmware sysupgrade image
#
# Any option defined in Makefile can be overrided from here, for instance
#  override OWRT_SVN = svn://mysvn.com/owrt

HW_AVAILABLE := ar71xx alix bullet freestation nsm2 nsm5 pico2 rocket rs rspro tl-2543 tl-703n tl-841 tl-842 tl-mr3020 tl-mr3040 tl-mr3040-cam tl-wdr3600 tl-wdr4300 vbox vmware wpe72
TBUILD_LIST := x86 ar71xx ramips atheros

ifeq ($(T),ar71xx)
  NAME:=ar71xx
  ARCH:=ar71xx
  TBUILD:=ar71xx
endif

ifeq ($(T),alix)
  NAME:=Alix
  ARCH:=x86
  TBUILD:=x86
  IMAGE:=bin/$(ARCH)/openwrt-x86-alix2-combined-squashfs.img
  SYSUPGRADE:=bin/$(ARCH)/openwrt-x86-alix2-combined-squashfs.img
endif

ifeq ($(T),bullet)
  NAME:=Bullet
  ARCH:=ar71xx
  TBUILD:=ar71xx
  TARGET_MASTER:=nsm5
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-bullet-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-bullet-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),freestation)
  NAME:=Freestation
  ARCH:=ramips
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ramips-rt305x-freestation5-squashfs-sysupgrade.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ramips-rt305x-freestation5-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm2)
  NAME:=NanoStationM2
  ARCH:=ar71xx
  TBUILD:=ar71xx
  TARGET_MASTER:=nsm5
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm5)
  NAME:=NanoStationM5
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),pico2)
  NAME:=PicoStation2
  ARCH:=atheros
  TBUILD:=atheros
  BUILD_PATH:=$(BUILD_DIR)/atheros
  IMAGE:=bin/$(ARCH)/openwrt-atheros-ubnt2-pico2-squashfs.bin
endif

ifeq ($(T),rocket)
  NAME:=Rocket
  ARCH:=ar71xx
  TBUILD:=ar71xx
  TARGET_MASTER:=nsm5
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rocket-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rocket-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),rs)
  NAME:=RouterStation
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rs-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rs-squashfs-sysupgrade.bin
endif

ifeq ($(T),rspro)
  NAME:=RouterStationPro
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rspro-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rspro-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-2543)
  NAME:=Tplink2543
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr2543-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr2543-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-841)
  NAME:=Tplink841
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841nd-v7-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841nd-v7-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-842)
  NAME:=Tplink842
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr842n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr842n-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-703n)
  NAME:=Tplink703n
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin
endif


ifeq ($(T),tl-mr3020)
  NAME:=TplinkMR3020
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3020-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3020-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-mr3040)
  NAME:=TplinkMR3040
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 

ifeq ($(T),tl-mr3040-cam)
  NAME:=TplinkMR3040CamStreaming
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 

ifeq ($(T),tl-mr3040-bmx6dev)
  NAME:=TplinkMR3040Bmx6Testing
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 



ifeq ($(T),tl-wdr3600)
  NAME:=TplinkWDR3600
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr3600-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr3600-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wdr4300)
  NAME:=TplinkWDR4300
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr4300-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr4300-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),vbox)
  NAME:=VBox
  ARCH:=x86
  TBUILD:=x86
  IMAGE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.vdi
  SYSUPGRADE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.vdi
endif

ifeq ($(T),vmware)
  NAME:=VMware
  ARCH:=x86
  TBUILD:=x86
  IMAGE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.vmdk
  SYSUPGRADE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.vmdk
endif

ifeq ($(T),wpe72)
  NAME:=CompexWPE72
  ARCH:=ar71xx
  TBUILD:=ar71xx
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-wpe72-squashfs-8M-factory.img
endif

