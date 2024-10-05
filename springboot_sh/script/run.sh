#!/bin/bash
WORKSPACE=/home/ubuntu
PID=`sh /home/ubuntu/script/pid.sh`


if [ -z "`ps -eaf | grep $PID | grep -v grep`" ]; then
	echo "Application is being Start-up"

	nohup java -jar $WORKSPACE/app.jar >> $WORKSPACE/nohup.out 2>&1 &
	ps -ef | grep date | grep -v grep | awk '{print $2}' > $WORKSPACE/app.pid

	PID=`sh /home/ubuntu/script/pid.sh`
	echo "$PID"
	exit 0
else
        echo "[$PID] Application Already is Running, This Shell Script was Cancalled"
fi
