FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://nocca_splash.bmp \
           "
FILES_${PN} += " ${datadir}/u-boot-stm32mp-splash "

UBOOT_SPLASH_SRC = "nocca_splash.bmp"
UBOOT_SPLASH_IMAGE ?= "splash"

do_install_append() {
    install -m 0644 ${WORKDIR}/${UBOOT_SPLASH_SRC} ${D}/boot/${UBOOT_SPLASH_IMAGE}.bmp
}


