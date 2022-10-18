FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/Noccarc/noccarc-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v730i_som_1V2"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_730isom_trusted_defconfig \
           "
SRCREV = "5f029bc30bcaba0620ad68b2ba7d08a86476822a"

S = "${WORKDIR}/git"

do_configure_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_730isom_trusted_defconfig ${S}/configs
}


