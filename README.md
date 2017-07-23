# raspi
Raspberry Pi3

# komutlar
apt-get update

apt-get -y install screen

screen

apt-get -y upgrade

apt-get -y install gparted tightvncserver ifplugd

nano /etc/network/interfaces

Altına Ekle
```
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant.conf
```

wget wifi.sh
wget motdpi
mv motdpi > /etc

echo > /etc/motd

rc.locale motdpi'yi ekle

