#!/bin/bash
SQLMAP=/usr/bin/sqlmap
RED='\033[0;31m'
function banner() {
printf "
        ___
       __H__
 ___ ___[.]_____ ___ ___  {1.4.11#stable}
|_ -| . [,]     | .'| . |
|___|_  [(]_|_|_|__,|  _|
      |_|V...       |_|   http://sqlmap.org

Automated SqlMap
Github:FonderElite
"
}

function booleanBased() {
printf "Boolean Based Technique \n\n" 
read -p "Do you have cookies?(y=1/n=0): " cookiein1
read -p "Url: " url1
read -p "Data used in post req: " data1
read -p "Testable Parameter(ex. search): " p1
read -p "Level: " lvl1
read -p "Risk: " risk1
if [ "$cookiein1" -eq 1 ]
then
read -p "Cookie: " cookie1
sqlmap --url="$url1" --method=POST --data="$data1" --cookie="$cookie1" -p "$p1" -a --level=$lvl1 --risk=$risk1 --flush-session --technique=B
else
sqlmap --url="$url1" --method=POST --data="$data1" -p "$p1" -a --level=$lvl1 --risk=$risk1 --flush-session --technique=B
fi
}
function errorBased() {
printf "Error-Based Technique \n\n"
read -p "Do you have cookies?(y=1/n=0) " cookiein2 
read -p "Url: " url2
read -p "Data used in post req: " data2
read -p "Level: " lvl2
read -p "Risk: " risk2
if [ "$cookiein2" -eq 1 ] 
then
read -p "Cookie: " cookie2
sqlmap --url="$url2" --method=POST --data="$data2" --cookie="$cookie2" -p "search" -a --level=$lvl2 --risk=$risk2 --flush-session --technique=E
else
sqlmap --url="$url2" --method=POST --data="$data2" -p "search" -a --level=$lvl2 --risk=$risk2 --flush-session --technique=E
fi
}
function unionQueryBased() {
printf "Union-Query Based \n\n"
read -p "Verbose?(y=1/y=0): " verbosein3
read -p "Url: " url3
read -p "Level: " lvl3
read -p "Risk: " risk3
if [ "$verbosein3" -eq 1 ] 
then
read -p "Verbosity Level: " verbose3
sqlmap -v=$verbose3 --url="$url3" --method=POST -a --level=$level3 --risk=$risk3 --flush-session --technique=U
else
sqlmap -v=$verbose3 --url="$url3" --method=POST -a --level=$level3 --risk=$risk3 --flush-session --technique=U
fi
}
function choices() {
echo "
-----------------------
 💉SQLMAP Techniques  
-----------------------
|1: Boolean-based blind
-----------------------
|2: Error-based
-----------------------
|3: Union query-based
-----------------------
|4: Stacked queries
-----------------------
|5: Time-based blind
-----------------------
|6: Inline queries
-----------------------
|7: Crawl & Discovery
-----------------------
"
read -p "Choice~: " choice
case $choice in
1)
 booleanBased
 ;;
2)
 errorBased
 ;;
3)
unionQueryBased
;;
esac

}

function main() {
if [ -f "$SQLMAP" ]; 
then
sleep 0.5
banner
choices
else
sudo apt update && sudo apt install sqlmap
fi
}
main

