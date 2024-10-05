#!/bin/sh
PIDFile="/home/mysql/mysqldump/bin/mysqlBackupRunner.pid"
PID=$(<"$PIDFile")

kill -9 $PID


