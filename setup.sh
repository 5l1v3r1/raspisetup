#---Henüz Tamamlanmadı---
apt-get -y install screen
screen -dmS guncelleme
screen -S guncelleme -X stuff "apt-get -y install gparted tightvncserver \napt-get -y install mitmf \n"
# 2017.3 versiyonunda ifplugd programına gerek yok sanırım??
# en baştan update ve upgrade yapmaya gerek yok gibi??


systemctl stop network-manager && systemctl disable network-manager
#vncserver :1

#nano /etc/network/interfaces
echo "allow-hotplug wlan0" >> /etc/network/interfaces
echo "iface wlan0 inet dhcp" >> /etc/network/interfaces
echo "wpa-conf /etc/wpa_supplicant.conf" >> /etc/network/interfaces

# Bluetooth Çalıştırmak İçin
#git clone https://github.com/Re4son/re4son-kernel-builder.git
#cd re4son-kernel-builder
#./install.sh

# Bluetooth Üzerinden SSH Bağlantısı İçin
nano /lib/systemd/system/bluetooth.service
# Bul -> Değiştir
# ExecStart=/usr/libexec/bluetooth/bluetoothd -C

#### Deneme yap:
# sed -i 's/original/new/g' /lib/systemd/system/bluetooth.service

#### Lazım bir komut :)
#rfcomm watch hci0 1 getty rfcomm0 115200 vt100 -a root

#Servisler
cp bluetooth.service /etc/systemd/system/bluetooth.service
cp rfcomm.service /etc/systemd/system/rfcomm.service
cp vncserver.service /etc/systemd/system/vncserver.service

# MOTD Değiştirme
sed -i "s/PrintLastLog yes/PrintLastLog no/g" /etc/ssh/sshd_config
echo > /etc/motd
wget motdpi
mv motdpi > /etc/motdpi
echo "bash /etc/motdpi" /etc/profile

#---------------
# fdisk -l /dev/mmcblk0 | grep "Disk /dev/mmcblk0" | cut -d" " -f7

