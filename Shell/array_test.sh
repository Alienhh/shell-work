#!/bin/sh
echo "数组测试"
array1=(1 2 'W' "M")
echo "数组元素为:${array1[*]}"
echo "数组元素为:${array1[@]}"
echo "数组元素个数为:${#array1[*]}"
echo "数组元素个数为:${#array1[@]}"
array2[0]=A
array2[1]=B
array2[2]=C
array2[3]=D
echo "数组元素个数为:${#array2[@]}"
