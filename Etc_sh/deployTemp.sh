#!/bin/bash

#######################################
# Temporary deployment scripts For WAS
# USE 
# 1. sh deployTemp.sh /home/ubuntu/ROOT.war API
# 2. sh deployTemp.sh /home/ubuntu/ROOT.war ADMIN
# 3. sh deployTemp.sh /home/ubuntu/ROOT.war BATCH
#######################################

ROOT_PATH=$1
MODE=$2
API_DEPLOY_PATH=/home/ubuntu/app/webapps/ROOT.war
BATCH_DEPLOY_PATH=/home/ubuntu/batch/webapps/ROOT.war
ADMIN_DEPLOY_PATH=/home/ubuntu/admin/webapps/ROOT.war

OUTFILE=/var/log/app/deploy.log

if [ -z $ROOT_PATH ] || [ -z $MODE ]
then
        echo "파라미터 1 : ROOT.war 경로를 입력해주세요"
        echo "파리미터 2 : MODE를 입력하세요"
        echo "MODE) API, ADMIN, BATCH"
        exit 1;
fi
if [ $MODE != "API" ] && [ $MODE != "ADMIN" ] && [ $MODE != "BATCH" ]
then
        echo "파라미터 2가 잘못되었습니다"
        echo "MODE) API, ADMIN, BATCH"
        exit 1;
fi

set -x +v

echo "========================================" >> $OUTFILE
echo ":: $(date '+%Y-%m-%d %H:%M:%S')"  >> $OUTFILE

case $MODE in
        "API")
                if [ ! -f "$API_DEPLOY_PATH" ]; then
                        echo "$API_DEPLOY_PATH not exist" >> $OUTFILE
                        exit 0
                else
                        # Start
                        echo "$(date '+%Y-%m-%d %H:%M:%S') API Deploy Start!" >> $OUTFILE

                        # Backup
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Backup API ROOT.war" >> $OUTFILE
                        echo `cp /home/ubuntu/app/webapps/ROOT.war /home/ubuntu/app/backup/ROOT_$(date '+%Y%m%d').war`

                        # Move
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Move API ROOT.war" >> $OUTFILE
                        echo `mv -i $1 $API_DEPLOY_PATH`

                        # Change Own
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Change Owner Root Directory :: ubuntu" >> $OUTFILE
                        echo `chown ubuntu:ubuntu /home/ubuntu/app/webapps/ROOT.war`
                        echo `chown -R ubuntu:ubuntu /home/ubuntu/app/webapps/ROOT`

                        # Tomcat Restart
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Restart Tomcat-8080" >> $OUTFILE
                        echo `sh /home/ubuntu/was/tomcat-8080/bin/restart.sh`

                        # End
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Deploy End :)" >> $OUTFILE
                        exit 0
                fi
                ;;
        "ADMIN")
                if [ ! -f "$ADMIN_DEPLOY_PATH" ]; then
                        echo "$ADMIN_DEPLOY_PATH not exist" >> $OUTFILE
                        exit 0
                else
                        # Start
                        echo "$(date '+%Y-%m-%d %H:%M:%S') ADMIN Deploy Start!" >> $OUTFILE

                        # Backup
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Backup ADMIN ROOT.war" >> $OUTFILE
                        echo `cp /home/ubuntu/admin/webapps/ROOT.war /home/ubuntu/admin/backup/ROOT_$(date '+%Y%m%d').war`

                        # Move
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Move ADMIN ROOT.war" >> $OUTFILE
                        echo `mv -i $1 $ADMIN_DEPLOY_PATH`

                        # Change Own
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Change Owner Root Directory :: ubuntu" >> $OUTFILE
                        echo `chown ubuntu:ubuntu /home/ubuntu/admin/webapps/ROOT.war`
                        echo `chown -R ubuntu:ubuntu /home/ubuntu/admin/webapps/ROOT`

                        # Tomcat Restart
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Restart Tomcat-9090" >> $OUTFILE
                        echo `sh /home/ubuntu/was/tomcat-9090/bin/restart.sh`

                        # End
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Deploy End :)" >> $OUTFILE
                        exit 0
                fi
                ;;
        "BATCH")
                if [ ! -f "$BATCH_DEPLOY_PATH" ]; then
                        echo "$BATCH_DEPLOY_PATH not exist" >> $OUTFILE
                        exit 0
                else
                        # Start
                        echo "$(date '+%Y-%m-%d %H:%M:%S') BATCH Deploy Start!" >> $OUTFILE

                        # Backup
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Backup BATCH ROOT.war" >> $OUTFILE
                        echo `cp /home/ubuntu/batch/webapps/ROOT.war /home/ubuntu/batch/backup/ROOT_$(date '+%Y%m%d').war`

                        # Move
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Move BATCH ROOT.war" >> $OUTFILE
                        echo `mv -i $1 $BATCH_DEPLOY_PATH`

                        # Change Own
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Change Owner Root Directory :: ubuntu" >> $OUTFILE
                        echo `chown ubuntu:ubuntu /home/ubuntu/batch/webapps/ROOT.war`
                        echo `chown -R ubuntu:ubuntu /home/ubuntu/batch/webapps/ROOT`

                        # Tomcat Restart
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Restart Tomcat-7070" >> $OUTFILE
                        echo `sh /home/ubuntu/was/tomcat-7070/bin/restart.sh`

                        # End
                        echo "$(date '+%Y-%m-%d %H:%M:%S') Deploy End :)" >> $OUTFILE
                        exit 0
                fi
                ;;
esac