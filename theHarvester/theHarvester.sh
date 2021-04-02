#!/bin/sh
HARVESTER=/usr/bin/theHarvester
echo "
The Harvester
 This tool gathers emails, names, subdomains, IPs and URLs 
"
if [ -e "$HARVESTER" ]
then
echo "
API-KEYS Location:
/etc/theHarvester/api-keys.yaml
/usr/lib/python3/dist-packages/theHarvester/api-keys.yaml
========================================================
For Proxies enter in
/etc/theHarvester/proxies.yaml
"
echo "Options:
Option 1: Normal OSINT
Option 2: DNS Brute
Option 3: DNS Lookup
Option 3: Osint with shodan(api key needed)
Option 4: Proxies(api key needed)
"
read -p "Option: " option
case $option in
1)
read -p "Enter Domain: " domain
read -p "Limit(100-500 recommended): " limit
read -p "Do you want to add google dorks?(y/n): " choice
if [ "$choice" -eq "y" -o "$choice" -eq "Y" ]
then
read -p "Google Dork: " googledork
theHarvester -d $domain -l $limit -g $googledork -b all 
elif [ "$choice" -eq "n" -o "$choice" -eq "N" ]
then
echo "No Google Dorks."
theHarvester -d $domain -l $limit -b all 
fi
;;
esac
fi
