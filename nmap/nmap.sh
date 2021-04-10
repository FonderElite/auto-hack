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
Option 8: Firewall bypass Scan
Option 9: Aggressive Scan
Option 10: Vulnerability Scan
 "
read -p "Choice: " choice
if [ "$choice" -eq 1 ]
 then
  nmap -sV -sC $ip  -oN $file
elif [ "$choice" -eq 2 ]
then 
 nmap -sT $ip -oN $file
elif [ "$choice" -eq 3 ]
then 
 nmap -sS $ip -oN $file
elif [ "$choice" -eq 4 ]
then 
nmap -sU $ip -oN $file
elif [ "$choice" -eq 5 ]
then 
echo -e "
Options:
Option 1:Null
Option 2:FIN
Option 3:Xmas Scans
"
read -p "Choice: " prefer
if [ "$prefer" -eq 1 ]
then 
nmap -sN $ip -oN $file
elif [ "$prefer" -eq 2 ]
then nmap -sF $ip -oN $file 
elif [ "$prefer" -eq 3 ] 
then nmap -sX $ip -oN $file 
fi
elif [ "$choice" -eq 6 ]
then 
nmap -sA $ip -oN $file
elif [ "$choice" -eq 7 ]
then 
read -p "Enter Zombie IP: " zombie
nmap -sI $zombie $ip -oN $file
elif [ "$choice" -eq 8 ]
then
nmap -sS -T4 $ip --script firewall-bypass -oN $file
elif [ "$choice" -eq 9 ]
then
nmap -sV -sC -A $ip  -T 4 -oN $file
elif [ "$choice" -eq 10 ]
then
nmap --script=vuln $ip -oN $file
fi
else
 echo "Not a valid option"
fi
        
