FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append() {
    # Comment out the line in the udev rules file
    if [ -f ${D}${sysconfdir}/udev/rules.d/85-m4-dump.rules ]; then
        sed -i 's/^SUBSYSTEM==/#SUBSYSTEM==/' ${D}${sysconfdir}/udev/rules.d/85-m4-dump.rules
    fi
}