# This will install Web2Py on the Raspberry Pi
# Credit to willq44 (http://www.instructables.com/id/Raspberry-Pi-GPIO-home-automation/?ALLSTEPS)

# Prompt user with instructions (from instructable site above)

echo "Follow the instructions on the screen.  This step will take several minutes and you may see some errors in the process, but it seems to work anyway.  The mail configuration is not really important, you can just set it as .no configuration..  When asked about your location and such, the values aren't critical, do your best.  The most important thing is to remember the admin password that you select during the installation

Once the installation is complete you should be able to connect to web2py server from your computer.  In your computer's browser enter the address to your Raspberry Pi.  It is very important that you used https when connecting to the web2py server.  Your URL will look something like:

https://192.168.2.179/  or  https://rasberrypi


You may see a security warning in your browser.  That's OK,  you can safely ignore this warning.  If everything worked correctly, you should now see the welcome page for Web2Py."

read -p "THIS IS AN INTERACTIVE INSTALL. PRESS ANY KEY TO CONTINUE" -n 1 -s

# Create directory for install files

WEB2PYDIR="~/Web2PyFiles"
mkdir $WEB2PYDIR

# Download files and install

pushd $WEB2PYDIR
wget http://web2py.googlecode.com/hg/scripts/setup-web2py-ubuntu.sh
chmod +x setup-web2py-ubuntu.sh
sudo ./setup-web2py-ubuntu.sh
popd
