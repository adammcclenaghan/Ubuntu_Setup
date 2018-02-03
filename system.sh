#!/bin/bash

echo "Initialising System Setup..."

#Update repos
sudo apt-get -y update

# Commonly used tools
sudo apt-get install -y tcpdump dnsutils tmux tor maven 

#Add GNOME
sudo add-apt-repository ppa:gnome3-team/gnome3
sudo apt-get update && sudo apt-get install gnome-shell ubuntu-gnome-desktop
