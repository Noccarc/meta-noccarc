# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe installs the power down services at the target

SUMMARY = "730i Power down services"
DEPENDS = "systemd"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SHUTDOWN_SERVICE = "shutdown-noccarc"

SRC_URI = " \
    file://${SHUTDOWN_SERVICE}.service      \
    "

inherit systemd

SYSTEMD_SERVICE_${PN} = "${SHUTDOWN_SERVICE}.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_install() {

    install -d ${D}${systemd_unitdir}/system
    install -m 644 ${WORKDIR}/${SHUTDOWN_SERVICE}.service ${D}/${systemd_unitdir}/system

}

RDEPENDS_${PN} += "bash"

FILES_${PN} += "${systemd_unitdir}"
