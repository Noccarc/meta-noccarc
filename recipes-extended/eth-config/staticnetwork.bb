# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe configures the static configuration of eth0 interface.

SUMMARY = "730i Static Network Service"
DEPENDS = "systemd"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

MOUNT_BASENAME = "eth-config"
STATIC_NETWORK_FILE = "52-static.network.tmp"

SRC_URI = " \
    file://${MOUNT_BASENAME}.service    \
    file://${MOUNT_BASENAME}.sh         \
    file://${STATIC_NETWORK_FILE}	\
    "

inherit systemd 

SYSTEMD_SERVICE_${PN} = "${MOUNT_BASENAME}.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

do_install() {
	
    install -d ${D}${sysconfdir}/scripts
    install -d ${D}${systemd_unitdir}/system
    install -d ${D}${systemd_unitdir}/network
    install -m 644 ${WORKDIR}/${MOUNT_BASENAME}.service ${D}${systemd_unitdir}/system    
    install -m 755 ${WORKDIR}/${MOUNT_BASENAME}.sh ${D}${sysconfdir}/scripts
    install -m 755 ${WORKDIR}/${STATIC_NETWORK_FILE} ${D}${systemd_unitdir}/network
    
}

RDEPENDS_${PN} += "bash"

FILES_${PN} = "${sysconfdir}/scripts ${systemd_unitdir}/system ${systemd_unitdir}/network"
