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
#  PROFILE := The profile used for the device (must coincide with a configs/xxx filename=
#
# Optional
#  TARGET_MASTER := The device will use the same options defined in his target master
#  TBUILD := The buildroot directory (relative to BUILD_DIR)
#  SYSUPGRADE := The file path (relative to buildroot) to the firmware sysupgrade image
#
# Any option defined in Makefile can be overrided from here, for instance
#  override OWRT_SVN = svn://mysvn.com/owrt

HW_AVAILABLE := ar71xx bullet kvm nsm2 nsm5 nsm5-xw nslm5-xw pico2 rocket rs rspro tl-2543 tl-703n tl-wr841n-v7 tl-wr841n-v8 tl-wr841n-v9 tl-842 tl-mr3020 tl-mr3040 tl-mr3040-cam tl-wdr3600 tl-wdr4300 tl-wdr4900-v1 wpe72 dragino2 alix x86 unifi-ap vbox vmware dir-810l wrtnode wt3020 ath-ib
TBUILD_LIST := openwrt

ifeq ($(T),ar71xx)
  NAME:=ar71xx
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
endif

ifeq ($(T),ath-ib)
  NAME:=ar71xx
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-imagebuilder
  override MAKE_SRC = -j$(J) V=$(V) IGNORE_ERRORS=1
  IMAGE:=bin/$(ARCH)/OpenWrt-ImageBuilder-$(ARCH)_generic-for-linux-x86_64.tar.bz2 ImageBuilder-qMp-ar71xx-x86_64.tar.bz2
endif

ifeq ($(T),alix)
  NAME:=Alix
  ARCH:=x86
  TBUILD:=openwrt
  PROFILE:=x86-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-x86-alix2-combined-squashfs.img
  SYSUPGRADE:=bin/$(ARCH)/openwrt-x86-alix2-combined-squashfs.img
endif

ifeq ($(T),x86)
  NAME:=x86
  ARCH:=x86
  TBUILD:=openwrt
  PROFILE:=x86-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-x86-generic-combined-squashfs.img
  SYSUPGRADE:=bin/$(ARCH)/openwrt-x86-generic-combined-squashfs.img
endif


ifeq ($(T),bullet)
  NAME:=Bullet
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-bullet-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-bullet-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm2)
  NAME:=NanoStationM2
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm5)
  NAME:=NanoStationM5
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),nsm5-xw)
  NAME:=NanoStationM5-XW
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-xw-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-nano-m-xw-squashfs-sysupgrade.bin
endif

ifeq ($(T),nslm5-xw)
  NAME:=NanoStationLocoM5-XW
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-loco-m-xw-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-loco-m-xw-squashfs-sysupgrade.bin
endif

ifeq ($(T),pico2)
  NAME:=PicoStation2
  ARCH:=atheros
  TBUILD:=openwrt
  PROFILE:=at2-qmp-tiny-node
  BUILD_PATH:=$(BUILD_DIR)/atheros
  IMAGE:=bin/$(ARCH)/openwrt-atheros-ubnt2-pico2-squashfs.bin
endif

ifeq ($(T),rocket)
  NAME:=Rocket
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rocket-m-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rocket-m-squashfs-sysupgrade.bin
endif

ifeq ($(T),rs)
  NAME:=RouterStation
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rs-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rs-squashfs-sysupgrade.bin
endif

ifeq ($(T),rspro)
  NAME:=RouterStationPro
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rspro-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-rspro-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-2543)
  NAME:=Tplink2543
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr2543-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr2543-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v7)
  NAME:=TP-Link-TL-WR841N-v7
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841nd-v7-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841nd-v7-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v8)
  NAME:=TP-Link-TL-WR841N-v8
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841n-v8-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841n-v8-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr841n-v9)
  NAME:=TP-Link-TL-WR841N-v9
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841n-v9-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr841n-v9-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-842)
  NAME:=Tplink842
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr842n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr842n-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-703n)
  NAME:=Tplink703n
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-sysupgrade.bin
endif


ifeq ($(T),tl-mr3020)
  NAME:=TplinkMR3020
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3020-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3020-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-mr3040)
  NAME:=TplinkMR3040
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 

ifeq ($(T),tl-mr3040-cam)
  NAME:=TplinkMR3040CamStreaming
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 

ifeq ($(T),tl-mr3040-bmx6dev)
  NAME:=TplinkMR3040Bmx6Testing
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-mr3040-v1-squashfs-sysupgrade.bin
endif 

ifeq ($(T),tl-wdr3600)
  NAME:=TplinkWDR3600
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr3600-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr3600-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wdr4300)
  NAME:=TplinkWDR4300
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr4300-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wdr4300-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wdr4900-v1)
  NAME:=TP-Link-TL-WDR4900-v1
  ARCH:=mpc85xx
  TBUILD:=openwrt
  IMAGE:=bin/$(ARCH)/openwrt-mpc85xx-generic-tl-wdr4900-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-mpc85xx-generic-tl-wdr4900-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr743nd)
  NAME:=Tplink743nd
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr743nd-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr743nd-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),tl-wr740n)
  NAME:=Tplink740n
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr740n-v1-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-tl-wr740n-v1-squashfs-sysupgrade.bin
endif

ifeq ($(T),wpe72)
  NAME:=CompexWPE72
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-wpe72-squashfs-8M-factory.img
endif

ifeq ($(T),dragino2)
  NAME:=Dragino2
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-dragino2-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-dragino2-squashfs-sysupgrade.bin
endif

ifeq ($(T),unifi-ap)
  NAME:=Ubiquiti-Unifi-AP
  ARCH:=ar71xx
  TBUILD:=openwrt
  PROFILE:=ath-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-unifi-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ar71xx-generic-ubnt-unifi-squashfs-sysupgrade.bin
endif

ifeq ($(T),vbox)
  NAME:=VBox
  ARCH:=x86
  TBUILD:=openwrt
  PROFILE:=vm-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.img.gz
endif

ifeq ($(T),vmware)
  NAME:=VMware
  ARCH:=x86
  TBUILD:=openwrt
  PROFILE:=vm-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.vmdk
  SYSUPGRADE:=bin/$(ARCH)/openwrt-x86-generic-combined-ext4.vmdk
endif

ifeq ($(T),wrtnode)
  NAME:=WRTnode
  ARCH:=ramips
  TBUILD:=openwrt
  PROFILE:=mt7620n-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ramips-mt7620n-wrtnode-squashfs-sysupgrade.bin
endif 

ifeq ($(T),wt3020)
  NAME:=Nexx-WT3020
  ARCH:=ramips
  TBUILD:=openwrt
  PROFILE:=mt7620a-qmp-tiny-node
  IMAGE:=bin/$(ARCH)/openwrt-ramips-mt7620n-wt3020-4M-squashfs-factory.bin
  SYSUPGRADE:=bin/$(ARCH)/openwrt-ramips-mt7620n-wt3020-4M-squashfs-sysupgrade.bin
endif

ifeq ($(T),dir-810l)
  NAME:=D-Link-DIR-810L
  ARCH:=ramips
  TBUILD:=openwrt
  PROFILE:=mt7620a-qmp-small-node
  IMAGE:=bin/$(ARCH)/openwrt-ramips-mt7620a-dir-810l-squashfs-sysupgrade.bin
endif 

ifeq ($(T),kvm)
  NAME:=KVM
  ARCH:=x86
  TBUILD:=openwrt
  PROFILE:=kvm-qmp-big-node
  IMAGE:=bin/$(ARCH)/openwrt-x86-kvm_guest-combined-ext4.img.gz
endif
