#!/bin/bash

echo "Application is being terminate"
echo `sh /home/ubuntu/script/pid.sh`
kill -9 `sh /home/ubuntu/script/pid.sh`
exit 0
