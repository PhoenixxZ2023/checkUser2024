#!/bin/bash

# Verificar se o proxy já está instalado
if [ -f /usr/lib/chall/chall.sh ]; then
    echo "O chall já está instalado. Ignorando a instalação."
else

[[ $(awk -F" " '{print $2}' /etc/licencec/telegram) == "@nandoslayer" ]] && {
IP=$(wget -qO- ipv4.icanhazip.com)
verif_ptrs() {
porta=$1
PT=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" | grep -v "COMMAND" | grep "LISTEN")
for pton in $(echo -e "$PT" | cut -d: -f2 | cut -d' ' -f1 | uniq); do
svcs=$(echo -e "$PT" | grep -w "$pton" | awk '{print $1}' | uniq)
[[ "$porta" = "$pton" ]] && {
echo -e "\n\033[1;31mPORTA \033[1;33m$porta \033[1;31mEM USO PELO \033[1;37m$svcs\033[0m"
sleep 3
fun_chuser
}
done
}
stop_install () {
echo ""
echo -e "\033[1;31mVoltando...\033[0m"
sleep 1
fun_chuser
}
stop_install2 () {
echo ""
echo -e "\033[1;31mSaindo...\033[0m"
sleep 1
exit 0
}
fun_bar() {
comando[0]="$1"
comando[1]="$2"
(
[[ -e $HOME/fim ]] && rm $HOME/fim
[[ ! -d /etc/SSHPlus ]] && rm -rf /bin/menu
${comando[0]} >/dev/null 2>&1
${comando[1]} >/dev/null 2>&1
touch $HOME/fim
) >/dev/null 2>&1 &
tput civis
echo -ne "\033[1;33mAGUARDE \033[1;37m- \033[1;33m["
while true; do
for ((i = 0; i < 18; i++)); do
echo -ne "\033[1;31m#"
sleep 0.1s
done
[[ -e $HOME/fim ]] && rm $HOME/fim && break
echo -e "\033[1;33m]"
sleep 1s
tput cuu1
tput dl1
echo -ne "\033[1;33mAGUARDE \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
clear
fun_chuser() {
clear
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;37m          GERENCIAR CHECKUSER            \E[0m"
echo -e "\E[44;1;37mVERSÃO 1.6                By @TURBONET2023\E[0m"
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
[[ $(netstat -nplt | grep -wc 'python3') != '0' ]] && {
sks='\033[1;32mON'
echo -e "\033[1;35mLink CONECTA4G \033[1;37mhttp://$IP:$(netstat -nplt | grep 'python3' | awk {'print $4'} | cut -d: -f2 | xargs)/checkUser"
echo ""
echo -e "\033[1;33mLink DTUNELL MOD http://$IP\033[1;37m:\033[1;32m$(netstat -nplt | grep 'python3' | awk {'print $4'} | cut -d: -f2 | xargs)"
echo ""
echo -e "\033[1;35mLink GLTUNNEL MOD \033[1;37mhttp://$IP:$(netstat -nplt | grep 'python3' | awk {'print $4'} | cut -d: -f2 | xargs)/gl"
echo ""
echo -e "\033[1;35mLink ANYVPN MOD \033[1;37mhttp://$IP:$(netstat -nplt | grep 'python3' | awk {'print $4'} | cut -d: -f2 | xargs)/anymod"
echo ""
} || {
sks='\033[1;31mOFF'
}
[[ $(screen -list | grep -wc 'checkgestor') != '0' ]] && var_check="\033[1;31mDESATIVAR" || var_check="\033[1;32mATIVAR"
echo ""
echo -e "\033[1;31m[\033[1;36m1\033[1;31m] \033[1;37m• $var_check CHECKUSER \033[0m"
echo -e "\033[1;31m[\033[1;36m2\033[1;31m] \033[1;37m• \033[1;31mREMOVER\033[0m"
echo -e "\033[1;31m[\033[1;36m0\033[1;31m] \033[1;37m• \033[1;33mVOLTAR\033[0m"
echo ""
echo -ne "\033[1;33mO QUE DESEJA FAZER \033[1;33m?\033[1;37m: "
read resposta
if [[ "$resposta" = '1' ]]; then
if ps x | grep -w checkgestor.py | grep -v grep 1>/dev/null 2>/dev/null; then
echo ""
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m         • \033[1;31mDESATIVANDO CHECKUSER\033[1;31m •     \033[0m"
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
fun_socksoff() {
for pidcheckgestor in $(screen -ls | grep ".checkgestor" | awk {'print $1'}); do
screen -r -S "$pidcheckgestor" -X quit
done
[[ $(grep -wc "checkgestor.py" /etc/autostart) != '0' ]] && {
sed -i '/checkgestor.py/d' /etc/autostart
}
sleep 1
screen -wipe >/dev/null
}
fun_bar 'fun_socksoff'
echo ""
echo -e "\033[1;31mCHECKUSER DESATIVADO COM SUCESSO!!!\033[1;33m"
sleep 3
fun_chuser
else
echo ""
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;34m          • \033[1;34mATIVANDO CHECKUSER\033[1;34m •     \033[0m"
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "\033[1;33mQUAL PORTA DESEJA ULTILIZAR \033[1;33m?\033[1;37m: "
read porta
[[ -z "$porta" ]] && {
echo ""
echo -e "\033[1;31mPorta inválida!"
sleep 3
clear
fun_chuser
}
verif_ptrs $porta
fun_inisocks() {
sleep 1
screen -dmS checkgestor python3 /usr/lib/checkgestor/checkgestor.py $porta;
[[ $(grep -wc "checkgestor" /etc/autostart) = '0' ]] && {
echo -e "netstat -tlpn | grep -w $porta > /dev/null || {  screen -r -S 'checkgestor' -X quit;  screen -dmS checkgestor python3 /usr/lib/checkgestor/checkgestor.py $porta; }" >>/etc/autostart
} || {
sed -i '/checkgestor/d' /etc/autostart
echo -e "netstat -tlpn | grep -w $porta > /dev/null || {  screen -r -S 'checkgestor' -X quit;  screen -dmS checkgestor python3 /usr/lib/checkgestor/checkgestor.py $porta; }" >>/etc/autostart
}
}
echo ""
fun_bar 'fun_inisocks'
echo ""
echo -e "\033[1;32mCHECKUSER ATIVADO COM SUCESSO!!!\033[1;33m"
sleep 3
fun_chuser
fi
elif [[ "$resposta" = '2' ]]; then
echo ""
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m     • \033[1;31mDESEJA REMOVER O CHECKUSER?\033[1;31m •     \033[0m"
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -ne "\033[1;33mCONTINUAR? [S/n]: \033[1;33m?:\033[1;37m "
read opcion
[[ "$opcion" != @(s|S) ]] && stop_install
echo ""
fun_socksoff() {
for pidcheckgestor in $(screen -ls | grep ".checkgestor" | awk {'print $1'}); do
screen -r -S "$pidcheckgestor" -X quit
done
[[ $(grep -wc "checkgestor.py" /etc/autostart) != '0' ]] && {
sed -i '/checkgestor.py/d' /etc/autostart
}
sleep 1
screen -wipe >/dev/null
}
fun_bar 'fun_socksoff'
echo ""
echo -e "\033[1;31mCHECKUSER REMOVIDO COM SUCESSO!!!\033[1;33m"
sleep 2
rm -rf /bin/chall /bin/checkgestor /usr/lib/checkgestor /etc/licencec > /dev/null 2>&1
echo ""
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "   \033[1;32m • \033[1;32mVOCÊ DESEJA INSTALAR NOVAMENTE!\033[1;32m • \033[0m"
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -ne "\033[1;33mCONTINUAR? [S/n]: \033[1;33m?:\033[1;37m "
read opcion2
[[ "$opcion2" != @(s|S) ]] && stop_install2
bash <(wget -qO- https://raw.githubusercontent.com/PhoenixxZ2023/checkUser2024/main/instcheck.sh)
exit 0
elif [[ "$resposta" = '0' ]]; then
echo ""
echo -e "\033[1;31mSaindo...\033[0m"
sleep 1
clear
exit
else
echo ""
echo -e "\033[1;31mOpção inválida!\033[0m"
sleep 1
fun_chuser
fi
}
fun_chuser
} || clear && echo -e "\E[41;1;37m         VOCÊ NÃO TEM PERMISSÃO!!!       \E[0m" && sleep 4 && exit 0
