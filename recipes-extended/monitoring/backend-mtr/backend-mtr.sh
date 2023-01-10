#!/bin/bash

Activity="running"
while true
do
        Check_var=$(systemctl --type=service | grep backend.service | awk '{print $4}')
        if [ "$Check_var" != "$Activity" ]
        then
                echo "Backend Monitoring: sevice stopped. Restaring backend..." > /dev/kmsg
                /bin/systemctl start backend.service
                #echo "restarting"
                sleep 5
        fi

        sleep 2
done
