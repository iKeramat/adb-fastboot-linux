#!/bin/bash
echo "*** Install required packages..."
sudo apt-get install android-tools-adb android-tools-fastboot libncurses5:i386 libstdc++6:i386 zlib1g:i386
echo "*** Downloading rules..."
wget https://raw.githubusercontent.com/iKeramat/adb-fastboot-linux/master/51-android.rules
echo "*** Setting permissions..."
sudo mv 51-android.rules /etc/udev/rules.d
chmod a+r /etc/udev/rules.d/51-android.rules
sudo udevadm control --reload-rules
sudo addgroup --system plugdev
sudo adduser $USER plugdev
adb kill-server
adb start-server
echo "*** Done!"
