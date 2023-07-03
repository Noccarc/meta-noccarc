#!/bin/bash

# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# The script checks the status of backend.service and restarts it failed.
# Called by backend-mtr.service located at /lib/systemd/system

Activity="running"
while true
do
        Check_var=$(systemctl --type=service | grep backend.service | awk '{print $4}')
        if [ "$Check_var" != "$Activity" ]
        then
                # Leave a footprint at dmesg at a restart has occured
                echo "Backend Monitoring: sevice stopped. Restaring backend..." > /dev/kmsg
                /bin/systemctl start backend.service
                #echo "restarting"
                sleep 5
        fi

        sleep 2
done
