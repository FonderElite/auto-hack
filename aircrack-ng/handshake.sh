#!/bin/bash
function handshake(){
if [ $EUID -eq 0 ]
then
echo "Grabbing the handshake from target."
read -p "Interface: " iface
read -p "Channel of the AP: " channel
read -p "BSSID: " bssid
read -p "File to write: " file
read -p "Do you wish to start now?(y/n): " choice
if [[ $choice == "y" ]];then
sudo airodump-ng --bssid $bssid -c 6 --write $file $iface

elif [[ $choice == "n" ]];then
echo "Chose option: no."
fi
else
echo "Please run the script as root."
fi
}
handshake
