#!/bin/bash

echo "Initialising System Setup..."

# Update repos
sudo apt-get -y update

# Commonly used tools
sudo apt-get install -y tcpdump dnsutils tmux tor maven tree curl python3-pip wireshark emacs 
