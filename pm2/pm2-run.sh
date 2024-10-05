#!/bin/sh

PIDFILE='/home/nodeServer/.pm2/pm2.pid'
PID=$(<"$PIDFILE")
CONFIGFILE='ecosystem.config.js'

echo '=========================================='
echo 'pm2 frontend, Node Server Start...'
echo "Process ID : $PID"
echo '=========================================='

cd /home/nodeServer/app/

echo "npm library install..."
npm install

if ps -f $PID | grep -v UID > /dev/null
	then
		echo "[$PID] Node Server pm2 Exist.. Do reload"
		pm2 reload fe-node
	else
		echo "[$PID] Not Found Prcess... Do Start all"
		pm2 start ${CONFIGFILE} 
fi

echo "$!"
echo 'end'
