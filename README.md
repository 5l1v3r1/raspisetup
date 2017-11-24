# raspisetup
TR: Raspberry Pi3 için ilk kurulum işlemlerini hızlandırma scripti.

EN: Configuration script for speed things up on my own Raspberry Pi3 at first install.

# Installation

    git clone https://github.com/muratcesmecioglu/raspisetup.git
    cd raspisetup
    dpkg -i raspi-config_20121028_all.deb 
    raspi-config --expand-rootfs

Expand the file system, then run setup.sh

    ./setup.sh
