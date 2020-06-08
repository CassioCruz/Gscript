#!/bin/bash

function banner
{
	
	echo -e ""
	echo -e "$COL         ██      ███████  ██      ███████  $CE $VERSION"
	echo -e "$COL         ██      ██   ██  ██      ██   ██ $CE"
	echo -e "$COL         ██      ██   ██  ██      ███████    by Cassio Cruz"
	echo -e "$COL         ██      ██   ██  ██      ██   ██  $CE"
	echo -e "$COL    The  ███████ ███████  ███████ ██   ██   script$CE"
	echo -e "$COL                                      $CE"
	echo -e ""$YS"if"$CE") Ifconfig           "$YS"l"$CE") Local IPs & gateways "$RS"|"$CE"  "$YS"scan"$CE") Arp-scan network"
	echo -e ""$YS" 3"$CE") Change MAC        "$YS"d3"$CE") Restore original MAC "$RS"|"$CE""$YS"update"$CE") Check for updates"
echo "Choose"
    read resp
case $resp in
3)
    changemac;;
if)
    ifconfig ;;
*)
    echo "foda-se";;
esac
shift

}	


interfaces(){
echo "        Cards ON"
mc=$(ifconfig | echo grep -a "ether" | cut -d "" -f2 | awk -F " " '{print $2}')
wla=$(ifconfig | cut -d " " -f1 | grep -a "wlan0")
eth=$(ifconfig | cut -d " " -f1 | grep -a "eth")
echo ""
echo -e " $eth \n $wla  \n           $mc"
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
			 ifconfig wlan0 down
			 sleep 0.5
			 macchanger -r wlan0
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
		echo -e "How do you like to change your MAcAdd random(r) or static(s) "
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
			 sleep 0.5
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

##Funcion MAin MEnu
MainMenu(){
echo -e ""
}

banner


