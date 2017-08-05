#! /usr/bin/bash
echo "hello shell!" # 打印字符串“hello shell!”





#   #! --- 指定解释器路径
#   echo --- display a line of text
#   # --- 单行注释，Shell不支持多行注释
#   
#
#   执行脚本的方法
#   1. 使用chmod命令为脚本文件添加可执行权限，然后直接执行（脚本内需要指定解释器路径）
#   2. 通过“bash test.sh”方式将脚本作为解释器的参数，直接调用解释器
#   3. 使用source命令或"."执行文件，例如“source test.sh”（在父进程中直接执行，不会创建子进程）
#   
#   
#   示例：查看可用shell
#   # cat /etc/shells
#   /bin/sh
#   /bin/bash
#   /sbin/nologin
#   /usr/bin/sh
#   /usr/bin/bash
#   /usr/sbin/nologin
#   /bin/tcsh
#   /bin/csh
#   # 
#   
#   
#   示例：查看shell版本
#   # bash --version
#   GNU bash, version 4.2.46(1)-release (x86_64-redhat-linux-gnu)
#   Copyright (C) 2011 Free Software Foundation, Inc.
#   License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
#   
#   This is free software; you are free to change and redistribute it.
#   There is NO WARRANTY, to the extent permitted by law.
#   # 
