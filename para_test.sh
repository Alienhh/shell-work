#!/bin/sh
echo "传递到脚本的参数个数:$#"
echo "以一个单字符串显示所有向脚本传递的参数:$*"
echo "脚本PID:$$"
echo "后台运行的最后一个进程ID:$!"
echo "脚本的参数:"
for i in "$*";do
	echo $i
done
echo "shell的当前选项:$-"

