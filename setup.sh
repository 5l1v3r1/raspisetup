#!/bin/sh
#---Henüz Tamamlanmadı---
#screen -dmS guncelleme
#screen -S guncelleme -X stuff "apt-get -y install gparted tightvncserver \n"
apt-get update
apt-get -y install screen tightvncserver

#systemctl stop network-manager && systemctl disable network-manager

#VNC şifresini ayarlar
vncpasswd -f <<< "123456" > /root/.vnc/passwd 
echo "VNC Server şifresi ayarlandi: 123456"
read -p "Devam etmek icin bir tusa basin"


#Bu bölüm başlangıçta otomatik wifi ağına bağlanmayı sağlıyor
echo "allow-hotplug wlan0" >> /etc/network/interfaces
echo "iface wlan0 inet dhcp" >> /etc/network/interfaces
echo "wpa-conf /etc/wpa_supplicant.conf" >> /etc/network/interfaces
echo "Wifi otomatik baglanmak icin ayarlandi"
read -p "Devam etmek icin bir tusa basin"

# Bluetooth Çalıştırmak İçin
#git clone https://github.com/Re4son/re4son-kernel-builder.git
#cd re4son-kernel-builder
#./install.sh

# Bluetooth Üzerinden SSH Bağlantısı İçin
#nano /lib/systemd/system/bluetooth.service
# Bul -> Değiştir
# ExecStart=/usr/libexec/bluetooth/bluetoothd -C

#### Deneme yap:
# sed -i 's/original/new/g' /lib/systemd/system/bluetooth.service



#Servisleri yukle
#cp bluetooth.service /etc/systemd/system/bluetooth.service
#cp rfcomm.service /etc/systemd/system/rfcomm.service
cp vncserver.service /etc/systemd/system/vncserver.service

# MOTD Değiştirme
sed -i "s/PrintLastLog yes/PrintLastLog no/g" /etc/ssh/sshd_config
echo > /etc/motd
mv motdpi /etc/motdpi
echo "bash /etc/motdpi" >> /etc/profile

# scriptleri ayarlar
cp wifi /usr/bin/wifi
cp wifioff /usr/bin/wifioff
cp yardim /usr/bin/yardim
chmod +x /usr/bin/wifi
chmod +x /usr/bin/wifioff
chmod +x /usr/bin/yardim

#Masaustunu kapatma
#systemctl disable ligthdm

#TEST ICIN KAPATILDI
#screen -dmS guncelleme
#screen -S guncelleme -X stuff "apt-get -y update \napt-get -y upgrade \n"
#read -p "Arkaplanda guncelleme yapiliyor"
