#!/bin/bash

# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This script disables the unnecessary services in SOM
# Called by reove-service.service located at /lib/systemd/system
 
Exp_result="disabled"

#Check pulseaudio.service
Check_service=$(systemctl list-unit-files --type=service --state=disabled | grep pulseaudio | awk '{print$2}')
if [ "$Check_service" != "$Exp_result" ]
then
	/bin/systemctl disable pulseaudio.service
	#sleep 0.5
	/bin/systemctl stop pulseaudio.service
fi	

#Check systemd-timesyncd.service
Check_service_1=$(systemctl list-unit-files --type=service --state=disabled | grep systemd-timesyncd | awk '{print$2}')
if [ "$Check_service_1" != "$Exp_result" ]
then
        /bin/systemctl disable systemd-timesyncd.service
        #sleep 0.5
        /bin/systemctl stop systemd-timesyncd.service
fi

