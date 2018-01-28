#!/bin/bash

echo "Initialising System Setup..."

#Update repos
sudo apt-get -y update

# Commonly used tools
sudo apt-get install -y tcpdump dnsutils tmux
