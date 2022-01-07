FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://image_header.h \
	    file://image_header_nocca.h \
      "

NOCCARC_SPLASH_CFLAGS = "USE_SPLASH_NOCCARC"

EXTRA_OEMAKE = "CFLAGS+=-D${NOCCARC_SPLASH_CFLAGS}"

