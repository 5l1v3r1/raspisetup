#!/bin/bash
#Once gerekliler
echo "[Desktop Entry]
Name=Byobu Terminal
Comment=Advanced Command Line and Text Window Manager
Icon=byobu
Exec=byobu-launcher
Type=Application
Terminal=true
Categories=GNOME;GTK;Utility;
X-GNOME-Gettext-Domain=byobu
" >> /usr/share/applications/byobu.desktop
chmod 666 /usr/share/applications/byobu.desktop

read -p "[?] Update and install apt? [E/h]" CEVAP
if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
  apt-get update
  apt-get -y install libcurl4-openssl-dev libssl-dev zlib1g-dev libpcap-dev tshark reaver bully cowpatty pyrit python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libffi-dev file mc htop macchanger byobu
fi

read -p "[?] Download gits? [E/h]" CEVAP
if [[ "$CEVAP" == "E" || "$CEVAP" == "e" || "$CEVAP" == "" ]]; then
  git clone https://github.com/ZerBea/hcxdumptool.git
  git clone https://github.com/ZerBea/hcxtools.git
  git clone https://github.com/hashcat/hashcat.git
  git clone https://github.com/derv82/wifite2.git
  git clone https://github.com/byt3bl33d3r/MITMf
  git clone https://github.com/bettercap/caplets.git
fi

read -p "--- Yukleme hcxdumptool"
cd hcxdumptool
make
make install
cd /root
rm -rf hcxdumptool/

read -p "--- Yukleme hcxtools"
cd hcxtools
make
make install
cd /root
rm -rf hcxtools/

read -p "--- Yukleme hashcat"
cd hashcat
git submodule update --init
make
make install
cd /root
rm -rf hashcat/

read -p "--- Yukleme wifite2"
cd wifite2
python setup.py install
cd /root
rm -rf wifite2/

read -p "--- Yukleme wifite1"
wget https://raw.github.com/derv82/wifite/master/wifite.py -O wifite1.py
chmod +x wifite1.py
mv wifite1.py /usr/bin/wifite1
cd /root

read -p "--- Yukleme mitmf"
#mitmf baslangic
pip install virtualenvwrapper
echo "source /usr/local/bin/virtualenvwrapper.sh" >> /etc/bash.bashrc
mkvirtualenv MITMf -p /usr/bin/python2.7
cd /root/MITMf && git submodule init && git submodule update --recursive
pip install -r requirements.txt
cd /root

read -p "--- Yukleme bettercap2"
wget https://github.com$(curl -s $(curl -s https://github.com/bettercap/bettercap/releases/latest | awk -F\" '{ print $2 }') | grep -m 1 "bettercap_linux_arm7" |  awk -F\" '{ print $2 }')
unzip bettercap_linux_arm7_*
ln -s /lib/ld-linux-armhf.so.3 /lib/ld-linux.so.3
mv bettercap /usr/local/bin/bettercap
rm README.md LICENSE.md bettercap_linux_arm7_2.9.zip

read -p "--- Yukleme bettercap2 caplets"
cd caplets/
make install
cd /root

read -p "--- Yukleme beef-xss"
apt-get -y install beef-xss
