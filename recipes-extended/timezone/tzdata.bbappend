# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This recipe adds timezones to target and configures default timezone
# Also installs a timesync script to sync SOM system time with RTC

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
