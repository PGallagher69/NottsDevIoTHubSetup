#!/bin/sh

node -v
sudo node -v
cd /home/pi/share
git clone -b start https://github.com/PGallagher69/NottsDevIoTHub.git /home/pi/share/NottsDevIoTHub
cd /home/pi/share/NottsDevIoTHub
npm install
sudo chown -R pi /home/pi/share
sudo chmod -R +755 /home/pi/share
printf "Press Enter to Complete"
read _