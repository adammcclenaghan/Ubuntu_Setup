#!/bin/bash

echo "Initialising System Setup..."

# Update repos
sudo apt-get -y update

# Commonly used tools
sudo apt-get install -y tcpdump dnsutils tmux tor maven tree curl python3-pip wireshark emacs weechat-curses weechat-plugins dos2unix libxml2-utils

#Setup Wallpaper - Gnome only
while true; do
	read -p "Do you wish to change your wallpaper to the one included with this repo? (Only supported on gnome via gsettings)" yn
	case $yn in
		[Yy]* ) gsettings set org.gnome.desktop.background picture-uri file:///$current_repo/wallpaper.jpeg ; break;;
		[Nn]* )  break;;
		* ) echo "Please enter yes or no";;
	esac
done

read -p 'y/n: ' changeWallpaper


