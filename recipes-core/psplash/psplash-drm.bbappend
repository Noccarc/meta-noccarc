FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://image_header.h \
	file://image_header_nocca.h \
	file://reboot.h \
	file://shutdown.h \
	file://dot.h \
        file://dot1.h \
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

