FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_SRC = "git://github.com/Noccarc/noccarc-linux-stm32mp1.git;protocol=http"
KERNEL_BRANCH = "v730i_som_1V2"
#KERNEL_BRANCH = "ghost_touch_issue"

SRC_URI = "${KERNEL_SRC};branch=${KERNEL_BRANCH} \
           file://stm32mp157c_730isom_mx_defconfig \
           "
#SRCREV = "f218ebe5c3790a3432c403f6b1875226f6c15b84"
SRCREV = "9db66425ad7816e111bcd76bc90d9b111acbcbae"
#SRCREV = "eab16ddd5a9a13c155355933cabff178f73e9883"

S = "${WORKDIR}/git"

KERNEL_DEFCONFIG = ""
KERNEL_EXTERNAL_DEFCONFIG = "stm32mp157c_730isom_mx_defconfig"
KERNEL_CONFIG_FRAGMENTS = ""
