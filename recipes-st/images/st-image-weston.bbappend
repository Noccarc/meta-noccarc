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
    systemd-router \
    systemd-fota \
    tzdata \
    qtcharts \
    backend-mtr \
    staticnetwork \
    packagegroup-framework-tools \
    power-down \
    login-commands \
    jsoncpp \
    usb-udev \
"

IMAGE_FEATURES_append += "ssh-server-openssh"


IMAGE_FEATURES_remove += " \
			ssh-server-dropbear \ 
			debug-tweaks \
			"
CORE_IMAGE_EXTRA_INSTALL_remove = " packagegroup-st-demo"
