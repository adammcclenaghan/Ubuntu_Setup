#!/bin/bash

echo "Initialising System Setup..."

# Update repos
sudo apt-get -y update

# Commonly used tools
sudo apt-get install -y tcpdump dnsutils tmux tor maven tree curl python3-pip wireshark emacs weechat-curses weechat-plugins dos2unix libxml2-utils clang

# Install golang via snap
sudo snap install go --classic

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

# Create dev area

mkdir ~/development

# Get dotfiles and create emacs symlink

git clone git@github.com:adammcclenaghan/dotfiles.git ~/development

while true; do
    read -p "Do you want to symlink .emacs to file in dotfiles? This will remove any existing emacs config" yn
    case $yn in
	[Yy]* ) rm -f ~/.emacs && ln -s ~/development/dotfiles/emacs/.emacs ~/.emacs ; break;;
	[Nn]* ) break;;
	* ) echo "Please enter yes or no";;
    esac
done

# Swap capslock with ctrl

while true; do
    read -p "Do you want to swap capslock with Ctrl?" yn
    case $yn in
	[Yy]* ) echo 'XKBOPTIONS="ctrl:swapcaps"' >> /etc/default/keyboard; sudo rpkg-reconfigure keyboard-configuration; break;;
	[Nn]* ) break;;
	* ) echo "Please enter yes or no";;
    esac
done

# If using the kinesis advantage 2 then swapping the left alt with delete
# makes life in emacs a lot more pleasant
while true; do
    read -p "Do you want to modify keys according to xmodmaprpc from dotfiles?" yn
    case $yn in
	[Yy]* ) rm -f ~/.xmodmaprpc && ln -s ~/development/dotfiles/bash/.xmodmaprpc ~/.xmodmaprpc && chmod +x ~/.xmodmaprpc && chmod +x ~/development/dotfiles/bash/.xmodmaprpc; break;;
	[Nn]* ) break;;
	* ) echo "Please enter yes or no";;
    esac
done


read -p 'y/n: ' linkEmacs
