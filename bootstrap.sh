#!/bin/bash

##
# Ubuntu setup script
# Based on - (https://github.com/deadbits/ubuntu-bootstrap)
# 

#Require sudo
sudo -v

# sudo keepalive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#Variable to hold working directory to come back to
current_repo=`pwd`

#setup system packages and system settings
source system.sh

#setup github
source github.sh
