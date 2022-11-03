#!/bin/sh

PIDFile="/home/mysql/mysqldump/bin/mysqlBackupRunner.pid"
PID=$(<"$PIDFile")

echo "================================================"
echo "Mariadb Backup Batch Process Check..."
echo "Process ID : $PID"
echo "================================================"

if ps -f $PID | grep -v UID > /dev/null
then
   echo "[$PID] Mysql Backup Runner is running"
else
   echo "[$PID] Not Found Process"
fi
echo $!

