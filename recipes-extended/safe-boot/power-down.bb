# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe installs the power down files at the target

SUMMARY = "730i Power down Files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

BASH_SCRIPT = "power_down.sh"
REBOOT_CALL = "reboot-call.sh"

SRC_URI = " \
    file://${BASH_SCRIPT}         \
    file://${REBOOT_CALL}         \
    "

inherit systemd

do_install() {

    install -d ${D}${sysconfdir}/scripts
    install -m 755 ${WORKDIR}/${BASH_SCRIPT} ${D}/${sysconfdir}/scripts
    install -m 755 ${WORKDIR}/${REBOOT_CALL} ${D}/${sysconfdir}/scripts
    
}

RDEPENDS_${PN} += "bash"

FILES_${PN} += "${sysconfdir}/scripts"
