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

options() {
echo "
Option 1: Basic Scan
Option 2: 
"
}
function main() {
if [ -f "$NIKTO" ]
then
banner
read -p  "IP to scan: " ip
fi
}
main
