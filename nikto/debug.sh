#!/bin/bash
NIKTO=/usr/bin/nikto
COWSAY=/usr/games/cowsay
banner() {
if [ -f "$COWSAY" ]
then
cowsay -f eyes Nikto Vulnerability Scanner
else 
echo "Nikto Vulnerability Scanner
===============================
"
fi
}
function main() {
if [ -f "$NIKTO" ]
then
banner
echo "
Option 1: Basic Scan[0]
Option 2: Scan Tuning[1]
Option 3: Proxy[2]
"
read -p  "IP to scan: " ip
read -p "Output file-name: " output
read -p "Choice: " choice
if [ "$choice" -eq 0 ] 
then 
nikto -h $ip 
elif [ "$choice" -eq 1 ] 
then
echo "Scan Tuning Nikto"
echo "
Option 1:File Upload[0]
Option 2:Interesting File[1]
Option 3:Misconfiguration[2]
Option 4:Injection(XSS/Script)[3]
Option 5:Remote File Retrieval(Inside Web root)[4]
Option 6:DOS[5]
Option 7:Remote File Retrieval(Server Wide)[6]
Option 8:Command Execution[7]
Option 9:SQL Injection[8]
"
sleep 1
read -p "Scan Tuning Option: " option
fi 
if [ "$option" -eq 0 ]
then 
echo "File Upload Tuning"
nikto -h $ip -Tuning 0
elif [ "$option" -eq 1 ]
then
echo "Interesting File Tuning"
nikto -h $ip -Tuning 1
elif [ "$option" -eq 2 ]
then 
echo "Misconfiguration" 
nikto -h $ip -Tuning 2 

elif [ "$option" -eq 3 ]
then
echo "Injection(XSS/Script)"
nikto -h $ip -Tuning 3

elif [ "$option" -eq 4 ]
then
echo "Remote File Retrieval(Inside Web root)"
nikto -h $ip -Tuning 4

elif [ "$option" -eq 5 ]
then
echo "Denial Of Service"
nikto -h $ip -Tuning 5

elif [ "$option" -eq 6 ]
then
echo "Remote File Retrieval(Server Wide)"
nikto -h $ip -Tuning 6

elif [ "$option" -eq 7 ]
then
echo "Command Execution"
nikto -h $ip -Tuning 7

elif [ "$option" -eq 8 ]
then
echo "SQL Injection"
nikto -h $ip -Tuning 8

else
echo "Standard Nikto Scan"
nikto -h $ip 
fi
fi
}

main

