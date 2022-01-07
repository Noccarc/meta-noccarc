FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/Noccarc-Robotics/noccarc-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v2020.10-stm32mp-noccarc"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_730isom_trusted_defconfig \
           "
SRCREV = "3d3a0eaed7ae68fcd9919b2289443f9670879938"

S = "${WORKDIR}/git"

do_configure_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_730isom_trusted_defconfig ${S}/configs
}


