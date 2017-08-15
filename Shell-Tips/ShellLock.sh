#!/bin/bash

SHELL_NAME="test.sh"
LOCK_FILE="/tmp/${SHELL_NAME}.lock" # 利用自定义锁限制脚本执行

lock_on(){
    touch ${LOCK_FILE}
}

lock_off(){
    rm -f ${LOCK_FILE}
}

run_script(){
    if [ -f "$LOCK_FILE" ];then
        echo "The file lock exist. The ${SHELL_NAME} is running!" && exit
    fi
    lock_on
    echo "${SHELL_NAME} start"
    sleep 5 # 实现特定功能
    echo "${SHELL_NAME} stop"
    lock_off
}

run_script



#   ### 完善功能
#   - 利用while循环实现重试机制；
#   - 通过设置重试次数或时间，来建立退出机制；