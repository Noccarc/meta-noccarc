#!/bin/sh

# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved

# This script executed the backend_run.sh located in /usr/local/HMIfiles/scripts
# Called by backend.service located in /lib/systemd/system/

exec /usr/local/HMIfiles/scripts/backend_run.sh

 
