# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

SUMMARY = "730i SSHPASS INSTALLATION"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

TAR_FILE = "sshpass-1.08"

SRC_URI = " \
        file://${TAR_FILE}.tar.gz;unpack=0                       \
    "

S = "${WORKDIR}"

INSANE_SKIP_${PN} = "file-rdeps dev-so libdir"

INSANE_SKIP_${PN}-dbg += "libdir"

EXCLUDE_FROM_SHLIBS = "1"
do_package_qa[noexec] = "1"

do_install() {

        install -d ${D}${prefix}/local
	install -m 644 ${WORKDIR}/${TAR_FILE}.tar.gz ${D}${prefix}/local/
	cd ${D}${prefix}/local/ && tar -xvf ${TAR_FILE}.tar.gz 
	cd ${D}${prefix}/local/${TAR_FILE} && autoreconf -f -i && bash configure --host=armv7l
	cd ${D}${prefix}/local/${TAR_FILE} && sudo  make && sudo make install

}

FILES_${PN} = "${prefix}/local"
