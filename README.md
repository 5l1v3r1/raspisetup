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

nano /lib/systemd/system/bluetooth.service

Bul -> Değiştir

```
ExecStart=/usr/libexec/bluetooth/bluetoothd **-C**
```

wget wifi.sh

wget motdpi

mv motdpi > /etc

echo > /etc/motd

rc.locale motdpi'yi ekle

git clone https://github.com/Re4son/re4son-kernel-builder.git

cd re4son-kernel-builder

./install.sh

n

y

y


