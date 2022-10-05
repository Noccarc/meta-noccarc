#!/bin/sh

echo "quadrature x4" > /sys/bus/counter/devices/counter0/count0/function
echo 65535 > /sys/bus/counter/devices/counter0/count0/ceiling
echo 0 > /sys/bus/counter/devices/counter0/count0/count
echo 1 > /sys/bus/counter/devices/counter0/count0/enable
exec /usr/local/scripts/knob_730i.sh
