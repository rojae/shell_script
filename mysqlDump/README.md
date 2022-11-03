# mysqldump
- Mysql Dump Bash Script
- /bin: 실행 파일
- /cron: crontab 수행 로그 파일
- /db_backup_files: dump, log 파일

```bash
#---------------------------------------------------------#
#----------- MarriaDB Backup Batch Service ---------------#
#---------------------------------------------------------#

0 0 * * * sh /home/mysql/mysqldump/bin/mysqlBackupRunner.sh > /home/mysql/mysqldump/cron/`date "+\%Y\%m\%d_\%H\%M\%S"`.log 2>&1
```
