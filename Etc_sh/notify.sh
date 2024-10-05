#!/bin/bash
 
###############################################################
# maxscale, keepalived 구조에서 사용
# keepalived에 notify를 연결하여, active passive 모드를 전환해줌
###############################################################

TYPE=$1
NAME=$2
STATE=$3
 
OUTFILE=/var/log/maxscale/state.log
 
case $STATE in
  "MASTER") echo "Setting this MaxScale node to active mode" > $OUTFILE
                  maxctrl alter maxscale passive false
                  exit 0
                  ;;
  "BACKUP") echo "Setting this MaxScale node to passive mode" > $OUTFILE
                  maxctrl alter maxscale passive true
                  exit 0
                  ;;
  "FAULT")  echo "MaxScale failed the status check." > $OUTFILE
                  maxctrl alter maxscale passive true
                  exit 0
                  ;;
        *)        echo "Unknown state" > $OUTFILE
                  exit 1
                  ;;
esac