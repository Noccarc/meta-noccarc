#!/bin/bash

Path=/lib/systemd/network

if [ ! -e "${Path}/80-wired.network.notused" ]
then

        cp "${Path}/80-wired.network" "${Path}/80-wired.network.notused"

        cp "${Path}/52-static.network.tmp" "${Path}/52-static.network"

        systemctl restart systemd-networkd.service

	sleep 1
fi

ethtool -s eth0 autoneg off speed 100 duplex full
