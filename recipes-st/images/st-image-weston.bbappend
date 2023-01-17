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
    tzdata \
    qtcharts \
    backend-mtr \
    staticnetwork \
    packagegroup-framework-tools \
    power-down \
    jsoncpp \
"

CORE_IMAGE_EXTRA_INSTALL_remove = " packagegroup-st-demo"
