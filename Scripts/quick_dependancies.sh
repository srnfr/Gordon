#!/bin/bash
set -x 

echo "For AWS EC2 Ubuntu 16.0.4 2023 build)"
sudo apt-update
sudo apt-get install -y python
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
#Obsolete python3 -m pip install numpy
#sudo python3-pip install numpy
## Install numpy
curl -fsSL https://bootstrap.pypa.io/pip/3.5/get-pip.py | python3.5

## Install mahimahi
sudo add-apt-repository ppa:keithw/mahimahi -y
sudo apt-get update
sudo apt-get install -y mahimahi

sudo dpkg-reconfigure -p critical dash
sudo sysctl -w net.ipv4.ip_forward=1
sudo apt-get install -y libnetfilter-queue-dev
sudo apt-get install tmux

# apt-get install sudo -y   # for Docker
sudo apt-get install -y iputils-ping
sudo apt-get install -y wget
sudo apt-get install -y psmisc
sudo apt install -y net-tools

#relocating iptables in some instances of Ubuntu
#sudo cp /etc/alternatives/iptables /sbin/iptables
