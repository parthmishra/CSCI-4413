#!/bin/bash

UTIL=80
TEST="$(df -h | head -2 | tail -1 | awk '{print $5}' | cut -d% -f1)"

if [ $TEST -gt $UTIL ]
then
	echo "Disk Util is over 80%!" | mail -s "Disk Util Alert!" root@localhost	
fi
