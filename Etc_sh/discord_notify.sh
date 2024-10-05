#!/bin/bash

today=`date`
message="> <!channel> 여기에 메시지가 들어갑니다."
webhookUrl="https://hooks.slack.com/services///"


curl -X POST -H 'Content-type: application/json' --data '{"text": "'"${today}\n${message}"'"}' ${webhookUrl}