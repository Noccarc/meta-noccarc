FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/Noccarc/noccarc-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v730i_som_1V2"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157c_730isom_mx_defconfig \
           "
#SRCREV = "ab9d0283095e17e1a89f741bd752be3bf015ff50"
SRCREV = "f218ebe5c3790a3432c403f6b1875226f6c15b84"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157c_730isom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
