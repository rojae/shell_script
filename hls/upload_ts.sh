#!/bin/bash
LOCAL_FILE=$1

REMOTE_IP=''
REMOTE_ID=''
REMOTE_PWD=''
REMOTE_HLS_DIR='/mnt/hls/'

BASENAME=$(basename ${LOCAL_FILE})
BASENAME=${BASENAME%.*}

# Upload Mp4 Bash Script
sshpass -p $REMOTE_PWD scp -r $LOCAL_FILE $REMOTE_ID@$REMOTE_IP:$REMOTE_MP4_DIR;

# Local ts file directory
mkdir ./$BASENAME

# Encoding Mp4 to m3u8, ts files
sudo ffmpeg \
    -i $LOCAL_FILE \
    -start_number 0 \
    -hls_init_time 0 \
    -hls_time 2 \
    -hls_list_size 10000 \
    -f hls ./$BASENAME/$BASENAME.m3u8;

# Upload ts files to Remote Server
sshpass -p $REMOTE_PWD scp -r ./$BASENAME/* $REMOTE_ID@$REMOTE_IP:$REMOTE_HLS_DIR;

mv $LOCAL_FILE ../

echo 'DONE';
exit 0;