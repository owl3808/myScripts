#!/bin/bash

while true;
do
	ping -c 1 8.8.8.8  > /dev/null 2>&1
	if [ $? -ne 0 ];then
		echo "Network is fail"
		vlc ~/Music/tokyohot.mp3
	else
		echo "ping success"
	fi
	sleep 1
done
