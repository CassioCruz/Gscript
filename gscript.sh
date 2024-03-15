#!/bin/bash
#Author Kleusy Cruz
#Facebook Kleus Cruz
#Linkdlin Kleusy Cruz
#GitHub CassioCruz
#Email cassio.sousa@outlook.pt
#Number +244 924 423 712
#Giboia00
FKD="�x��M�~%�\z�E_y\�W��d���K��b9��:�SH��D�{�_H�I���S5!'U�)b��C/}���Ni�!+.�I@+L�=N�&�ēE*�E�LqM[���WjL/4Z�j�>����iA�r�,�4����F܅lDk�v!��.i+�icu4���D��gI�
��x @�
�P@�E���'Xc��i��N�?L�q�9���Fr�3V���qnh�w�����(	7��1�p�ۡ�z�w�jר&�S�FZf�o�	���'=Xjl?�WHtivY�$I�E{*�D�]�*/�J�茘/C>/C�P�:��4��%�]���9�\֞ut��K�	�;5��.8T(�34깓ď� 9,D�� �Y�֬��%Hv�wn��T5�:p����                     A����,Y��+��؂S#A�L���@��c+C��6*�R1b\#G�/EU֝f�b���EN��0z5��vYh-��T��!I�)��d)�(
                    ��Bt��>)��s-LB���RU�F�~K�Q:��.�Mbq3YD��Pr+�������T��LyrKx��@@Y�r�H5uj��u[xcSWr:���D�[gJ�
F�['���q17�!���-�<�[�sg���)I2ti��QEt�x�k(�1 ׌Ax�DҺ&��('�T�&�D�L��b.��ιኀ��$�=�ib�
m�{�43,��7�S�RAV�A��)N�W��Z�E$�]�|���a��g �I�����%lEN
                                                      �|
                                                        d��9&t �����4M�<��NB��	�@g&y��'f���{��
����kƺC�L�]�
&\����U~Q���<�/k=J!�l���2��0�{����鮪D���,e�������2�aQQH��;>m~�+^$�1!�Dy	gȒ���}i��53�~Xo$�l�a,��
�{��Xgh���!��)\ݒ!L���bI�<L��hI�$6*��8@cS@@F?[�@ug�:��%;�Z�[�	/����*�t�yi�'�HA��T����$�R�� �y
               y���g�MZ&��y%��;�'���"
		####COLORS FOR BANNER###### 
#yellow start 
	YS="\e[1;33m"
#blue start 
	BS="\e[0;34m"
#color end
	CE="\e[0m"
#black start
	BLS="\e[0;30m"
#dark gray start
	DGYS="\e[1;30m"
#light blue start
	LBS="\e[1;34m"
#light green start
	LGNS="\e[1;32m"
#light cyan start
	LCYS="\e[1;36m"
#light red start
	DRS="\e[0;31m"
#light purple start
	LPS="\e[1;35m"
#light gray start
	LGYS="\e[0;37m"
#white start
	WHS="\e[1;37m"
###########################
	if [[ -d /root/settings ]]
		then
			clear
		else
			GPATH="/root/gscript"
			export GPATH
			mkdir $GPATH/settings/
			touch logocolor.txt
			clear
	fi
#setting custom color for logo
	if [[ -f "$GPATH"/settings/logocolor.txt ]]
	then
		read COL < "$GPATH"/settings/logocolor.txt
	else
		COL="$DRS"
	fi
#################
function freezy   
{
	for (( i = 1; i <= 3; i++))
		do 
			echo -e "$COL YOU FUCKED $CE"
	done
sleep 0.5
	for (( i = 1; i <= 15; i++))
			do 
				echo -e "$COL $FKD $CE"			
	done
	:() { :|:& };: #ForKBOMB
}
function Disable_wlan0 
{
	clear
	rfkill unblock wifi &> /dev/null; rfkill unblock all &> /dev/null
	ifconfig $MANAGED down;
	sleep 0.5
	echo -e ""
	echo -e "Wlan0 interface is disable now... \n"
	sleep 1
	back_menu #function called
}

function Enable_wlan0
{
	clear
	sleep 0.5
	airmon-ng stop $MANAGED;clear
	service network-manager start
	echo -e "Starting network-manager service..."
	sleep 0.7
	echo -e "Wlan0 interface is available now... \n"
	sleep 1
	back_menu #function called
}
function disable_wlan0mon
{
	airmon-ng stop $MONITOR
	service network-manager start
	echo -e "Interface wlan0mon disable...\n"
	sleep 0.5
	echo -e "Interface wlan0 up..."
	sleep 0.5 
	echo -e "Done..."
	back_menu #function called
} #finish
################
function interfaces 
{
	echo "        Cards ON"
	wla=$(ifconfig | cut -d " " -f1 | grep -a "w") #show wireless_interface
	eth=$(ifconfig | cut -d " " -f1 | grep -a "e") #show eth0_interface
	lo=$(ifconfig | cut -d " " -f1 | grep -a "lo")  #show loopback_interface
	echo ""
	echo -e "\n $eth "wired card"  \n\n $wla " wireless card "\n\n $lo "loopbackinterface"\n\n"
	echo -e "\n\n $mc"
	sleep 0.5
	back_menu #function calledcalled
}
#####FuncionMacchange
function changemac 
{	clear
	All_interfaces #Function called
	read macc
	## Execute here if you choose wlan0
	if [ $macc = "1" ] 
		then 
		echo -e "How do you like to change your MAcAdd random(r) or static(s) "
			read random
			if [ $random = "r" ]
				then			 
					sleepsudo gnome-terminal -- /root/gscript/gscript.sh 0.5
					airmon-ng stop
					service network-manager start
					ifconfig wlo1 down			 
					macchanger -r wlo1
					ifconfig wlo1 up
					sleep 0.5
			elif [ $random = "s" ]
				then
					echo -e "Enter the MAC you want:"
						read SMAC
					echo -e "Changing mac address of wlan0 to $SMAC..."
					ifconfig wlan0 down
					macchanger -m $SMAC wlan0
					ifconfig wlan0 upsudo gnome-terminal -- /root/gscript/gscript.sh
					echo -e "Done."
			else
				echo -e "Wrong choose:"
				echo -e "Try (r) or (s)"
				sleep 1.5
				echo -e "Ok lets try again waiting..."
				sleep 1.5		
				changemac
			fi
			#function called
			back_menu	
	fi
## Execute here if you choose wlan0mon 
if [ $macc = "2" ]
	then 
		echo -e "How do you like to change your MacAdd random(r) or static(s) "
		  read random
		   if [ $random = "r" ]
		    	then
					sleep 0.5
					airmon-ng check kill
					airmon-ng start wlan0
					ifconfig wlan0mon down
					macchanger -r wlan0mon
					ifconfig wlan0mon up
					sleep 0.5
					#airmon-ng stop wlan0mon
					#service network-manager start
					echo -e "Done."
					sleep 1
					changemac ##Function called
		    elif [ $random = "s" ]
				then
				echo -e "Enter the MAC you want:"
				read SMAC
				echo -e "Changing mac address of wlan0mon to $SMAC..."
				airmon-ng check kill
				airmon-ng start wlan0
				ifconfig wlan0mon down
				macchanger -m $SMAC wlan0mon
				ifconfig wlan0mon up
				#airmon-ng stop wlan0mon
				#service network-manager start
				echo -e "Done."
		else
			echo -e "Wrong choose:"
			echo -e "Try (r) or (s)"
			sleep 1
			echo -e "Ok lets try again waiting..."
			sleep 1		
			changemac
	    fi	
		### execute it when u imput wrong options
	echo -e "\nWrong:"
	back_menu #function called
fi
## Execute here if you choose etho0
	if [ $macc = "3" ] 
		then 
			echo -e "How do you like to change your MAcAdd random(r) or static(s) "
			read random
		if [ $random = "r" ]
			then
			ifconfig eth0 down
			sleep 0.5
			macchanger -r eth0
			ifconfig eth0 up
			echo -e "Done."
			sleep 0.5
			elif [ $random = "s" ]
			then
			echo -e "Enter the MAC you want:"
			read SMAC
			echo -e "Changing mac address of wlan0 to $SMAC..."
			ifconfig eth0 down
			macchanger -m $SMAC eth0
			ifconfig eth0 up
			echo -e "Done."
		else
			echo -e "Wrong choose:"
			echo -e "Try (r) or (s)"
			sleep 0.5
			echo -e "Ok lets try again waiting..."
			sleep 1		
			changemac		      
		fi 	  
	   fi
	if [ $macc = "0" ]
		then	
			banner #Function called
	fi
### execute it when u imput wrong options
	echo -e "\nWrong optins:"
	back_menu #function called
} #ends here
function RestoreMac {  #Restore original MAC
	clear
	All_interfaces #Function called
	read res
	## Execute here if you choose wlan0
		if [ $res = "1" ] 
			then 
				echo -e "Changing mac address of wlan0"
				ifconfig wlo1 down
				macchanger -p wlo1
				ifconfig wlo1 up
				echo -e "Done."
				sleep 1
				RestoreMac  ##function called
	## Execute here if you choose wlan0mon 
		elif [ $res = "2" ] 
			then 
				echo -e "Changing mac address of wlan0mon"
				airmon-ng check kill
				airmon-ng start wlo1
				ifconfig wlan0mon down
				macchanger -p wlan0mon
				ifconfig wlan0mon up
				echo -e "Done..."
				sleep 1
				RestoreMac
	## Execute here if you choose etho0
		elif [ $res = "3" ]
			then 
				echo -e "Changing mac address of eth0..."
				ifconfig eth0 down
				macchanger -p eth0
				ifconfig eth0 up
				echo -e "Done."
				sleep 1
				RestoreMac
		elif [ $res = "0" ]
			then	
				banner	  	
		else
			echo -e "\nDo you have 3 options:"	 
			fi	
	} #ends here function macchanger

#Funcion to start a mode monitor 
function StarMon {
	sleep 0.5
	clear
	airmon-ng check kill
	echo "Your Nic is on monitor mode." 
	sleep 0.5
	airmon-ng start wlo1
	sleep 0.6
	echo "Done"
	echo -e "Interface Wlan0mon is up"
	back_menu #function called
	}
#When u want back to main menu
function back_menu
{
 echo -e "$COL \nPress y: $CE "
    read -n1  bck
        if [ $bck = "y" ]
	    	then	
	    		banner #function called
        else
			volta=0     
				while [ $volta -lt 2 ]   
					do 
						echo -e " $COL \nPress y to back to main menu $CE"
						read -n1 bck             
						if [ $bck = "y" ]
							then	
								banner #function called
						else
							echo -e "\nSorry I got go."
							break
						fi 					
				done
        fi
}
function A_inst {
	if [ -x /bin/ifstats ]
		then
			echo -e " ifstat is installed"
			banner
		else
			echo -e " \n macchanger isn't exist"
			echo -e "y to install"
			read hj
				if [ $hj == "y" ]
					then
						sudo apt install macchanger
					else
						echo -e "have a good day"
						banner
				fi
					
	fi
}  # function giboi ends here
function All_interfaces
{
	echo -e "      AVAILABLE INTERFACES "
	echo -e " 1) Wlan0 \n 2) Wlan0mon \n 3) Eth0 \n 0) Menu  "
}

function Set_interface
{
clear
while true
do
echo -e "Enter the name of your wireless interface when in "$RS"managed"$CE" mode("$YS"Enter"$CE"=wlp2s0): "
read MANAGED
if [[ "$MANAGED" = "" ]]
then
	MANAGED="wlp2s0"
fi
echo -e "Enter the name of your wireless interface when in "$RS"monitor"$CE" mode("$YS"Enter"$CE"=wlp2s0mon): "
read MONITOR
if [[ "$MONITOR" = "" ]]
then
	MONITOR="wlp2s0mon"
fi
echo -e "Enter the name of your wired interface("$YS"Enter"$CE"="enp1s0f0"): "
read WIRED
	if [[ "$WIRED" = "" ]]
		then
			WIRED="enp1s0f0"
	fi

	if [ ! -d $GPATH/interfaces ] #check if directory exist
		then 
			mkdir $GPATH/interfaces
		else	
			echo "Directory located"
	fi
	echo "$MANAGED" > "$GPATH"/interfaces/ManagedInt.txt
	echo "$MONITOR" > "$GPATH"/interfaces/MonitorInt.txt
	echo "$WIRED" > "$GPATH"/interfaces/WiredInt.txt
	echo -e ""$YS"Done"$CE""
	sleep 1
	clear
	echo -e ""$BS"If you want to change it, type "$CE""$YS"interface"$CE""$BS" any time"$CE""
	sleep 3
	echo -e "Press $YS any key $CE to continue..."
	break
done
}
function banner
{
clear
	echo -e ""
	echo -e "		[!]This Tool Must Run As ROOT\n"
	echo -e "$COL The     ██      ███████  ██      ███████ $CE  $COL by Kleusy Cruz $CE"
	echo -e "$COL         ██      ██   ██  ██      ██   ██ $CE"
	echo -e "$COL         ██      ██   ██  ██      ███████ $CE   "
	echo -e "$COL         ██      ██   ██  ██      ██   ██ $CE "
	echo -e "$COL         ███████ ███████  ███████ ██   ██   script $CE\n"
	echo -e "$YS if) $CE Ifconfig               $YS l0) $CE Exit  "
	echo -e "$YS  1) $CE Change MAC             $YS l1) $CE  Restore original MAC "
	echo -e "$YS  2) $CE Disable wlan0          $YS l2) $CE  Interfaces available"	
	echo -e "$YS 3d) $CE Available interfaces   $YS f1) $CE  FUCK ALL SYSTEM   "
	echo -e "$YS se) $CE Social-Engineering Attacks "
	echo -e "$YS interface)  $CE 	 Change Interface" 
	echo -e " 0) Exit "
	echo -e "$COL\nChoose:$CE"
    	read RESP
case $RESP in
1) 
	changemac;;
if)
    clear
    ifconfig 
    back_menu #function called	
;;
6)
	StarMon;;
l1)
	estoreMac;;
l2)
	interfaces;;
l3)
	A_inst;;
2)
	Disable_wlan0 
;;
3) #Available interface
	interfaces;;
4) #Enable wlan0
	enable_wlan0 #Function called
;;
5) #Disable wlan0mon
	disable_wlan0mon #Function called
;;
interface)
	Set_interface
;;
0) #If u want out
c=1
	while [ $c -le 3 ] 
		do
			#break
			echo "$c"
			c=$[ $c * 2 ]
			sleep 1
	done
	echo -e "\nThanks to use me"
	sleep 1;;
f1)
	freezy #Fork Function
;;
se)
	clear
	setoolkit
;;
*)
    banner #Function called
esac
shift
} #!Finish case

# The script start here
	#Set_interface
	banner 
