FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/Noccarc/noccarc-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "custom-powertip"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157c_730isom_mx_defconfig \
           "
SRCREV = "500b7f1b985a090f387abdd8e6015e120e156321"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157c_730isom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
