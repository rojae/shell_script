#!/bin/bash

WORKSPACE='/home/ubuntu'
PIDFILE="$WORKSPACE/app.pid"
read PID < $PIDFILE

echo $PID
