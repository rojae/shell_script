#!/bin/bash

PID=`sh /home/ubuntu/script/pid.sh`

if [ -z "`ps -eaf | grep $PID | grep -v grep`" ]; then
        echo "[$PID] NOT Running"
	echo `sh /home/ubuntu/script/run.sh`
else
        echo "[$PID] Application is Running ;)"
	echo `sh /home/ubuntu/script/stop.sh`
	sleep 5
	echo `sh /home/ubuntu/script/run.sh`
fi

exit 0
