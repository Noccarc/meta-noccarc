# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

SUMMARY = "730i HMI Files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

TAR_FILE = "VCB-OTA"

SRC_URI = " \
        file://${TAR_FILE}.tar.xz                       \
    "

S = "${WORKDIR}"

INSANE_SKIP_${PN} = "file-rdeps dev-so libdir already-stripped"

INSANE_SKIP_${PN}-dbg += "libdir"

EXCLUDE_FROM_SHLIBS = "1"
do_package_qa[noexec] = "1"

do_install() {

        install -d ${D}${prefix}/local/${TAR_FILE}
        cd ${WORKDIR}/${TAR_FILE} && find * -type f -exec install -Dm 755 "{}" "${D}${prefix}/local/${TAR_FILE}/{}" \;

}

FILES_${PN} = "${prefix}/local/${TAR_FILE}"
