#!/bin/bash

function banner
{
clear
	
	echo -e ""
	echo -e "         ██      ███████  ██      ███████  "
	echo -e "         ██      ██   ██  ██      ██   ██ "
	echo -e "         ██      ██   ██  ██      ███████    "
	echo -e "         ██      ██   ██  ██      ██   ██  "
	echo -e "    The  ███████ ███████  ███████ ██   ██   script"
	echo -e "                                      "
	echo -e "if) Ifconfig             l0) Exit  "
	echo -e " 1) Change MAC           l1)  Restore original MAC "
	echo -e " 2) Dsable wlan0         l2)  Restore original MAC "	
	echo -e " 3) Available interfaces l3)  Restore original MAC "	
	echo -e " 4) Enable wlan0         l4)  Restore original MAC "
	echo -e " 5) Disable wlan0mon     l3)  Restore original MAC "	
	echo -e " 6) Enable wlan0mon      l4)  Restore original MAC "
	echo -e " 0) Exit "
echo -e "\nChoose:"
    read resp
case $resp in
1)  	##Call a funcion
    changemac;;
if) 	##Call a funcion
    clear
    ifconfig 
    echo -e "Press y"
	  read -n1 bck
       if [ $bck = "y" ]
	  then	
	      banner
	else
	echo -e "\nThanks to use me"
       fi	;;
start)
	##Call a funcion
     StarMon;;
l1)
RestoreMac;;
l2)
interfaces;;
2) #Disable wlan0
clear
 ifconfig wlan0 down;
 sleep 0.5
 echo -e ""
 echo -e "Wlan0 interface is disable now... \n"
 sleep 1
 echo -e "y to back to MainMenu"
    read -n1 bck
       if [ $bck = "y" ]
	  then	
	      banner
       else
	  echo -e "\nThanks to use me"
       fi
;;
3) #Available interface
interfaces;;
4) #Enable wlan0
clear
ifconfig wlan0 up
sleep 0.5
echo -e "Wlan0 interface is available now... \n"
sleep 1
 echo -e "Press y"
    read -n1 bck
       if [ $bck = "y" ]
	  then	
	      banner
       else
	  echo -e "\nThanks to use me"
       fi
;;
5) ##Nothin to think a yet
;;
0) #If u wnat out
c=1
while [ $c -le 4 ] 
do
break
echo "$c"
 c=$[ $c * 2 ]
done
echo -e "\nThanks to use me"
sleep 1.5;;
*)
    banner
esac
shift
}
interfaces(){
clear
echo "        Cards ON"
#mc=$(ifconfig | echo grep -a "ether" | cut -d "" -f2 | awk -F " " '{print $2}')
wla=$(ifconfig | cut -d " " -f1 | grep -a "wlan0")
eth=$(ifconfig | cut -d " " -f1 | grep -a "eth")
echo ""
echo -e " $eth \n\n $wla \n "
sleep 0.5
 echo -e "Press y"
    read -n1 bck
       if [ $bck = "y" ]
	  then	
	      banner
       else
	  echo -e "\nThanks to use me"
       fi
}
#interfaces #func called
#mc=$(ifconfig | grep -a "ether" | cut -d "" -f2 | awk -F " " '{print $2}')
#####FuncionMacchange
changemac(){
echo -e "      available interfaces "
echo -e " 1) wlan0 \n 2 wlan0mon \n 3) eth0 \n 0) Menu  "
read macc
## Execute here if you choose wlan0
	if [ $macc = "1" ] 
	    then 
		echo -e "How do you like to change your MAcAdd random(r) or static(s) "
		  read random
		   if [ $random = "r" ]
		       then
			 
			 sleep 0.5
			airmon-ng stop wlan0mon
			service network-manager start
			ifconfig wlan0 down			 
			macchanger -r wlan0
			ifconfig wlan0 up
			  sleep 0.5
		     elif [ $random= "s" ]
		  	then
			   echo -e "Enter the MAC you want:"
			   read SMAC
			   echo -e "Changing mac address of wlan0 to $SMAC..."
			   ifconfig wlan0 down
			   macchanger -m $SMAC wlan0
			   ifconfig wlan0 up
			 echo -e "Done."
		   else
            	      echo "Giboias"	
		   fi
	echo -e "enter to back"
	  read -n1  bck
       if [ $bck = "y" ]
	  then	
	      banner
       else
	      echo -e "Good by"
	  fi	
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
			changemac
		    elif [ $res = "0" ]
	     		then	
	      		   banner

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
            	      echo "Giboias"	
		   fi	
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
            	      echo "Giboias"	
		   fi	
	fi


} ##Finish 

##Restore original MAC
RestoreMac(){
clear
echo -e "      AVAILABLE INTERFACES "
echo -e " 1) wlan0 \n 2) wlan0mon \n 3) eth0 \n 0) Menu  "
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
		echo "giboia"
	 
	fi
}
#Funcion to start a mode monitor 
StarMon(){
 sleep 0.5
 clear
 airmon-ng check kill
 echo "Your Nic is on mode monitor now" 
 sleep 0.5
 airmon-ng start wlan0
 ifconfig wlan0mon down
 echo -e "Changing mac address of wlan0mon "
  macchanger -r wlan0mon > /dev/null
  ifconfig wlan0mon up
 sleep 0.6
  echo "Done"
  echo -e "Interface Wlan0mon is up"

 echo -e "\n Enter to back."
	  read -n1  bck
       if [ $bck = "y" ]
	  then	
	      banner
       else
	      echo -e "Good by"
	  fi

}
###Main funcion called
banner


