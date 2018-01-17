sudo apt-get update
sudo rpi-update 52241088c1da59a359110d39c1875cda56496764
sudo apt-get install samba samba-common-bin -y
(echo raspberry; echo raspberry) | smbpasswd -s -a pi
mkdir ~/share
#sudo nano /etc/samba/smb.conf
cat SambaShare.txt >> /etc/samba/smb.conf
cd ~/
git clone git://git.drogon.net/wiringPi
cd wiringPi
./build
sudo apt-get remove nodered -y
sudo apt-get remove nodejs -y
cd ~/
curl -L https://git.io/n-install | bash -s -- -y 6.10.2
node -v
n=$(which node); n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
sudo node -v
cd ~/share
git clone -b start https://github.com/PGallagher69/NottsDevIoTHub.git
cd NottsDevIoTHub
npm install
sudo reboot