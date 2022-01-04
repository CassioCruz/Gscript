#!/bin/bash
#Author Kleusy Cruz
#Facebook Kleusy Cruz
#Linkdlin Kleusy Cruz
#Email cassio.sousa@outlook.pt
#Number +244 924423712

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
function Disable_wlan0 
{
	clear
	rfkill unblock wifi &> /dev/null; rfkill unblock all &> /dev/null
	ifconfig wlan0 down;
	sleep 0.5
	echo -e ""
	echo -e "Wlan0 interface is disable now... \n"
	sleep 1
	back_menu #function called@category:debuggers 'Shell Script'
}

function Enable_wlan0
{
	clear
	sleep 0.5
	airmon-ng stop wlan0mon;clear
	service network-manager start
	echo -e "Starting network-manager service..."
	sleep 0.7
	echo -e "Wlan0 interface is available now... \n"
	sleep 1
	back_menu #function called
}
function disable_wlan0mon
{
	airmon-ng stop wlo1mon
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
	wla=$(ifconfig | cut -d " " -f1 | grep -a "wlan0") #show wlan0interface
	eth=$(ifconfig | cut -d " " -f1 | grep -a "eth0") #show eth0interface
	lo=$(ifconfig | cut -d " " -f1 | grep -a "lo")  #show loopbackinterface
	echo ""
	echo -e " $eth \n\n $wla \n\n $lo\n\n"
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

function RestoreMac{  #Restore original MAC
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
 echo -e "\nPress y:"
    read -n1  bck
        if [ $bck = "y" ]
	   then	
	       banner #function called
        else
	  volta=0
	  left=2     
	  while [ $volta -lt 2 ]   
           do 
		echo -e "\nPress y to back to main menu"
    		    read -n1 bck             
		if [ $bck = "y" ]
	   	   then	
	       banner #function called
		else
		   echo -e "\nLeft you $left attempt."
		fi 
            volta=$[$volta + 1]
	    left=$[$left - 1]
		if [ $volta = 1 ]
		  then
		    echo "Come soon..."
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
function banner
{
clear
	echo -e ""
	echo -e "$COL         ██      ███████  ██      ███████ $CE  $COL by Kleusy Cruz $CE"
	echo -e "$COL         ██      ██   ██  ██      ██   ██ $CE"
	echo -e "$COL         ██      ██   ██  ██      ███████ $CE   "
	echo -e "$COL         ██      ██   ██  ██      ██   ██ $CE "
	echo -e "$COL    The  ███████ ███████  ███████ ██   ██   script $CE\n"
	echo -e ""$YS" if)"$CE" Ifconfig             "$YS"l0)"$CE" Exit  "
	echo -e ""$YS" 1) "$CE"Change MAC            "$YS"l1)"$CE"  Restore original MAC "
	echo -e ""$YS" 2) "$CE"Disable wlan0         "$YS"l2)"$CE"  Interfaces available"	
	echo -e ""$YS" 3d)"$CE" Available interfaces "$YS"l3)"$CE"  install all soft  "	
	echo -e " 0) Exit "
	echo -e "$COL\nChoose:$CE"
    	read resp
case $resp in
1) 
	changemac;;
if)
    clear
    ifconfig 
    back_menu #function calCassioled	
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
	nable_wlan0 #Function called
;;
5) #Disable wlan0mon
	disable_wlan0mon #Function called
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
*)
    banner #Function called
esac
shift
} #Finish case
###Main funcion called
# The script start here
	banner 
