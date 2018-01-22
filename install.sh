#!/bin/bash

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            01 OF 25                 *"
echo -e "\e[32m*            UPDATING                 *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo apt-get update

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            02 OF 25                 *"
echo -e "\e[32m*        FLASHING FIRMWARE            *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo rpi-update 52241088c1da59a359110d39c1875cda56496764

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            03 OF 25                 *"
echo -e "\e[32m*         INSTALLING SAMBA            *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo apt-get install samba samba-common-bin -y

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            04 OF 25                 *"
echo -e "\e[32m*      SETTING SAMBA PASSWORD         *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

printf "raspberry\nraspberry\n" | smbpasswd -a -s pi

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            05 OF 25                 *"
echo -e "\e[32m*      CREATING SHARE DIRECTORY       *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

mkdir /home/pi/share

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            06 OF 25                 *"
echo -e "\e[32m*       ADDING SHARE CONFIG           *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

cat SambaShare.txt >> /etc/samba/smb.conf

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            07 OF 25                 *"
echo -e "\e[32m*      RESTART SAMBA SERVICE          *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo systemctl restart smbd

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            08 OF 25                 *"
echo -e "\e[32m*        SETTING DIRECTORY            *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

cd /home/pi
#git clone git://git.drogon.net/wiringPi /home/pi/wiringPi

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            09 OF 25                 *"
echo -e "\e[32m*        GETTING WIRINGPI             *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

git clone https://github.com/WiringPi/WiringPi.git /home/pi/wiringPi

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            10 OF 25                 *"
echo -e "\e[32m*       SETTING DIRECTORY             *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

cd /home/pi/wiringPi

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            11 OF 25                 *"
echo -e "\e[32m*       BUILDING WIRING PI            *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

./build

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            12 OF 25                 *"
echo -e "\e[32m*        REMOVING NODERED             *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo apt-get remove nodered -y

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            13 OF 25                 *"
echo -e "\e[32m*      REMOVING LEGACY NODE           *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo apt-get remove nodejs -y

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            14 OF 25                 *"
echo -e "\e[32m*        SETTING DIRECTORY            *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

cd /home/pi

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            15 OF 25                 *"
echo -e "\e[32m*  INSTALLING NODE VERSION MANAGER    *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

curl -L https://git.io/n-install | N_PREFIX=/home/pi/n bash -s -- -y 6.10.2

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            16 OF 25                 *"
echo -e "\e[32m*      RESTARTING TERMINAL            *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

. /home/pi/.bashrc

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            17 OF 25                 *"
echo -e "\e[32m*      INSTALLING SUDO NODE           *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo chmod -R 755 /home/pi/n/bin/*; sudo cp -r /home/pi/n/{bin,lib,share} /usr/local

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            18 OF 25                 *"
echo -e "\e[32m*   CHECKING NODE VERSION FOR PI      *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

node -v

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            19 OF 25                 *"
echo -e "\e[32m*  CHECKING NODE VERSION FOR ROOT     *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo node -v

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*           20 OF 25                 *"
echo -e "\e[32m*       SETTING DIRECTORY             *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

cd /home/pi/share

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            21 OF 25                 *"
echo -e "\e[32m* GETTING WORKSHOP CODE FROM GITHUB   *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

git clone -b start https://github.com/PGallagher69/NottsDevIoTHub.git /home/pi/share/NottsDevIoTHub

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            22 OF 25                 *"
echo -e "\e[32m*       SETTING DIRECTORY             *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

cd /home/pi/share/NottsDevIoTHub

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            23 OF 25                 *"
echo -e "\e[32m*   INSTALLING WORKSHOP PACKAGES      *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

npm install

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            24 OF 25                 *"
echo -e "\e[32m*      SETTING FILE OWNERSHOP         *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo chown -R pi /home/pi/share

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*            25 OF 25                 *"
echo -e "\e[32m*     SETTING FILE PERMISSIONS        *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

sudo chmod -R 777 /home/pi/share

echo -e "\n"
echo -e "\e[32m***************************************"
echo -e "\e[32m*                                     *"
echo -e "\e[32m*           COMPLETE!!!               *"
echo -e "\e[32m*                                     *"
echo -e "\e[32m***************************************"
echo -e "\e[0m\n"

read -p "Press any key to Reboot!" -n1 -s

sudo reboot
