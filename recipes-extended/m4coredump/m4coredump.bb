# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

SUMMARY = "730i HMI Files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

TAR_FILE = "HMIfiles"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
    # Comment out the line in the udev rules file
    if [ -f ${D}${sysconfdir}/udev/rules.d/85-m4-dump.rules ]; then
        sed -i 's/^SUBSYSTEM==/#SUBSYSTEM==/' ${D}${sysconfdir}/udev/rules.d/85-m4-dump.rules
    fi
}