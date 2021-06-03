#! /bin/bash
clear
printf '\033]2;INSTALLER\a'
echo -e "Press \e[1;33many key\e[0m to install the script..."
read -n 1
clear
apt-get -y install gnome-terminal
clear
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [[ "$DIR" != "/root/gscript" ]]
then
	sleep 2
	if [[ -d /root/gscript ]]
	then
		rm -r /root/gscript
	fi
	mkdir /root/gscript
	cp -r "$DIR"/* /root/gscript
	chmod +x /root/gscript/install.sh
	#gnome-terminal -- /root/gscript/install.sh
fi
echo -e "Installing gscript..."
sleep 1
#echo -e "Fixing permissions"
sleep 2
clear
echo -e "Copying script to /bin/gscript"
sleep 1
mkdir /bin/gscript
cd /root/gscript
cp /root/gscript/gscript.sh /bin/gscript
clear
#required for gui
apt-get -y install ncurses-dev
clear
if [[ ! -d /root/handshakes ]]
then
	mkdir /root/handshakes
	echo -e "Made /root/handshake directory"
else
	echo -e "/root/handshakes directory detected.Good."
fi
if [[ ! -d /root/wordlists ]]
then
	mkdir /root/wordlists
	echo -e "\n\nMade /root/wordlists directory"
	sleep 1
else
	echo -e "\n\n/root/wordlists directory detected.Good."
	sleep 1
fi
	echo -e "\n\nAdding gscript to PATH so you can access it from anywhere"
	sleep 1
	sleep 1
	clear
	break
clear
echo -e "\nAlmost...\nDONE."
sleep 1
echo -e "\n\nOpen a NEW terminal and type 'g' to launch the script"
echo "alias g="/bin/gscript/gscript.sh"" >> $HOME/.bashrc
sleep  2
gnome-terminal -- /root/The_Lola_Script/Gscript/gscript.sh
exit