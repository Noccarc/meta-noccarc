IMAGE_INSTALL += " \
    gstreamer1.0 \
    gstreamer1.0-plugins-good \
    systemd-knob \
    systemd-ui \
    systemd-backend \
"

CORE_IMAGE_EXTRA_INSTALL_remove = " packagegroup-st-demo"
