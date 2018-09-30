#!/bin/bash
if [ "$1" == "" ];
then echo "$(tput sgr 0 1)$(tput bold)$(tput setaf 3)Commands$(tput sgr0)
$(tput setaf 3)
Connect wifi            -> wifi \"SSID\" \"Password\"
Disconnect wifi         -> wifioff
Scan wifi               -> wifiscan
Run service             -> service [SERVICE] start|stop
Start service on boot   -> systemctl enable|disable [SERVICE]
Set|Remove boot IP      -> raspi-ip [IP]

$(tput sgr 0 1)$(tput bold)$(tput setaf 3)Services$(tput sgr0)"

if (( $(ps -ef | grep -v grep | grep vncserver | wc -l) > 0 )); then echo "vncserver   : $(tput setaf 2)On$(tput sgr0)" ;else echo "vncserver   : $(tput setaf 1)Off$(tput sgr0)";fi
if (( $(ps -ef | grep -v grep | grep lightdm | wc -l) > 0 )); then   echo "lightdm     : $(tput setaf 2)On$(tput sgr0)" ;else echo "lightdm     : $(tput setaf 1)Off$(tput sgr0)";fi
if (( $(ps -ef | grep -v grep | grep bluetooth | wc -l) > 0 )); then echo "bluetooth   : $(tput setaf 2)On$(tput sgr0)" ;else echo "bluetooth   : $(tput setaf 1)Off$(tput sgr0)";fi
if (( $(ps -ef | grep -v grep | grep pan | wc -l) > 0 )); then       echo "pan         : $(tput setaf 2)On$(tput sgr0)" ;else echo "pan         : $(tput setaf 1)Off$(tput sgr0)";fi

elif [ "$1" == "-h" ];
then echo "$(tput sgr 0 1)$(tput bold)$(tput setaf 2)Hacking$(tput sgr0)
$(tput setaf 2)
mitmf.py...
$(tput sgr0)"
fi
