FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/Noccarc/noccarc-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v730i_som_1V2"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157c_730isom_mx_defconfig \
           "
SRCREV = "39eda5fe0639d0f226e515d874e450c89dbd3dd6"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157c_730isom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
