#!/bin/bash

SHELL_NAME="test.sh"
SHELL_DIR="./"
LOG_FILE="${SHELL_DIR}/${SHELL_NAME}.log"

shell_log(){ # 利用自定义日志函数记录日志
    LOG_INFO=$1 # 将需要记录的日志内容作为第一个参数传递
    echo "[ $(date "+%Y-%m-%d") $(date "+%H-%M-%S") ]  ${SHELL_NAME} : ${LOG_INFO}" >> ${LOG_FILE}
}

shell_log "test row 1"
shell_log "test row 2"

cat ${LOG_FILE}
rm -rf ${LOG_FILE}