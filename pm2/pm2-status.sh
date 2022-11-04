#!/bin/bash

PIDFILE='/home/nodeServer/.pm2/pm2.pid'
PID=$(<"$PIDFILE")

echo '=========================================='
echo 'pm2 frontend, Node Server Start...'
echo "Process ID : $PID"
echo '=========================================='

if ps -f $PID | grep -v UID > /dev/null
        then
                echo "[$PID] Pm2 Process is Running"
        else
                echo "[$PID] Not Found Prcess"
fi

echo 'end'
