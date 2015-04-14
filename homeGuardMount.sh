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

# Copyright 2015 Pascal Wichmann
# 
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
