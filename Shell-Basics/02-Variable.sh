#! /usr/bin/bash

v1=test-variable_123 # 全局变量
v2=12345
v3='This is a test!' # 赋值语句使用单引号或双引号可以包含空格
v4="Test again!"

testfun()
{
local v5=67890 # 局部变量
echo "局部变量：" $v5
}

echo $v1 # “$<变量名>”方式使用变量
echo $v2
echo $v3
echo ${v4} # “${<变量名>}”方式使用变量

testfun #调用自定义函数

v6="run unset sample"
echo "取消变量之前：" $v6
unset v6
echo "取消变量之后：" $v6

echo "双引号括起来的变量：$v3"
echo '单引号括起来的变量：$v3'





#   # 变量（Variable）
#   - Shell变量只有字符串类型
#   - Shell变量名称与变量值没有长度限制
#   
#   
#   ### 变量类型
#   - 局部变量：使用local修饰符，代码块或函数内可见。
#   - 全局变量：不适用任何修饰符，全局范围可见。
#   
#   
#   ### 定义变量
#   定义形式：<变量名>=<赋值语句>
#   注意：“=”两边不能加空格；如果赋值语句包含空格时，必须使用单引号或双引号
#   
#   
#   ### 使用变量
#   使用形式：$<变量名>
#   或者，${<变量名>},使用{}可以帮助解释器识别变量边界，非必须但推荐
#   
#   ### 取消变量
#   取消形式：unset <变量名>
#   
#   
#   ### 特别注意
#   被双引号括起来的变量会发生变量替换，而单引号则不会