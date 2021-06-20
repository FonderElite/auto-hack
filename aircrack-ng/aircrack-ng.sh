#!/bin/bash
function aircrack-ng()
{
if [[ $EUID == 0 ]];then
echo "AirCrack-ng(Crack wifi passwords)"
echo "---------------------------------"
read -p "Cap file-name to crack: " filename
read -p "Wordlist location: " wordlist
read -p "Do you wish to start aircrack-ng now?(y/n): " choice
if [[ $choice == "y" ]]; then
sudo aircrack-ng $file -w $wordlist 
elif [[ $choice == "n" ]];then
echo "Chose option: no."
else
echo "Invalid Option."
fi
else
echo "Please run the script as root."
fi
}
aircrack-ng
