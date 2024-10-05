#!/bin/bash

##################################
# Print File' Data :: Last N Line 
##################################

FILE_DIR="/home/app/tomcat-7070/logs"
FILE_LIST=(
        "${FILE_DIR}/BATCH-01/BATCH-01.log"
        "${FILE_DIR}/BATCH-02/BATCH-02.log"
        "${FILE_DIR}/BATCH-03/BATCH-03.log"
        "${FILE_DIR}/BATCH-04/BATCH-04.log"
        "${FILE_DIR}/BATCH-05/BATCH-05.log"
        "${FILE_DIR}/BATCH-06/BATCH-06.log"
        "${FILE_DIR}/BATCH-90/BATCH-90.log"
        "${FILE_DIR}/BATCH-91/BATCH-91.log"
)

if [ -z $1 ]
then
        echo '출력 라인 수를 입력해야합니다.'
        exit;
fi

for i in "${FILE_LIST[@]}"
do
        printf "=========================\n"
        printf "FILE : $i\n"
        printf "=========================\n"
        tail -$1 $i
        printf "\n\n"
done