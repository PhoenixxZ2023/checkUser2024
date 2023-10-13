#!/bin/bash
clear
rm instany* > /dev/null 2>&1
sitedwn=https://github.com/PhoenixxZ2023/checkUser2024
echo "America/Sao_Paulo" > /etc/timezone
ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime > /dev/null 2>&1
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1
clear
echo -e "\E[44;1;37m    INSTALAR CHECKUSER ANYVPN     \E[0m" 
echo ""
echo -e "                 \033[1;31mBy t.me/paineis\033[1;36m"
echo ""
echo -ne "\n\033[1;32mDE UM ENTER PARA \033[1;33mCONTINUAR...\033[1;37m: "; read -r
clear
echo -e "\n\033[1;36mINICIANDO INSTALAÇÃO \033[1;33mAGUARDE..."
apt-get install figlet -y > /dev/null 2>&1
pip3 install flask > /dev/null 2>&1
[[ ! -d /etc/anych ]] && mkdir /etc/anych
sleep 5
cd /bin || exit 
wget https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/uany > /dev/null 2>&1
wget https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/checkuserany.py -O /etc/anych/checkuserany > /dev/null 2>&1
wget https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/checkanyu.sh -O /etc/anych/checkanyu > /dev/null 2>&1
chmod 777 /bin/uany > /dev/null 2>&1
chmod 777 -R /etc/anych > /dev/null 2>&1
clear
echo -e "        \033[1;33m • \033[1;32mINSTALAÇÃO CONCLUÍDA\033[1;33m • \033[0m"
sleep 2
clear
echo ""
echo -e "\033[1;31m \033[1;33mCOMANDO: \033[1;32muany\033[0m"
echo ""
echo -e "\033[1;33m MAIS INFORMAÇÕES \033[1;31m(\033[1;36mTELEGRAM\033[1;31m): \033[1;37mt.me/TURBONET2023\033[0m"
cat /dev/null > ~/.bash_history && history -c
exit;
