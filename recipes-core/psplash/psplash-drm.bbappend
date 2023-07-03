# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe patches the source files of psplash to add 
# progress bar features, image header and modify the psplash 
# services for boot progress screen 

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://image_header.h \
	file://image_header_nocca.h \
	file://reboot.h \
	file://shutdown.h \
	file://noccarc_psplash.h \
	file://basic_splash_drm.patch \	
	file://psplash-drm-quit.patch \
	file://psplash-drm-start.patch \
      "
do_patch() {

	patch -i ${WORKDIR}/basic_splash_drm.patch
	patch -i ${WORKDIR}/psplash-drm-quit.patch
	patch -i ${WORKDIR}/psplash-drm-start.patch

}

NOCCARC_SPLASH_CFLAGS = "USE_SPLASH_NOCCARC"

EXTRA_OEMAKE = "CFLAGS+=-D${NOCCARC_SPLASH_CFLAGS}"

