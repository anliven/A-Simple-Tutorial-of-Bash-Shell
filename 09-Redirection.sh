#!/bin/bash

pwd > 1.log # 输出重定向到指定文件
date 1> 1.log # “>”与“1>”作用相同；覆盖指定文件的原有内容
date >> 1.log # 追加内容到指定文件的末尾
echo "1.log: " `cat 1.log`

echo -e "one\ntwo\nthree" > 2.log
echo "Number of rows:" `wc -l < 2.log` # 输入重定向；统计2.log文件内容的行数
echo "2.log: " `cat 2.log`

echo -e "111\n222\n333" > 3.log
echo "3.log: " `cat 3.log`
wc -l < 3.log > 4.log # 同时重定向输入和输出，从3.log读取输入，然后将输出写入到4.log
echo "4.log - Number of rows:" `cat 4.log`

rm -rf 123 # 确保文件不存在
ls 123 2> 5.log # 错误重定向到指定文件
ls 123 2>> 5.log # 追加内容到指定文件的末尾
echo "5.log: " `cat 5.log`

ls 123 >> 6.log 2>&1 # 将stdout和stderr合并后重定向到指定文件
pwd >> 6.log 2>&1 # 将stdout和stderr合并后重定向到指定文件
echo "6.log: " `cat 6.log`

ls 123 2>> 7.log >> 8.log # 分别重定向到指定文件
pwd 2>> 7.log >> 8.log
echo "7.log: " `cat 7.log`
echo "8.log: " `cat 8.log`

ls 123 2>&1 | tee 9.log # tee命令实现双重定向
ls 123 2>&1 | tee -a 9.log # tee命令的追加方式
echo "9.log: " `cat -n 9.log`

pwd > /dev/null # 屏蔽stdout
ls /root > /dev/null 2>&1 # 屏蔽stdout和stderr

rm -rf [0-9].log

# Here-document
cat << !
abc
123
ABC
!
# 将两个delimiter(这里使用!符号)之间的内容(document) 作为输入传递给command

# Here-strings
teststr="This is a test"
cat -n <<< $teststr





#   ### 标准
#   - 标准输入(stdin)的文件描述符为0，默认从stdin读取数据，使用方式为“<”;
#   - 标准输出(stdout)的文件描述符为1，默认向stdout输出数据，使用方式为“>”(“>”等价于“1>”);
#   - 标准错误(stderr)的文件描述符为2，默认向stderr中写入错误信息，使用方式为“2>”;
#   
#   ### 重定向
#   - “command > file”：标准输出(stdout)重定向到指定文件，覆盖指定文件的原有内容，“>”等价于“1>”；
#   - “command >> file”：标准输出(stdout)重定向到指定文件，追加内容到指定文件的末尾
#   - “command 2> file”：标准错误(stderr)重定向到指定文件，覆盖指定文件的原有内容
#   - “command 2>> file”：标准错误(stderr)重定向到指定文件，追加内容到指定文件的末尾
#   - “command > file 2>&1”：将stderr合并到stdout，然后重定向到指定文件，覆盖指定文件的原有内容
#   - “command >> file 2>&1”：将stderr合并到stdout，然后重定向到指定文件，追加内容到指定文件的末尾
#   - “command < file”：从标准输入(stdin)获取内容重定向到从指定文件中获取内容，“<”等价于“0<”； 
#   
#   ### 双重定向
#   - tee命令：从标准输入设备读取数据，将其内容输出到标准输出设备，同时重定向内容到指定文件；
#   - 选项“-a”，追加方式重定向内容到文件；
#   - 选项“-i”，忽略中断信号；
#   - 特别注意：和管道组合使用时，前一个命令的标准错误输出默认不会被tee读取。如果想标准错误也被tee读取，可以通过“2>&1”的方式；
#   
#   ### Here-document
#   - 特殊的重定向方式，用来将输入重定向到一个交互式Shell脚本
#   - 作用是将两个delimiter之间的内容(document)作为输入传递给command
#   - 开始的delimiter前后的空格会被忽略
#   - 结尾的delimiter必须顶格写，前后不能有任何字符，包括空格和 tab 缩进
#   
#   ### Here-strings
#   - <<<,与Here-document类似
#   
#   ### “/dev/null”文件
#   - 写入到“/dev/null”文件的内容都会被丢弃；
#   - 也无法从该文件读取内容；



#   ### 总结
#   >	  输出重定向，先清空原内容，再添加内容
#   >>	  输出追加重定向，直接追加内容
#   <	  输入重定向，先清空原内容，再添加内容
#   <<	  输入追加重定向，直接追加内容
#   :> file                清空文件，如果文件不存在则创建空文件，等价于“> file”；
#   command >| file        强制重定向，强制重写已经存在的文件
#   command <file1 >file2  将指定文件file1中的内容作为stdin，将stdout重定向到file2
#   command m>&n   把输出到文件描述符m的信息重定向到文件描述符n；
#   command m<&n   文件描述符n的信息输入重定向到文件描述符m；
#   command >&n    把标准输出重定向到文件描述符n；
#   command <&n    标准输入来自文件描述符n；
#   command >&-    关闭标准输出；
#   command <&-    关闭标准输入；