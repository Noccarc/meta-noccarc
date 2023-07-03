# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe installs the remove-service.service to disable unnecessary services
 
SUMMARY = "730i UI Service"
DEPENDS = "systemd"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

MOUNT_BASENAME = "remove-service"

SRC_URI = " \
    file://${MOUNT_BASENAME}.service    \
    file://${MOUNT_BASENAME}.sh         \
    "

inherit systemd

SYSTEMD_SERVICE_${PN} = "${MOUNT_BASENAME}.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_install() {

    install -d ${D}${sysconfdir}/scripts
    install -d ${D}${systemd_unitdir}/system
    install -m 644 ${WORKDIR}/${MOUNT_BASENAME}.service ${D}/${systemd_unitdir}/system
    install -m 755 ${WORKDIR}/${MOUNT_BASENAME}.sh ${D}/${sysconfdir}/scripts

}

RDEPENDS_${PN} += "bash"

FILES_${PN} += "${systemd_unitdir} ${sysconfdir}/scripts"
