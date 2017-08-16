#!/bin/bash

### 远程服务器信息
remoteUser="root"
remoteNode="192.168.16.10" # ip or dnsname
scriptFile="/root/test.sh"


### 在远程服务器上执行简单命令
ssh ${remoteUser}@${remoteNode} "uname -a; uptime" # 查看远程服务器的系统版本信息和启动时间
# 如果不加双引号，第二个命令在本地执行;两个命令之间用分号隔开


### 执行远程服务器上的脚本
ssh ${remoteUser}@${remoteNode} "$scriptFile" # 执行远程脚本（脚本必须具有有执行权限，而且脚本中只能使用绝对路径）
ssh ${remoteUser}@${remoteNode} "$scriptFile &" # 以后台方式执行远程脚本


### 在远程服务器上执行多个命令
# ssh ${remoteUser}@${remoteNode} > /dev/null 2>&1 & <<!!! # 重定向，不显示远程的输出
ssh ${remoteUser}@${remoteNode} <<!!!
pwd
uname -a
uptime
free -m
df -h
exit
!!!





#   ### 常用ssh命令
#   - 登录远程主机:“ssh hostname”，主机名可以是IP地址或域名；
#   - 指定登录用户:“ssh user@hostname”；
#   - 指定登录用户和端口：“ssh -p <port number> user@hostname”；
#   - 指定本地用于ssh连接的地址：“ssh -b <local ip> hostname”；
#   - 打开调试模式，追踪调试SSH连接建立情况：“ssh -v hostname”；
#   
#   
#   ### ssh免密登录
#   - 默认情况下，每次执行远程命令或脚本，都需要输入远程服务器的登录密码；
#   - 通过配置SSH免密登录的方式，可以避免多次重复的输入密码；