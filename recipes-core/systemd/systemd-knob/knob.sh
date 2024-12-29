#!/bin/sh
echo 1 > /sys/class/leds/jtag/brightness
echo 0 > /sys/class/leds/led-red/brightness
echo 80 > /sys/class/leds/led-blue/brightness
ethtool -s eth0 autoneg off speed 100 duplex full
echo "quadrature x4" > /sys/bus/counter/devices/counter0/count0/function
echo 65535 > /sys/bus/counter/devices/counter0/count0/ceiling
echo 0 > /sys/bus/counter/devices/counter0/count0/count
echo 1 > /sys/bus/counter/devices/counter0/count0/enable
sleep 1 
echo 0 > /sys/class/leds/led-blue/brightness
sleep 1
echo 0 > /sys/class/leds/led-green/brightness

resize2fs /dev/mmcblk0p5

exec /usr/local/scripts/knob_730i.sh
