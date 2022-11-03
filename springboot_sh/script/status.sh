#!/bin/bash

PID=`sh /home/ubuntu/script/pid.sh`

if [ -z "`ps -eaf | grep $PID | grep -v grep`" ]; then
	echo "[$PID] NOT Running"
else
	echo "[$PID] Application is Running ;)"
fi
