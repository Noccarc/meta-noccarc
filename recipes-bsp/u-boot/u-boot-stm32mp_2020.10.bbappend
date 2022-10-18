FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/Noccarc/noccarc-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v730i_som_1V2"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_730isom_trusted_defconfig \
           "
SRCREV = "e799ebc94a0ca1cfdfa213afa7eeb220b77c7e5b"

S = "${WORKDIR}/git"

do_configure_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_730isom_trusted_defconfig ${S}/configs
}


