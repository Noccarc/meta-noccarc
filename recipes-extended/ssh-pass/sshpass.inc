DESCRIPTION = "Non-interactive ssh password auth"
HOMEPAGE = "http://sshpass.sourceforge.net/"
SECTION = "console/network"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-1.08.tar.gz"

inherit autotools

