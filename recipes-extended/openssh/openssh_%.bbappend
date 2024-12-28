# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe configures the ssh utility for auto-authentication over eth0 interface

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

AUTH_FILE = "authorized_keys"
ID_RSA_FILE = "id_rsa"
SSHD_FILE = "sshd_config"

SRC_URI += " \
    file://${ID_RSA_FILE} \
    file://${AUTH_FILE}	\
    file://${SSHD_FILE} \
    "

do_install_append() {
	
    install -d ${D}/home/root/.ssh/
    install -m 600 ${WORKDIR}/${ID_RSA_FILE} ${D}/home/root/.ssh/
    install -m 600 ${WORKDIR}/${AUTH_FILE} ${D}/home/root/.ssh/

}

FILES_${PN} = "/home/root/.ssh/ "
