#!/bin/sh

sudo apt-get update
sudo rpi-update 52241088c1da59a359110d39c1875cda56496764
sudo apt-get install samba samba-common-bin -y
printf "raspberry\nraspberry\n" | smbpasswd -a -s pi
mkdir /home/pi/share
#sudo nano /etc/samba/smb.conf
cat SambaShare.txt >> /etc/samba/smb.conf
sudo service smb restart
cd /home/pi
#git clone git://git.drogon.net/wiringPi /home/pi/wiringPi
git clone https://github.com/WiringPi/WiringPi.git /home/pi/wiringPi
cd /home/pi/wiringPi
./build
sudo apt-get remove nodered -y
sudo apt-get remove nodejs -y
cd /home/pi
curl -L https://git.io/n-install | N_PREFIX=/home/pi/n bash -s -- -y 6.10.2
n=$(which node); n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
read -p "Press any key to Reboot... You must run 'sudo . /02_AfterReboot.sh' after the reboot!" -n1 -s
sudo reboot