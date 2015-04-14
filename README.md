Linux Home Partition Guard
==========================

This scripts mounts the home partition read-only and gives write access to an aufs-mounted tmpfs lying over it. The script *homeGuardWriteableMount.sh* disables the guard and allows the user to make permanent changes to the home partition.

It was tested on Ubuntu 12.04 and 14.0. It should be possible to use it on other distributions with slight modifications in the source.

Installation
------------

The script assumes the home partition being the first partition lying under */dev/sda1*; if this differs in your setup, you need to change this in all scripts.

You need to create the following empty mount points (make sure to set the appropriate permissions):

 * /home
 * /home_rw
 * /home_ro

Additionally, you need to comment out or remove the home partition entry in your */etc/fstab* to avoid that the script tries to mount a partition which is already mounted.

Then, put the script *homeGuardMount.sh* in your system's autostart, i.e. */etc/rc.local* or using systemd, depending on your system configuration.



Scripts and documentation written by Pascal Wichmann, copyright (c) 2015
