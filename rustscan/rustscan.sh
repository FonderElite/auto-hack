echo "Automated Rustscan"
echo "Made By FonderElite \n"
sleep 1
FILE=/usr/bin/rustscan
FILE_DEB=rustscan_2.0.1_amd64.deb
OUTPUT=scan.txt
if [ -f "$FILE" ] 
then
    read -p "Enter Ip Address: " ip
    read -p "Scan Output File: " outfile
    rustscan -b 2000 -a $ip --ulimit 5000 -- -sV -sC -oN $outfile
    if [ -f "$OUTPUT" ]
     then
     echo  "Scan saved at $outfile"
    fi
elif [ -f "$FILE_DEB" ] && [ ! -f "$FILE" ]
then
 sudo dpkg -i $FILE_DEB
else
echo "Both of the files are missing."
sleep 1
echo "/usr/bin/rustscan and .deb file"
fi
