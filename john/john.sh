#!/bin/bash
function john() {
JOHN=/usr/sbin/john
if [ -f "$JOHN" ]
then
echo "
     ___  _______  ______     
    |   ||       ||    _ |    
    |   ||_     _||   | ||    
    |   |  |   |  |   |_||_   
 ___|   |  |   |  |    __  |  
|       |  |   |  |   |  | |  
|_______|  |___|  |___|  |_|  

Github:https://github.com/fonderelite
"
read -p "format(ex. md5,sha256):~$ " hash
read -p "wordlist-path:~$ " wordlist
read -p "hash-file to crack:~$ " hashfile
john --format $hash --wordlist=$wordlist  $hashfile
elif [ ! -f "$JOHN" ]
then
echo "/usr/bin/john not found."
sleep 1
echo "Installing john."
sudo apt install john 
if [ -f "$JOHN" ] 
then
read -p "format(ex. md5,sha256):~$ " hashe2
read -p "wordlist-path:~$ " wordlist2
read -p "hash-file to crack:~$ " hashfile2
john --format $hashe2 --wordlist=$wordlist2 $hashfile2  
fi
fi
}
john
       
