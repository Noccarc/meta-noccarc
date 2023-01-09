# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

SUMMARY = "730i OTA script"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

MOUNT_BASENAME = "ota"

SRC_URI = " \
    file://${MOUNT_BASENAME}.sh         \
    "

do_install() {
    
    install -d ${D}${sysconfdir}/scripts 
    install -m 755 ${WORKDIR}/${MOUNT_BASENAME}.sh ${D}/${sysconfdir}/scripts

}
RDEPENDS_${PN} = "bash"

FILES_${PN} += "${sysconfdir}/scripts"
