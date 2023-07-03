#!/bin/sh

# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved
# This script configures the counter associted with knob
# Called by knob.service located in /lib/systemd/system/

# Init sequence on VAB -- current state -> Yellow
echo 0 > /sys/class/leds/led-red/brightness
echo 80 > /sys/class/leds/led-blue/brightness

# Configuration of knob
echo "quadrature x4" > /sys/bus/counter/devices/counter0/count0/function
echo 65535 > /sys/bus/counter/devices/counter0/count0/ceiling
echo 0 > /sys/bus/counter/devices/counter0/count0/count
echo 1 > /sys/bus/counter/devices/counter0/count0/enable

# Init sequence on VAB -- current state -> Cyan
sleep 1 
echo 0 > /sys/class/leds/led-blue/brightness
sleep 1
echo 0 > /sys/class/leds/led-green/brightness

