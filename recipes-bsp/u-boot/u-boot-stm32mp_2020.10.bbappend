FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

UBOOT_SRC = "git://github.com/Noccarc/noccarc-uboot-stm32mp1.git;protocol=http"
UBOOT_BRANCH = "v730i_som_1V2"

SRC_URI = "${UBOOT_SRC};branch=${UBOOT_BRANCH} \
           file://stm32mp15_730isom_trusted_defconfig \
           "
#SRCREV = "ff99bd96b6da84d9c5917d25ae5876c3fff236ea"
SRCREV = "10b7967da852c3e4a1f604db37e9acd5ab7b6a34"

S = "${WORKDIR}/git"

do_configure_prepend () {
	install -m 0644 ${WORKDIR}/stm32mp15_730isom_trusted_defconfig ${S}/configs
}


