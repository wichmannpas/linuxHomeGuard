Linux Home Partition Guard
==========================

This scripts mounts the home partition read-only and gives write access to an aufs-mounted tmpfs lying over it. The script *homeGuardWriteableMount.sh* disables the guard and allows the user to make permanent changes to the home partition.

It was tested on Ubuntu 12.04 and 14.0. It should be possible to use it on other distributions with slight modifications of the source.

Installation
------------

The script assumes the home partition being the first partition lying under */dev/sda1*; if this differs in your setup, you need to change that path in both scripts.

You need to create the following empty mount points (make sure to set the appropriate permissions):

 * /home
 * /home_rw
 * /home_ro

Additionally, you need to comment out or remove the home partition entry in your */etc/fstab* to avoid that the script tries to mount a partition which is already mounted.

Then, put the script *homeGuardMount.sh* in your system's autostart, i.e. */etc/rc.local* or using systemd, depending on your system configuration.

License
-------

Copyright 2015 Pascal Wichmann

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

   
----------------------------

Scripts and documentation written by Pascal Wichmann, copyright (c) 2015
