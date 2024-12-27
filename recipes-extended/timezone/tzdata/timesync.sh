#!/bin/bash
Iomt_date=$(ssh root@192.168.0.2 /bin/date)

if [ $? -eq 0 ]
then
        date --set="${Iomt_date}" > /dev/null

        echo "System date time set"

        hwclock --systohc --utc

        echo "RTC clock set"
else
        echo "Unable to connect to IOMT. Faled setting HW clock."
fi
