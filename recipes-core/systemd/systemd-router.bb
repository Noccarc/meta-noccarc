# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

SUMMARY = "730i Router Service"
DEPENDS = "systemd"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

MOUNT_BASENAME = "router"

SRC_URI = " \
    file://${MOUNT_BASENAME}.service    \
    "

inherit systemd

SYSTEMD_SERVICE_${PN} = "${MOUNT_BASENAME}.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_install() {

    install -d ${D}${systemd_unitdir}/system
    install -m 644 ${WORKDIR}/${MOUNT_BASENAME}.service ${D}/${systemd_unitdir}/system

}

FILES_${PN} += "${systemd_unitdir}"
