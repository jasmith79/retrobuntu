#!/bin/bash

sudo apt-get update

# First, some basics to ensure we can compile/clone/etc all the things...
sudo apt install -y git make gcc g++ 

# Create a directory to hold our stuff
mkdir -p /opt/programs

# Next, make sure we can remotely do stuffs
sudo apt install nettools openssh-server

# We'll use retroarch for most of our emulation needs
sudo apt install -y retroarch

# The universe repo only has a couple cores, so...
sudo add-apt-repository ppa:libretro/stable
sudo apt-get update
sudo apt install -y libretro-*

# I use an old PS3 controller, you can skip this if you're using something else.
sudo apt install -y dialog build-essential pyqt4-dev-tools libusb-dev libjack-dev libbluetooth-dev python-dbus
git clone https://github.com/falkTX/qtsixa.git /opt/programs/qtsixa
cd /opt/programs/qtsixa
make
sudo make install
sudo chown -R "$SUDO_USER" /opt/programs

# After that you will need to configure the ps3 controller in retroarch. 
# After configuring the user 1 inputs, there's a menu option called something 
# like 'save autoconfig' which will save all the inputs to a config file for further use.

