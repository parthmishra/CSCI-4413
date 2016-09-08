#!/bin/bash 



CPULOAD="$(uptime | awk '{print $9,$10,$11}')"
FREERAM="$(free | awk '{print $4}' | tail -2 | head -1)"
lOBYTESREC="$(cat /proc/net/dev | awk 'FNR == 4 {print $2}')"
lOBYTESTRANS="$(cat /proc/net/dev | awk 'FNR == 4 {print $10}')"
enp0s3BYTESREC="$(cat /proc/net/dev | awk 'FNR == 3 {print $2}')"
enp0s3BYTESTRANS="$(cat /proc/net/dev | awk 'FNR == 3 {print $10}')"
INTERNETCONNECT=""
PINGREC="$(ping -c 5 8.8.8.8 | tail -2 | head -1 | awk '{print $4}')" 
TOTALUSERS="$(cat /etc/passwd | wc -l)"
ACTIVEUSERS="$(who | wc -l)"
SHELL="$(cut -d: -f7 /etc/passwd | sort | uniq -c | sort -nr | awk 'FNR == 1 {print $2}')"

echo
echo "CPU AND MEMORY RESOURCES------------"
echo

echo "CPU Load Average: $CPULOAD	Free RAM: $FREERAM bytes" 


echo
echo "NETWORK CONNECTIONS-----------------"
echo

echo "lo Bytes Recieved: $lOBYTESREC	Bytes Transmitted: $lOBYTESTRANS"
echo "enp0s3 Bytes Recieved: $enp0s3BYTESREC Bytes Transmitted: $enp0s3BYTESTRANS"

if [ "$PINGREC" -eq "5" ]
then
	echo "Internet Connectivity: YES"
else
	echo "Internet Connectivity; NO"
fi



echo
echo "ACCOUNT INFORMATION-----------------"
echo

echo "Total Users: $TOTALUSERS	Number Active: $ACTIVEUSERS"
echo
echo "Most Used Shell: $SHELL"
