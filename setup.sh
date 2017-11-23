#---Henüz Tamamlanmadı---

apt-get update
apt-get -y install screen
screen
apt-get -y upgrade
systemctl stop network-manager && systemctl disable network-manager
apt-get -y install gparted tightvncserver ifplugd
#vncserver :1

dpkg -i raspi-config_20121028_all.deb 
raspi-config --expand-rootfs

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
ExecStart=/usr/libexec/bluetooth/bluetoothd -C

#### Deneme:
sed -i 's/original/new/g' /lib/systemd/system/bluetooth.service

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

# Programları Yükleme
apt-get -y install mitmf
