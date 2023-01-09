FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SCRIPT = "timesync"

SRC_URI += " \
        file://${SCRIPT}.sh \
        "

DEFAULT_TIMEZONE = "Asia/Kolkata"

do_install_append() {

        install -d ${D}${sysconfdir}/scripts
        install -m 755 ${WORKDIR}/${SCRIPT}.sh ${D}${sysconfdir}/scripts

}

FILES_${PN} += "${sysconfdir}/scripts"

RDEPENDS_${PN} += "bash"
