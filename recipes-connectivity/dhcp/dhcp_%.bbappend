FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

DHCLIENT_FILE = "dhclient.conf"

SRC_URI += " files://${DHCLIENT_FILE} \
	   "
