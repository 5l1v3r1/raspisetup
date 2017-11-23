#---Henüz Tamamlanmadı---
apt-get -y install screen
screen -dmS guncelleme
screen -S murat -X stuff "apt-get -y install gparted tightvncserver ifplugd \napt-get -y update \napt-get -y upgrade \napt-get -y install mitmf \n"

systemctl stop network-manager && systemctl disable network-manager
#vncserver :1

#nano /etc/network/interfaces
echo "allow-hotplug wlan0" >> /etc/network/interfaces
echo "iface wlan0 inet dhcp" >> /etc/network/interfaces
echo "wpa-conf /etc/wpa_supplicant.conf" >> /etc/network/interfaces

# Bluetooth Çalıştırmak İçin
git clone https://github.com/Re4son/re4son-kernel-builder.git
cd re4son-kernel-builder
./install.sh

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

# MOTD Değiştirme
sed -i "s/PrintLastLog yes/PrintLastLog no/g" /etc/ssh/sshd_config
echo > /etc/motd
wget motdpi
mv motdpi > /etc/motdpi
echo "bash /etc/motdpi" /etc/profile
