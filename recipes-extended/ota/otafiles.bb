# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe installs the OTA files at the target

SUMMARY = "730i OTA Files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

TAR_FILE = "VCB-OTA"

SRC_URI = " \
        file://${TAR_FILE}.tar.xz;unpack=0                       \
    "

S = "${WORKDIR}"

do_install() {

        install -d ${D}${prefix}/local/
        install -m 644 ${WORKDIR}/${TAR_FILE}.tar.xz ${D}${prefix}/local/

}


FILES_${PN} = "${prefix}/local/"
