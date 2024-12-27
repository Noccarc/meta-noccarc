inherit populate_sdk_qt5

IMAGE_INSTALL += " \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-tools \
    qtdeclarative-qmlplugins \
    qtquickcontrols2-qmlplugins \
    qtwayland \
    gstreamer1.0 \
    gstreamer1.0-plugins-good \
    systemd-knob \
    systemd-ui \
    systemd-backend \
    systemd-ota \
    systemd-router \
    systemd-fota \
    systemd-remove \
    tzdata \
    qtcharts \
    backend-mtr \
    staticnetwork \
    packagegroup-framework-tools \
    power-down \
    login-commands \
    jsoncpp \
    usb-udev \
    reboot-service \
    shutdown-service \
    ota-unpack \
"
IMAGE_FEATURES_remove += "debug-tweaks"
CORE_IMAGE_EXTRA_INSTALL_remove = " packagegroup-st-demo"
