#!/bin/bash
#---Henuz Tamamlanmadi---

read -p "[?] Kali-setup? [E/h]" CEVAP
if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
        bash kali-setup.sh
fi

#Baska yere koymayin
cd /root/raspisetup

#screen -dmS guncelleme
#screen -S guncelleme -X stuff "apt-get -y install gparted tightvncserver \n"
echo "-------------------------------------"
echo "Ilk guncelleme ve programlar yukleniyor"
echo "-------------------------------------"
#apt-get update
#apt-get -y install screen tightvncserver
#
#vncserver 2018.3 ile geliyor. screen yerine byobu kullanilacak. Oncesinde programlar yuklenecekse update yapilmis olacak, gerek yok.
#
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
cp motdpi /etc/motdpi
echo "bash /etc/motdpi" >> /etc/profile
echo "-------------------------------------"
echo "MOTD guncellendi"
read -p "Devam etmek icin bir tusa basin"

# scriptleri ayarlama
cp wifi /usr/bin/wifi
cp wifioff /usr/bin/wifioff
cp cls /usr/bin/cls
cp raspi-ip /usr/bin/raspi-ip
chmod +x /usr/bin/wifi
chmod +x /usr/bin/wifioff
chmod +x /usr/bin/cls
chmod +x /usr/bin/raspi-ip
echo "alias ls='ls --color'" >> /etc/profile
echo "-------------------------------------"
echo "Yardimci komutlar yuklendi"
read -p "Devam etmek icin bir tusa basin"

#Servis ayarlarini yap
#systemctl disable ligthdm
systemctl enable bluetooth
systemctl start bluetooth
systemctl enable pan
systemctl start pan
echo "-------------------------------------"
echo "Servis ayarlari yapildi"
read -p "Devam etmek icin bir tusa basin"

#Upgrade yapmamak daha mantikli sanki (2018.3)
#read -p "Arkaplanda guncelleme yapilsin mi? [E/h]" CEVAP
#if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
        #screen -dmS guncelleme
        #screen -S guncelleme -X stuff "apt-get -y update \napt-get -y upgrade \n"
        #echo "-------------------------------------"
        #echo "Arkaplanda guncelleme yapiliyor, kontrol etmeyi unutma"
        #read -p "Devam etmek icin bir tusa basin"
#fi

read -p "Bluetooth cihazi eklenecek mi? [E/h]" CEVAP
if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
        bluetoothctl agent on
        bluetoothctl discoverable on
        bluetoothctl pairable on
        echo ""
        echo "[!] Baglanmak istediginiz cihaz bulununca CTRL+C 'ye basin"
        echo ""
        bluetoothctl scan on
        read -p "Bluetooth cihazi MAC adresi: " BTMAC
        bluetoothctl info $BTMAC
        bluetoothctl pair $BTMAC
        bluetoothctl trust $BTMAC
fi

cls
cls -h


