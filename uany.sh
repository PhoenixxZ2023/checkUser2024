#!/bin/bash
IP=$(wget -qO- ipv4.icanhazip.com)
verif_ptrs() {
		porta=$1
		PT=$(lsof -V -i tcp -P -n | grep -v "ESTABLISHED" | grep -v "COMMAND" | grep "LISTEN")
		for pton in $(echo -e "$PT" | cut -d: -f2 | cut -d' ' -f1 | uniq); do
			svcs=$(echo -e "$PT" | grep -w "$pton" | awk '{print $1}' | uniq)
			[[ "$porta" = "$pton" ]] && {
				echo -e "\n\033[1;31mPORTA \033[1;33m$porta \033[1;31mEM USO PELO \033[1;37m$svcs\033[0m"
				sleep 3
				fun_userany
			}
		done
	}
fun_bar() {
		comando[0]="$1"
		comando[1]="$2"
		(
			[[ -e $HOME/fim ]] && rm $HOME/fim
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
fun_userany() {
    clear
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
    echo -e "\E[44;1;37m       GERENCIAR CHECKUSER ANYVPN        \E[0m"
echo -e "\033[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    [[ $(screen -list | grep -wc 'checkuserany') != '0' ]] && {
	port=$(cat /etc/anych/porta)
			echo -e "\033[1;33mLink para o app http://$IP\033[1;37m:\033[1;32m$port/checkuserany"
			echo ""
		} || {
			echo ""
			echo ""
		}
    echo ""
	[[ $(screen -list | grep -wc 'checkuserany') != '0' ]] && {
	echo -e "\033[1;31m[\033[1;36m1\033[1;31m] \033[1;37m• \033[1;31mDESATIVAR CHECKUSER\033[0m"
	} || {
    echo -e "\033[1;31m[\033[1;36m1\033[1;31m] \033[1;37m• \033[1;32mATIVAR CHECKUSER\033[0m"
	}
    echo -e "\033[1;31m[\033[1;36m0\033[1;31m] \033[1;37m• \033[1;33mVOLTAR\033[0m"
    echo ""
    echo -ne "\033[1;32mO QUE DESEJA FAZER \033[1;33m?\033[1;37m "
    read resposta
    if [[ "$resposta" = '1' ]]; then
	if ps x | grep -w checkuserany | grep -v grep 1>/dev/null 2>/dev/null; then
				clear
				echo -e "\E[41;1;37m             CHECKUSER ANYVPN              \E[0m"
				echo ""
				fun_socksoff() {
					for pidcheckuserany in $(screen -ls | grep "checkuserany" | awk {'print $1'}); do
						screen -r -S "$pidcheckuserany" -X quit
					done
					[[ $(grep -wc "checkuserany" /etc/autostart) != '0' ]] && {
						sed -i '/checkuserany/d' /etc/autostart
					}
					sleep 1
					screen -wipe >/dev/null
				}
				echo -e "\033[1;32mDESATIVANDO CHECKUSER ANYVPN...\033[1;33m"
				echo ""
				fun_bar 'fun_socksoff'
				echo ""
				echo -e "\033[1;32mCHECKUSER ANYVPN DESATIVADO!\033[1;33m"
				sleep 3
				fun_userany
			else
				clear
				echo -e "\E[44;1;37m             CHECKUSER ANYVPN             \E[0m"
				echo ""
				echo -ne "\033[1;32mQUAL PORTA DESEJA ULTILIZAR? \033[1;33m?\033[1;37m: "
				read porta
				[[ -z "$porta" ]] && {
					echo ""
					echo -e "\033[1;31mPorta inválida!"
					sleep 3
					clear
					fun_userany
				}
				verif_ptrs $porta
				fun_inisocks() {
					sleep 1
					screen -dmS checkuserany python3 /etc/anych/checkuserany $porta;
					[[ $(grep -wc "checkuserany" /etc/autostart) = '0' ]] && {
						echo -e "netstat -tlpn | grep -w $porta > /dev/null || {  screen -r -S 'checkuserany' -X quit;  screen -dmS checkuserany python3 /etc/anych/checkuserany $porta; }" >>/etc/autostart
						echo $porta > /etc/anych/porta
					} || {
						sed -i '/checkuserany/d' /etc/autostart
						echo -e "netstat -tlpn | grep -w $porta > /dev/null || {  screen -r -S 'checkuserany' -X quit;  screen -dmS checkuserany python3 /etc/anych/checkuserany $porta; }" >>/etc/autostart
						echo $porta > /etc/anych/porta
					}
				}
				echo ""
				echo -e "\033[1;32mINICIANDO O CHECKUSER ANYVPN...\033[1;33m"
				echo ""
				fun_bar 'fun_inisocks'
				echo ""
				echo -e "\033[1;32mCHECKUSER ANYVPN ATIVADO!\033[1;33m"
				sleep 3
				fun_userany
			fi
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
        fun_userany
    fi
}
fun_userany
