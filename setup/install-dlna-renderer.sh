# This will install the DLNA renderer for a Raspberry Pi
# Credit goes to Marcin Galkowski (http://rootprompt.apatsch.net/2013/03/07/raspberry-pi-network-audio-player-pulseaudio-dlna-and-bluetooth-a2dp-part-2-dlna/)

# Install dependencies first

sudo aptitude -y -P install git alsa-base alsa-tools alsa-utils \
automake cvs gstreamer0.10-alsa gstreamer0.10-ffmpeg \
gstreamer0.10-fluendo-mp3 gstreamer0.10-plugins-base \
gstreamer0.10-plugins-good gstreamer0.10-pulseaudio \
gstreamer0.10-tools libglib2.0-dev libgstreamer0.10-0 \
libgstreamer0.10-dev libgstreamer-plugins-base0.10-0 libupnp-dev \
libxml2-dev

# Pull down repository

pushd ..
git clone https://github.com/spartacus125/gmrender-resurrect.git
popd

# Run configuration

pushd ../gmrender-resurrect
./autogen.sh
./configure --prefix=`pwd` && make install

# Binplace

sudo cp -f bin/gmediarender /usr/local/bin
sudo cp -f scripts/init.d/gmediarenderer /etc/init.d/gmediarenderer
sudo chmod 755 /etc/init.d/gmediarenderer
sudo update-rc.d gmediarenderer defaults 93 07
sudo /etc/init.d/gmediarenderer start

# Cleanup

popd
