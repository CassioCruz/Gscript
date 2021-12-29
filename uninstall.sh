#! /bin/bash
function nounistall
{
	echo -e "I knew you are still :D :D "
	sleep 2
	echo -e "If you want any feature to be added, contact me on FB"
	sleep 2
	echo -e " "
	echo -e "Kleusy Cruz"
	sleep 1
	exit
}
echo -e "Do you really want to uninstall the Lola script from your system?(y/n)(Enter=no): "
read -n1 CHUN
if [ "$CHUN" = "y" ]
then
	echo -e "If you have any problems please contact me first."
	echo -e "Ok, uninstalling everything that has to do with G_script on your system"
	sleep 2
	sudo rm -r /bin/gscript
	echo -e "Done."
	sleep 1
	#echo -e "You need to manually delete the gscript lscriptfolder from your /root/ directory though..."
	rm -r /root/gscript	
	sleep 2
	echo -e "Press any key to exit..."
		read -n1
	exit
	else
		nounistall
	fi
else
	nounistall
fi