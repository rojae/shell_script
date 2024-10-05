#=========================================
# 2022-06-20 Mysql Dump Shell
#------------------------------------------
#
# Create Dump Shell 
#
#==========================================

echo "================================================"
echo "Mariadb Backup Batch Start..."
echo "Process ID : $$"
echo "================================================"

# pid set
# 자식 프로세스때문에 미사용
#PID=`ps -ef | grep 'mysqlBackupRunner' | grep 'batchor' | grep -v 'grep' | awk '{printf $2}'`
echo $$ > /home/mysql/mysqldump/bin/mysqlBackupRunner.pid

# Variable Declaration
BAK_FILE_NM=_db_backup_`date +"%Y%m%d"`.sql
BAK_LOG_FILE_NM=0db_backup_`date +"%Y%m%d"`.log
BAK_FILE_SAVE_PATH=/home/mysql/mysqldump/db_backup_files
BAK_FILE_DIRECTORY=`date +"%Y%m%d"`
WEEK_AGO=`date -d '1 week ago' +"%Y%m%d"`

MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_DB_NAME=''
MYSQL_USER=''
MYSQL_PASSWORD=''

# 암호를 노출하기 싫다면 암호화된 텍스트로 저장하여 불러올 수 있다.
# DB 접속 자체를 암호를 입력하지 않도록 설정을 해야할까?

# create backup directory
mkdir ${BAK_FILE_SAVE_PATH}/${BAK_FILE_DIRECTORY}

# backup start
        echo `date +"%Y-%m-%d %H:%M:%S"`" <<<"$backup_database" backup shell script start!>>>" >> ${BAK_FILE_SAVE_PATH}/${BAK_FILE_DIRECTORY}/${BAK_LOG_FILE_NM}
        mysqldump -h${MYSQL_HOST} --port ${MYSQL_PORT} -u${MYSQL_USER} -p${MYSQL_PASSWORD} --databases ${MYSQL_DB_NAME} > ${BAK_FILE_SAVE_PATH}/${BAK_FILE_DIRECTORY}/$backup_database${BAK_FILE_NM} 2>&1 &&
        echo `date +"%Y-%m-%d %H:%M:%S"`" <<<"$backup_database" backup shell script end!>>>" >> ${BAK_FILE_SAVE_PATH}/${BAK_FILE_DIRECTORY}/${BAK_LOG_FILE_NM}
        echo "" >> ${BAK_FILE_SAVE_PATH}/${BAK_FILE_DIRECTORY}/${BAK_LOG_FILE_NM}

# Delete 1Week Ago Script:
# rm -rf ${BAK_FILE_SAVE_PATH}/${WEEK_AGO}

echo "================================================"
echo "Mariadb Backup Batch End..."
echo "Process ID : $$ Finished"
echo "================================================"
