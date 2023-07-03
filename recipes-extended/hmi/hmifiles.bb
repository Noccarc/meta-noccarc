# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipes deploys the HMI files to /usr/local at boot time.

SUMMARY = "730i HMI Files"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

TAR_FILE = "HMIfiles"

SRC_URI = " \
        file://${TAR_FILE}.tar.xz                       \
    "

S = "${WORKDIR}"

# Added to ignore the build time errors while unpacking tar files
INSANE_SKIP_${PN} = "file-rdeps dev-so libdir already-stripped"

# Not to consider the lib files provided by HMI files 
# as default for entire system
INSANE_SKIP_${PN}-dbg += "libdir"

# Additional flags to ignore build time errors
EXCLUDE_FROM_SHLIBS = "1"
do_package_qa[noexec] = "1"

do_install() {

        install -d ${D}${prefix}/local/${TAR_FILE}
        # We copy each file to its target location one at a time and give the 
        # respective user permission. Necessary for files with .so (lib files)
        cd ${WORKDIR}/${TAR_FILE} && find * -type f -exec install -Dm 755 "{}" "${D}${prefix}/local/${TAR_FILE}/{}" \;

}

FILES_${PN} = "${prefix}/local/${TAR_FILE}"
