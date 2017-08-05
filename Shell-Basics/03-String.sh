#! /usr/bin/bash

str="Shell"
str2="Hello $str !"
str3="Hello ${str} !"

echo "拼接字符串: $str2"
echo "拼接字符串: $str3"

test1="一二三四五六七八九零"
echo '$var,返回变量值：' $test1
echo '${#var},返回变量字符串长度：' ${#test1}

echo '#{var:start_index},截取字符串：' ${test1:2}
echo '#{var:start_index},截取字符串：' ${test1:0-3}
echo '#{var:start_index:length},截取字符串：' ${test1:3:5}

test2="http://192.168.1.1/index.htm"
echo '#{var#string},截取字符串：' ${test2#*/}
echo '#{var##string},截取字符串：' ${test2##*/}
echo '#{var%string},截取字符串：' ${test2%/*}
echo '#{var%%string},截取字符串：' ${test2%%/*}