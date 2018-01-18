Sets up a Raspberry Pi for the Notts Dev IoT Workshop.

This script;

- Updates the repos etc
- Flashes to kernel 4.4.y - Which is a compatible version of kernel.
- Installs Samba and creates a shared folder called "share" in the /home/pi directory.
- Uninstalls Node Red.
- Uninstalls Node Legacy.
- Installs and Builds WiringPi
- Installs Node Version Manager and enables Sudo Usage
- Downloads and installs the Workshop Code

To use this script;

- Clone the Repo using - git clone https://github.com/PGallagher69/NottsDevIoTHubSetup.git 
- Enter the Setup Directory - cd NottsDevIoTHubSetup
- Make the Install.sh file executable - chmod +x install.sh
- Run the installation - sudo ./install.sh
