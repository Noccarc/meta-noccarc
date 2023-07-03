#!/bin/sh
 
# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This is the Power down script for V730i
# The script performs the safe shutdown and reboot sequence for V730i 
# Called by UI during a shutdown event

echo 50 > /sys/class/leds/led-blue/brightness
echo 50 > /sys/class/leds/led-green/brightness
echo 0 > /sys/class/leds/led-red/brightness

#Check for reboot flag. This is done to check if reboot is invoked.
reboot_flag=$(cat /etc/scripts/reboot-check.txt)
if [ "$reboot_flag" == "1" ]
then
	decision_code=20
	echo 0 > /etc/scripts/reboot-check.txt
elif [ "$reboot_flag" == "0" ]
then
	decision_code=10
else
	echo 0 > /etc/scripts/reboot-check.txt
	decision_code=10
fi

shutdown_flag=10
reboot_flag=20

iomt_Status=1
Defconn_Status="no"
Link_status=""

shutdown_count=0
reboot_count=0
max_count=10


#Command iomt to shutdown                                  
ssh root@192.168.0.2 /sbin/shutdown -h now > /dev/null &

# Stop weston and start psplash                            
timeout 5s systemctl stop weston@root

#sleep 1
if [ $decision_code -eq $shutdown_flag ] 
then
        echo 50 > /sys/class/leds/led-green/brightness
        echo 0 > /sys/class/leds/led-blue/brightness
        
	#Shutdown screen
	psplash-drm -w -i 1 > /dev/null &

        while [ $iomt_Status -eq 1 ] && [ $shutdown_count -lt $max_count ]
        do
		# Check status gpio / eth0 link if iomt is awake
		Link_status=$(timeout 2s gpioget 7 13)

		#Link_status=$(timeout 2s ssh root@192.168.0.2 /usr/sbin/ethtool eth0 | awk '/Link detected/' | awk '{print $3}')
		if [ "$Link_status" == "$Defconn_Status" ] || [ "$Link_status" == "0" ]
		then
			iomt_Status=0 
		else
			shutdown_count=$((shutdown_count+1))
			sleep 1
		fi
	done 
	
fi

if [ $decision_code -eq $reboot_flag ]
then
	echo 100 > /etc/scripts/reboot-check.txt
        echo 0 > /sys/class/leds/led-green/brightness
        echo 50 > /sys/class/leds/led-blue/brightness
        
	#Reboot screen
	psplash-drm -w -i 2 > /dev/null &

        while [ $iomt_Status -eq 1 ] && [ $reboot_count -lt $max_count ]
        do
		# Check status gpio / eth0 link if iomt is awake
		Link_status=$(timeout 2s gpioget 7 13)

		#Link_status=$(timeout 2s ssh root@192.168.0.2 /usr/sbin/ethtool eth0 | awk '/Link detected/' | awk '{print $3}')
		if [ "$Link_status" == "$Defconn_Status" ] || [ "$Link_status" == "0" ]
		then
			iomt_Status=0 
		else 
			reboot_count=$((reboot_count+1))
			sleep 1
		fi
	done 
fi
