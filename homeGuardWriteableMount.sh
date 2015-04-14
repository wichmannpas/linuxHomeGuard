#!/bin/bash

# This script is written by Pascal Wichmann (pa-w.de)
# See installation instructions on GitHub (github.com/wichmannpas) in order for this script to work!

# this script needs to be ran as root!

# this script stops lightdm and remounts the home partition writeable

while true; do
    read -p "Attention: lightdm will be restarted (you should not run this script from a graphical terminal!). Continue? (y/n)" yn
    case $yn in
        [Yy]* ) break;;
    	[Nn]* ) exit;;
    	* ) exit;;
	esac
done

# stopping lightdm
service lightdm stop
echo "will now wait for 15 seconds to make sure all write processes to home partition are finished ..."
sleep 15

# unmount home partition (should be currently aufs)
umount /home

# unmount tmpfs partition on home home_rw
umount /home_rw

# unmount actual home partition
umount /home_ro

# mount actual home partition writeable to mount point /home
mount /dev/sda1 /home

# start lightdm again
service lightdm start

# Copyright 2015 Pascal Wichmann
# 
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
