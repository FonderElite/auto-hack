#!/bin/bash
echo "Automated Binwalk"
BINWALK=/usr/bin/binwalk
if [ -f "$BINWALK" ]
then
 echo "Tool for searching binary images for embedded files and"
 echo "executable code"
 sleep 1
 read -p "File to extract: " file
 read -p "Scan deatils output: " output
 binwalk -B -A -e -M -d 8 -W -X -v $file -f $output
 if [ -f "$output" ]
 then
  echo "Extraction details saved at $output"
 fi
else
 echo "error"
fi
