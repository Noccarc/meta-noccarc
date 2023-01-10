#!/bin/sh
#Power down script

echo 0 > /sys/class/leds/led-blue/brightness
echo 0 > /sys/class/leds/led-green/brightness
echo 0 > /sys/class/leds/led-red/brightness

sleep 1

echo 100 > /sys/class/leds/led-blue/brightness
echo 100 > /sys/class/leds/led-green/brightness
echo 0 > /sys/class/leds/led-red/brightness

decision_code=$1
shutdown_flag=10
reboot_flag=20

iomt_Status=1
Defconn_Status="yes"
Link_status=""

sleep 2
if [ $decision_code -eq $shutdown_flag ]
then
        echo 100 > /sys/class/leds/led-green/brightness
        echo 0 > /sys/class/leds/led-blue/brightness
        sleep 1
        
        #Command iomt to shutdown 
	timeout 1s ssh root@192.168.0.2 /sbin/reboot

        while [ $iomt_Status -eq 1 ]
	do 
		sleep 1

		#Check status gpio / eth0 link if iomt is awake
		Link_status=$(timeout 2s ssh root@192.168.0.2 /usr/sbin/ethtool eth0 | awk '/Link detected/' | awk '{print $3}')
		if [ "$Link_status" !=  "$Defconn_Status" ]
			then
				iomt_Status=0 
			fi 
	done 
	
	#Command for SOM shutdown
        /sbin/shutdown -h now
        sleep 1
fi

if [ $decision_code -eq $reboot_flag ]
then
        echo 100 > /sys/class/leds/led-blue/brightness
        echo 0 > /sys/class/leds/led-green/brightness
        sleep 1
        /sbin/reboot
        sleep 1
fi
