#!/bin/bash
#---Henuz Tamamlanmadi---
#screen -dmS guncelleme
#screen -S guncelleme -X stuff "apt-get -y install gparted tightvncserver \n"
echo "-------------------------------------"
echo "Ilk guncelleme ve programlar yukleniyor"
echo "-------------------------------------"
apt-get update
apt-get -y install screen tightvncserver
echo "-------------------------------------"
echo "Programlar yuklendi"
read -p "Devam etmek icin bir tusa basin"

#VNC sifresini ayarlar
mkdir /root/.vnc/
#touch /root/.vnc/passwd
#vncpasswd -f <<< "123456" > /root/.vnc/passwd
cp passwd /root/.vnc/passwd
echo "-------------------------------------"
echo "VNC Server sifresi ayarlandi: 123456"
read -p "Devam etmek icin bir tusa basin"


#Bu bolum baslangicta otomatik wifi agina baglanmayi sagliyor
echo "allow-hotplug wlan0" >> /etc/network/interfaces
echo "iface wlan0 inet dhcp" >> /etc/network/interfaces
echo "wpa-conf /etc/wpa_supplicant.conf" >> /etc/network/interfaces
echo "-------------------------------------"
echo "Wifi otomatik baglanmak icin ayarlandi"
read -p "Devam etmek icin bir tusa basin"


#------------------------------------------
# Bluetooth ile SSH baglantisi icin AP kurulumu
if [ -f /usr/local/sbin/bt-pan ]; then
        echo "Bluetooth PAN Yuklu!"
fi
read -p "Bluetooth PAN yuklensin mi? [E/h]" CEVAP
if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
        bash panfiles/bt-pan-ap-install
fi


#Servisleri yukle
cp vncserver.service /etc/systemd/system/vncserver.service
echo "-------------------------------------"
echo "Servis ayar dosyalari yuklendi"
read -p "Devam etmek icin bir tusa basin"


# MOTD Degistirme
sed -i "s/PrintLastLog yes/PrintLastLog no/g" /etc/ssh/sshd_config
echo > /etc/motd
mv motdpi /etc/motdpi
echo "bash /etc/motdpi" >> /etc/profile
echo "-------------------------------------"
echo "MOTD guncellendi"
read -p "Devam etmek icin bir tusa basin"

# scriptleri ayarlama
cp wifi /usr/bin/wifi
cp wifioff /usr/bin/wifioff
cp cls /usr/bin/cls
chmod +x /usr/bin/wifi
chmod +x /usr/bin/wifioff
chmod +x /usr/bin/cls
echo "alias ls='ls --color'" >> /etc/profile
echo "-------------------------------------"
echo "Yardimci komutlar yuklendi"
read -p "Devam etmek icin bir tusa basin"

#Servis ayarlarini yap
#systemctl disable ligthdm
echo "-------------------------------------"
echo "Servis ayarlari yapildi"
read -p "Devam etmek icin bir tusa basin"

read -p "Arkaplanda guncelleme yapilsin mi? [E/h]" CEVAP
if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
        screen -dmS guncelleme
        screen -S guncelleme -X stuff "apt-get -y update \napt-get -y upgrade \n"
        echo "-------------------------------------"
        echo "Arkaplanda guncelleme yapiliyor, kontrol etmeyi unutma"
        read -p "Devam etmek icin bir tusa basin"
fi


cls
cls -h
