#!/bin/sh

sudo apt-get update
sudo rpi-update 52241088c1da59a359110d39c1875cda56496764
sudo apt-get install samba samba-common-bin -y
printf "raspberry\nraspberry\n" | smbpasswd -a -s pi
mkdir /home/pi/share
#sudo nano /etc/samba/smb.conf
cat SambaShare.txt >> /etc/samba/smb.conf
smbd_restart
cd 
git clone git://git.drogon.net/wiringPi
cd /home/pi/wiringPi
./build
sudo apt-get remove nodered -y
sudo apt-get remove nodejs -y
cd /home/pi
curl -L https://git.io/n-install | N_PREFIX=/home/pi/n bash -s -- -y 6.10.2
. /home/pi/.bashrc
node -v
n=$(which node); n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
sudo node -v
cd /home/pi/share
git clone -b start https://github.com/PGallagher69/NottsDevIoTHub.git
cd /home/pi/share/NottsDevIoTHub
npm install
read -n 1 -s -r -p "Press any key to finish"