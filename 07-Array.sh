#!/bin/bash

test0=() # 定义数组

test1=(a b c d e f) # 定义数组

test2=( # 定义数组
'A?'
"BB!"
CCC
)

test1[0]=000 # 单独定义数组的元素，重定义元素
test1[1]=111
test1[2]=222
test1[6]=ggg # 单独定义数组的元素，添加元素
test1[9]=999 # 可以使用不连续的下标，而且下标的范围没有限制

echo '读取指定下标的元素 ${test1[0]}: ' ${test1[0]}
echo '读取指定下标的元素 ${test1[6]}: ' ${test1[6]}

echo '读取数组中的所有元素 ${test0[@]}: ' ${test0[@]}
echo '读取数组中的所有元素 ${test1[*]}: ' ${test1[*]}
echo '读取数组中的所有元素 ${test2[*]}: ' ${test2[*]}

echo '读取数组中的下标列表 ${!test1[*]}: ' ${!test1[*]}
echo '读取数组中的下标列表 ${!test2[@]}: ' ${!test2[@]}

echo '读取数组中指定范围的元素 ${test1[@]:2}: ' ${test1[@]:2}
echo '读取数组中指定范围的元素 ${test1[@]:2:4}: ' ${test1[@]:2:4}

echo "数组test0中元素的个数为：" ${#test0[@]}
echo "数组test1中元素的个数为：" ${#test1[*]}
echo "数组test2中下标为2的元素长度为：" ${#test2[2]}


# 标准for循环遍历数组
for(( i=0;i<${#test2[@]};i++))
do
  echo "Array-test2 value: "  ${test2[i]}
done;
# for-in循环遍历数组
for element in ${test2[@]}
do
  echo "Array-test2 value: "  $element
done
# for-in循环遍历数组（带数组下标）
for i in "${!test2[@]}";   
do   
    printf "Array-test2 index-%s:\t%s\n" "$i" "${test2[$i]}"  
done 


test3=(aaa bbb ccc ddd eee fff ggg)
echo '读取数组中的所有元素 ${test3[*]}: ' ${test3[*]}
unset test3[0] # 删除指定元素
echo '读取数组中的所有元素 ${test3[*]}: ' ${test3[*]}
unset test3 # 删除所有元素
echo '读取数组中的所有元素 ${test3[*]}: ' ${test3[*]}


declare -A assArray # 定义关联数组
assArray=([1st]=aaa [2nd]=bbb) # 添加元素到关联数组
assArray[3rd]=ccc # 添加元素到关联数组

echo '读取关联数组指定索引的值 ${assArray[1st]}: ' ${assArray[1st]}
echo '读取关联数组的下标列表 ${!assArray[*]}: ' ${!assArray[*]}
echo '读取关联数组的下标列表 ${!assArray[@]}: ' ${!assArray[@]}
echo '读取关联数组的所有的值 ${assArray[*]}: ' ${assArray[*]}
echo '读取关联数组的所有的值 ${assArray[@]}: ' ${assArray[@]}
echo '读取关联数组键值对的个数 ${#assArray[*]}: ' ${#assArray[*]}
echo '读取关联数组键值对的个数 ${#assArray[@]}: ' ${#assArray[@]}

# 读取关联数组的所有键值对
for key in ${!assArray[*]}
do
  echo "关联数组键值对  ${key} ：${assArray[$key]}"
done


#   ### 定义数组
#   - Bash Shell只支持一维数组，没有限定数组的大小；
#   - 用括号来表示数组，元素用"空格"符号分割开，定义形式为“数组名=(值1 值2 ... 值n)”;
#   
#   
#   ### 读取数组
#   - 数组元素的下标由0开始编号，利用下标读取数组中的元素，读取形式为“${数组名[下标]}”；
#   - 数组的下标可以是整数或算术表达式，其值大于或等于0；
#   - 使用下标为@符号或*符号可以读取数组中的所有元素，读取形式为“${数组名[@]}”；
#   - 读取数组中指定范围的元素，读取形式为“${数组名[@或*]:起始下标:长度}”
#   
#   
#   ### 获取数组元素的个数
#   - 获取数组元素的个数的方法与获取字符串长度的方法相同;
#   
#   
#   ### 删除数组元素
#   - 删除形式为“unset 数组名[下标]”，如果使用下标则删除全部元素；
#   
#   
#   ### 关联数组（Associative Array）
#   - 使用字符串作为数组下标；
#   - 关联数组的下标和值一一对应，称为键值对；键是唯一的，值可以不唯一；
#   - 使用关联数组之前，需要使用“declare -A 变量名”命令显示声明为关联数组；
#   - 关联数组的操作语法和数组的操作语法基本一致；
