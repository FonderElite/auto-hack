#!/bin/bash
export Exception="Try sudo apt-get update"
function scanBarCode() {
ZBARIMG=/usr/bin/zbarimg
if [ ! -f "$ZBARIMG" ]
then
echo "ZBARIMG Not found."
sleep 1
echo "Proceeding to install..."
sudo apt install zbar-tools
elif [ -f "$ZBARIMG" ]
then
echo "
 _________    _    ____  ___ __  __  ____ 
|__  / __ )  / \  |  _ \|_ _|  \/  |/ ___|
  / /|  _ \ / _ \ | |_) || || |\/| | |  _ 
 / /_| |_) / ___ \|  _ < | || |  | | |_| |
/____|____/_/   \_\_| \_\___|_|  |_|\____|

Github:https://github.com/FonderElite
"
read -p "Image-file to read: " file
read -p "Do you want to output this to a file?(yes=1/no=0): " choice
if [[ $choice -eq "0" ]];then
zbarimg -d --raw $file
elif [ $choice -eq 1 ]
then
read -p "output-file name: " output
zbarimg -d --raw $file > $output
fi
else
echo $Exception
fi
}
scanBarCode
