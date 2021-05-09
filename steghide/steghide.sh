#!/bin/bash
while true; 
do
echo "
╔═╗┌┬┐┌─┐┌─┐┬ ┬┬┌┬┐┌─┐
╚═╗ │ ├┤ │ ┬├─┤│ ││├┤ 
╚═╝ ┴ └─┘└─┘┴ ┴┴─┴┘└─┘
--------
Choices:
--------
0:Embed 
--------
1:Extract
--------
"
read -p "Choice: " choice 
if [[ $choice -eq 0 ]];
then
echo "
╔═╗┌┬┐┌─┐┌─┐┬ ┬┬┌┬┐┌─┐
╚═╗ │ ├┤ │ ┬├─┤│ ││├┤ 
╚═╝ ┴ └─┘└─┘┴ ┴┴─┴┘└─┘
"
echo "Embed File"
read -p "File to be embedded(cover_file): " file_cover
if ! [ -e $file_cover ]; 
then 
echo $file_cover "doesn't exist" 
elif [ -f $file_cover ];
then
read -p "File to embed(embed_file): " file_embed
fi
steghide $file_cover -cf cvr.jpg -ef $file_embed
elif [ $choice -eq 1 ];
then
echo "
╔═╗┌┬┐┌─┐┌─┐┬ ┬┬┌┬┐┌─┐
╚═╗ │ ├┤ │ ┬├─┤│ ││├┤ 
╚═╝ ┴ └─┘└─┘┴ ┴┴─┴┘└─┘
"
echo "Extract File"
read -p "File to be extracted(extract_file): " file_extract
if ! [ -e $file_extract ]; 
then 
echo $file_extract "doesn't exist" 
elif [ -f $file_extract ];
then
steghide extract -sf $file_extract
fi
else
printf "\e[32mInvalid Option\e[0m"
fi
done
           
