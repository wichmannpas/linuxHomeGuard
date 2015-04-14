#!/bin/bash

# This script is written by Pascal Wichmann (pa-w.de)
# See installation instructions on GitHub (github.com/wichmannpas) in order for this script to work!

#this script needs to be ran as root! (usually via rc.local or a similar autostart service)

# mount actual partition as read only
mount -o ro /dev/sda1 /home_ro

# mount new writeable blank tmpfs file system
mount -t tmpfs none /home_rw

# mount tmpfs over ro actual partition using aufs on /home
mount -t aufs -o dirs=/home_rw=rw:/home_ro=ro unionfs /home
