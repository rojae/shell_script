#!/bin/bash

# 화면 지우기 함수
init() {
    echo "================================"
    echo "RabbitMQ Queue Monitor"
    echo "Press Ctrl+C to exit"
    echo "================================"
}

# Print Description
init

# 메인 루프
while true; do
    rabbitmqctl list_queues name messages_ready messages_unacknowledged
    sleep 1
    ## clear
done