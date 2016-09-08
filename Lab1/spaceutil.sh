#!/bin/bash

UTIL=80
TEST="$(df -h | awk '{if {$5 != "Use%"} print $5}' | cut -d'%' -f1 | head -1)"

if [ $(TEST) -gt $UTIL]
then
	sendmail root@localhost < diskutil.txt
fi
