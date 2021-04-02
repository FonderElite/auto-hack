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
read -p "Saved file-name: " file
read -p "Do you want to add google dorks?(y/n): " choice
if [ "$choice" -eq "y"]
then
read -p "Google Dork: " googledork
theHarvester -d $domain -l $limit -g $googledork -b all -f $file
elif [ "$choice" -eq "n" -o "$choice" -eq "N" ]
then
echo "No Google Dorks."
theHarvester -d $domain -l $limit -b all 
fi
;;
2)
echo "DNS Brute"
read -p "Enter Domain: " domain_op2
read -p "Saved file-name: " file_op2
theHarvester $domain_op2 -c -f $file_op2 
;;
3)
echo "OSINT with shodan
(API KEY NEEDED)
"
read -p "Enter Domain: " domain_op3
read -p "Limit(100-500 recommended): " limit_op3
read -p "Saved file-name: " file_op3
read -p "Do you want to add google dorks?(y/n): " choice_op3
if [ "$choice_op3" -eq "y" -o "$choice_op3" -eq "Y" ]
then
read -p "Google Dork: " googledork_op3
theHarvester -d $domain_op3 -l $limit_op3 -s -g $googledork_op3 -b all -f $file_op3
elif [ "$choice" -eq "n" -o "$choice" -eq "N" ]
then
echo "No Google Dorks."
theHarvester -d $domain -l $limit -s -b all -f $file_op3
fi
;;
4)
echo "OSINT with Proxies
(API KEY NEEDED)
"
read -p "Enter Domain: " domain_op4
read -p "Limit(100-500 recommended): " limit_op4
read -p "Saved file-name: " file_op4
if [ "$choice_op4" -eq "y" -o "$choice_op4" -eq "Y" ]
then
read -p "Google Dork: " googledork_op3
theHarvester -d $domain_op4 -l $limit_op4 -g $googledork_op4 -p -b all -f $file_op4
elif [ "$choice" -eq "n" -o "$choice" -eq "N" ]
then
echo "No Google Dorks."
theHarvester -d $domain_op4 -l $limit_op4 -p -b all -f $file_op4
fi
;;
esac
fi
