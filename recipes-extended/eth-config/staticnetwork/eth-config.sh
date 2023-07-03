#!/bin/bash

# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This script configures the static ip for eth0 interface
# Called by eth-config.service located in /lib/systemd/system/

Path=/lib/systemd/network

if [ ! -e "${Path}/80-wired.network.notused" ] || [ ! -e "${Path}/52-static.network" ]
then

        cp "${Path}/80-wired.network" "${Path}/80-wired.network.notused"

        cp "${Path}/52-static.network.tmp" "${Path}/52-static.network"

        systemctl restart systemd-networkd.service

	sleep 1
fi

# Configure ethtool for eth0 to disable auto negotiation,
# set speed to 100Mbps and full duplex mode
# This should be run on every boot
ethtool -s eth0 autoneg off speed 100 duplex full
