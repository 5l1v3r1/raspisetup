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

shutdown dhc
dhclient -r
#shutdown wpa_supplicant
killall wpa_supplicant
#down interface
ifdown --force wlan0
sleep 1
#your wpa startup here:
wpa_supplicant -t -fYOUR_LOG_FILE -cYOUR_wpa_supplicant.conf -B -iwlan0
sleep 1
#restart dhc
dhclient -nw
