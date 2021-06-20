#!/bin/bash
function handshake(){
if [ $EUID -eq 0 ]
then
echo "Grabbing the handshake from target."
echo "----------------------------------"
read -p "Interface: " iface
read -p "Channel of the AP: " channel
read -p "BSSID: " bssid
read -p "File-name to write: " file
read -p "Do you wish to start now?(y/n): " choice
if [[ $choice == "y" ]];then
sudo airodump-ng --bssid $bssid -c $channel --write $file $iface

elif [[ $choice == "n" ]];then
echo "Chose option: no."
fi
else
echo "Please run the script as root."
fi
}
handshake
