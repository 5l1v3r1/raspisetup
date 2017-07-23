# raspi
Raspberry Pi3

# Kurulum
apt-get update

apt-get -y install screen

screen

apt-get -y upgrade

apt-get -y install gparted tightvncserver ifplugd

###### # NC ile bağlanıp diski genişlet

vncserver :1

##### # Ethernet Kablosuz Wifi Bağlantısı İçin

nano /etc/network/interfaces

Altına Ekle

```
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant.conf
```

###### # Bluetooth Çalıştırmak İçin

git clone https://github.com/Re4son/re4son-kernel-builder.git

cd re4son-kernel-builder

./install.sh

###### # Bluetooth Üzerinden SSH Bağlantısı İçin

nano /lib/systemd/system/bluetooth.service

\# Bul -> Değiştir

```
ExecStart=/usr/libexec/bluetooth/bluetoothd -C
```
rfcomm watch hci0 1 getty rfcomm0 115200 vt100 -a root

[ ] Servis dosyası eklenecek

###### # MOTD Değiştirme

echo > /etc/motd





nano /etc/ssh/sshd_config

/#Bul -> Değiştir

```
PrintLastLog no
```

wget motdpi

mv motdpi > /etc/motdpi



rc.locale motdpi'yi ekle
 
###### # Scriptleri İndirme

wget wifi.sh


