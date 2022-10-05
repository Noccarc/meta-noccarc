FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
            file://weston.ini \
            file://nocca_splash.png \
            "
FILES_${PN} += " ${datadir}/weston "

do_install_append() {
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/nocca_splash.png ${D}${datadir}/weston/backgrounds/nocca_splash.png
}

