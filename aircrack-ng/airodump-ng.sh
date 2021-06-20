#!/bin/sh
#Sources:
#https://www.aircrack-ng.org/doku.php?id=airmon-ng
#https://null-byte.wonderhowto.com/how-to/hack-wi-fi-cracking-wpa2-psk-passwords-using-aircrack-ng-0148366/
function banner(){
echo """
Automated-Wireless Testing Tool
-------------------------------
Made By FonderElite
Github:https://github.com/Fonderelite
"""
}
banner
read -p "Interface: " iface
function configure(){
read -p "Do you want to kill processes that may disrupt airmon-ng?(y/n): " choice
if [[ $choice == "y" ]];then
echo "Killing Processes that may disrupt airmon-ng."
sleep 1
sudo airmon-ng check kill
sudo airmon-ng start $iface
elif [[ $choice == "n" ]];then
sudo airmon-ng start 
else
echo "Invalid Option."
fi
}
function airodump-ng(){
sudo airodump-ng $iface
}
function main(){
read -p "Do you want to run the function of killing processes and starting airmon-ng?(y/n): " airmon
if [[ $airmon == "y" ]];then
configure
echo "Starting airodump-ng..."
sleep 2
airodump-ng
elif [[ $airmon == "n" ]];then
echo "Skipping automated configuration."
echo "Starting airodump-ng..."
sleep 2
airodump-ng
fi
}
main
                
