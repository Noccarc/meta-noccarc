#!/bin/bash
Iomt_date=$(ssh root@192.168.0.2 /bin/date -u)

if [ $? -eq 0 ]
then
        date --set="${Iomt_date}" > /dev/null

        echo "System date time set"

        rtc -s "`date -u`"

        echo "RTC clock set"
else
        echo "Unable to connect to IOMT. Failed setting HW clock."
fi