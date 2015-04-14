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
