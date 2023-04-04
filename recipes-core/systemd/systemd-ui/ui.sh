#!/bin/sh

# Copyright (C) 2022, Noccarc Robotics - All Rights Reserved
# This script executes the launcher script for V730i UI.
# Called by ui.service located in /lib/systemd/system/

. /etc/profile.d/weston_profile.sh

exec /usr/local/HMIfiles/scripts/storyboard_launcher.sh
