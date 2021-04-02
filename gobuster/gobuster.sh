#!/bin/bash
echo "GoBuster BruteForce Directories"
GOBUSTER=/usr/bin/gobuster
if [ -f "$GOBUSTER" ]
then
read -p "URL: " url
read -p "Wordlist-location: " wordlist
read -p "Output File: " file
gobuster dir $url  -w $wordlist -v -t 40 -o $file
else
sudo apt update
sudo apt install gobuster
read -p "URL: " url_else
read -p "wordlist-location: " wordlist_wordl
read -p "Output File: " file
gobuster dir $url_else  -w $wordlist_wordl -v -t 40 -o $file
fi
