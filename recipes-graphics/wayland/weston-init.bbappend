# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe adds the splash screen of weston and removes cursor on screen
# Adds a cursor_move binary to /usr/share/weston/exec to move cursor out of bound

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

EXECFILE = "cursor_move"

SRC_URI += " \
            file://weston.ini \
            file://nocca_splash.png \
	    file://left_ptr \
            file://${EXECFILE} \
	    "
FILES_${PN} += " ${datadir}/weston ${datadir}/icons/Adwaita/cursors ${datadir}/weston/exec"

do_install_append() {

    install -d ${D}${datadir}/icons/Adwaita/cursors
    install -d ${D}${datadir}/weston/exec
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/nocca_splash.png ${D}${datadir}/weston/backgrounds/nocca_splash.png
    install -m 0644 ${WORKDIR}/left_ptr ${D}${datadir}/icons/Adwaita/cursors/
    install -m 0644 ${WORKDIR}/${EXECFILE} ${D}${datadir}/weston/exec/${EXECFILE}

}

