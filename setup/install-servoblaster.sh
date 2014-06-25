# This will install the servoblaster module and set it up to run on start.
# Credit to richardghirst (https://github.com/richardghirst/PiBits/tree/master/ServoBlaster)

# Pull down repository

pushd ..
git clone https://github.com/spartacus125/PiBits.git
popd

# Install servoblaster to run

pushd ../PiBits/ServoBlaster/user
sudo make install
popd

