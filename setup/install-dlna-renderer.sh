#!/bin/bash

# This will install the DLNA renderer for a Raspberry Pi
# DON'T RUN THIS SCRIPT AS SUDO - all commands that need to be sudo are taken care of inside of the script
# Credit goes to Marcin Galkowski (http://rootprompt.apatsch.net/2013/03/07/raspberry-pi-network-audio-player-pulseaudio-dlna-and-bluetooth-a2dp-part-2-dlna/)

# Install dependencies first

sudo aptitude -y -P install git alsa-base alsa-tools alsa-utils \
automake cvs gstreamer0.10-alsa gstreamer0.10-ffmpeg \
gstreamer0.10-fluendo-mp3 gstreamer0.10-plugins-base \
gstreamer0.10-plugins-good gstreamer0.10-pulseaudio \
gstreamer0.10-tools libglib2.0-dev libgstreamer0.10-0 \
libgstreamer0.10-dev libgstreamer-plugins-base0.10-0 libupnp-dev \
libxml2-dev mpg321

# Add dependency for new GStreamer

sudo wget -O - http://www.chiark.greenend.org.uk/~christi/debian/christi@coraline.org.gpg.key | sudo apt-key add -
sudo bash -c 'echo "deb http://www.chiark.greenend.org.uk/~christi/debian/ wheezy main" > /etc/apt/sources.list.d/upnprender.list'

# Install updated GStreamer

sudo apt-get update
sudo apt-get -y install libupnp-dev libgstreamer1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-alsa

# Pull down repository

pushd ~/RaspberryPi
git clone https://github.com/spartacus125/gmrender-resurrect.git
popd

# Run configuration

pushd ~/RaspberryPi/gmrender-resurrect
./autogen.sh
./configure && make install

# Binplace

sudo cp -f scripts/init.d/gmediarenderer /etc/init.d/gmediarenderer
sudo chmod 755 /etc/init.d/gmediarenderer
sudo update-rc.d gmediarenderer defaults 93 07
sudo /etc/init.d/gmediarenderer start

# Cleanup

popd
