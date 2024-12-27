FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/Noccarc/noccarc-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v730i_som_1V2"
#KERNEL_BRANCH = "ghost_touch_issue"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157c_730isom_mx_defconfig \
           "
#SRCREV = "f218ebe5c3790a3432c403f6b1875226f6c15b84"
#SRCREV = "3daf6cf6b9639f710367f282a4419e709a5264af"
SRCREV = "d8e4a6a9a6c2e020d02da77497a6ae0f27c1418f"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157c_730isom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
