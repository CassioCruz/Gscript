#!/bin/bash

interfaces(){
echo "Availabes interface"
wla=$(ifconfig | cut -d " " -f1 | grep -a "wlan0")
eth=$(ifconfig | cut -d " " -f1 | grep -a "eth")
echo ""
echo -e "$eth \n$wla"
}
interfaces #func called



