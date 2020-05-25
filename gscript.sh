#!/bin/bash

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
changemac(){
echo -e "      available interfaces "
echo -e " 1) wlan0 \n 2 wlan0mon \n 3) eth0 \n 0) Menu  "
read macc
#macchanger -p wlan0
	if [ $macc = "1" ] 
	    then 
		ifconfig wlan0 down
		echo -e "How do you like to change random(r) or static(s) "
		  read random
		   if [ $random = "r" ]
		       then
			 macchanger -r wlan0
			  sleep 2
		     elif [ $random = "s" ]
		  	then
			   echo -e "Enter the MAC you want:"
			   read -e SMAC
			   echo -e "Changing mac address of wlan0 to $SMAC..."
			   ifconfig wlan0 down
			   macchanger -m $SMAC wlan0
			   ifconfig wlan0 up
			 echo -e "Done."
		   else
            	      echo "Giboia"	
		   fi
		
	fi
ifconfig wlan0 up

}
##Funcion MAin MEnu
MainMenu(){
echo -e ""
}
changemac


