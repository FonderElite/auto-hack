#!/bin/bash
NMAP=/usr/bin/nmap
echo "Automated Port Scan Using Nmap(Slow)"
if [ -f "$NMAP" ] 
then
 read -p "Ip Address: " ip
 read -p "Scan Output File-name: " file
 echo -e "Scan Types:
Option 1: Normal Scan
Option 2: TCP Connect Scan
Option 3: TCP SYN Scan
Option 4: UDP Scan
Option 5: NULL, FIN & XMAS Scan
Option 6: ACK Scan
Option 7: Idle Scan
Option 8: Firewal bypass Scan
 "
read -p "Choice: " choice
if [ "$choice" -eq 1 ]
 then
  nmap -sV -sC $ip  -oN $file
elif [ "$choice" -q 2 ]
then 
 nmap -sT $ip -oN $file
elif [ "$choice" -q 3 ]
then 
 nmap -sS $ip -oN $file
 fi
else
 echo "Not a valid option"
fi
