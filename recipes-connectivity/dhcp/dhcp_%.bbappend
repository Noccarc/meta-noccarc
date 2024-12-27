FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

DHCLIENT_FILE = "dhclient.conf"
DHCLIENT_PATCH = "dhclient.conf.patch"

SRC_URI += " file://${DHCLIENT_FILE} \
	   "

#do_patch() {
	
#patch -i ${WORKDIR}/${DHCLIENT_PATCH}	

#}
