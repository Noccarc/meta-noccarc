FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/Noccarc-Robotics/noccarc-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v5.10-stm32mp-noccarc"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157c_730isom_mx_defconfig \
           "
SRCREV = "e8de30a96bba86f6b7fde59ac349349e9fab7648"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157c_730isom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
