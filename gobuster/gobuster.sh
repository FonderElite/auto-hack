#!/bin/bash
echo "GoBuster BruteForce Directories"
GOBUSTER=/usr/bin/gobuster
if [ -f "$GOBUSTER" ]
then
read -p "URL: " url
read -p "Wordlist-location: " wordlist
read -p "Output File: " file
gobuster dir -u $url  -w $wordlist   -t 40 -s "204,301,302,307" -o $file
else
sudo apt update
sudo apt install gobuster
read -p "URL: " url_else
read -p "wordlist-location: " wordlist_wordl
read -p "Output File: " file
gobuster dir -u $url_else  -w $wordlist_wordl  -t 40 -s "204,301,302,307" -o $file
fi
