#!/bin/bash
#Author Cassio Cruz
#
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
airmon-ng stop wlan0mon
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
 back_menu #function called
}
#####FuncionMacchange
function changemac 
{ clear
All_interfaces #Function called
read macc
## Execute here if you choose wlan0
if [ $macc = "1" ] 
	then 
	   echo -e "How do you like to change your MAcAdd random(r) or static(s) "
	      read random
           if [ $random = "r" ]
	      then			 
		sleep 0.5
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
		      ifconfig wlan0 up
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

function RestoreMac  #Restore original MAC
{
clear
All_interfaces #Function called
read res
## Execute here if you choose wlan0
	if [ $res = "1" ] 
	    then 
		echo -e "Changing mac address of wlan0"
	        ifconfig wlan0 down
	        macchanger -p wlan0
		ifconfig wlan0 up
        	echo -e "Done."
		sleep 1
		RestoreMac
## Execute here if you choose wlan0mon 
	elif [ $res = "2" ] 
	    then 
		echo -e "Changing mac address of wlan0mon"
		airmon-ng check kill
		airmon-ng start wlan0
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
function StarMon 
{
 sleep 0.5
 clear
 airmon-ng check kill
 echo "Your Nic is on monitor mode." 
 sleep 0.5
 airmon-ng start wlan0
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
	echo -e "         ██      ███████  ██      ███████   by Cassio Cruz"
	echo -e "         ██      ██   ██  ██      ██   ██ "
	echo -e "         ██      ██   ██  ██      ███████    "
	echo -e "         ██      ██   ██  ██      ██   ██  "
	echo -e "    The  ███████ ███████  ███████ ██   ██   script"
	echo -e "                                      "
	echo -e "if) Ifconfig             l0) Exit  "
	echo -e " 1) Change MAC           l1)  Restore original MAC "
	echo -e " 2) Disable wlan0         l2)  Interfaces available "	
	echo -e " 3) Available interfaces l3)  install all soft  "	
	echo -e " 4) Enable wlan0         l4)  Restore original MAC "
	echo -e " 5) Disable wlan0mon     l3)  Restore original MAC "	
	echo -e " 6) Enable wlan0mon      l4)  Restore original MAC "
	echo -e " 0) Exit "
echo -e "\nChoose:"
    read resp
case $resp in
1)  	
#function called
 	changemac;;
if) 
    clear
    ifconfig 
    back_menu #function called	
;;
6)
#function called
 StarMon;;
l1)
#function Called
 RestoreMac;;
l2)
#function called
 interfaces;;
l3)
A_inst;;
2)
 #Disable wlan0
Disable_wlan0 
;;
3) #Available interface
 interfaces;;
4) #Enable wlan0
 Enable_wlan0 #Function called
;;
5) #Disable wlan0mon
desable_wlan0mon #Function called
;;
0) #If u want out
c=1
while [ $c -le 4 ] 
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


