# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe installs the udev rule to restrict USB devices

SUMMARY = "Restrict USB device rules"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

MOUNT_BASENAME = "90-remove-non-storage"

SRC_URI = " \
    file://${MOUNT_BASENAME}.rules         \
    "

do_install() {

    install -d ${D}${sysconfdir}/udev/rules.d
    install -m 755 ${WORKDIR}/${MOUNT_BASENAME}.rules ${D}/${sysconfdir}/udev/rules.d

}

FILES_${PN} += "${sysconfdir}/udev/rules.d"

