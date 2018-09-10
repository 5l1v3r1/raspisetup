# --- Bu proje henüz deneme aşamasındadır! ---

# raspisetup
TR: Raspberry Pi3 için ilk kurulum işlemlerini hızlandırma scripti.

EN: Configuration script for speed things up on my own Raspberry Pi3 at first install.

# Installation

    git clone https://github.com/muratcesmecioglu/raspisetup.git
    cd raspisetup
    chmod +x expand-rootfs.sh
    chmod +x setup.sh
    ./expand-rootfs.sh
    reboot
    ./setup.sh

# DNS Ekleme
    /etc/dhcp/dhclient.conf
    
# Sıcaklık
    /opt/vc/bin/vcgencmd measure_temp | cut -c "6-9")ºC
