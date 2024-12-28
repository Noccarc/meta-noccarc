# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe installs the files for zmq at target location

SUMMARY = "730i ZMQ Files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

TAR_FILE = "zmq"

SRC_URI = " \
        file://${TAR_FILE}.tar.gz                       \
    "

S = "${WORKDIR}"

INSANE_SKIP_${PN} = "file-rdeps dev-so already-stripped"

INSANE_SKIP_${PN}-dbg += "libdir"


do_install() {

        install -d ${D}${prefix}/local/${TAR_FILE}
        # We copy each file to its target location one at a time and give the 
        # respective user permission. Necessary for files with .so (lib files)
        cd ${WORKDIR}/${TAR_FILE} && find * -type f -exec install -Dm 755 "{}" "${D}${prefix}/local/${TAR_FILE}/{}" \;

}

FILES_${PN} = "${prefix}/local/${TAR_FILE}"
