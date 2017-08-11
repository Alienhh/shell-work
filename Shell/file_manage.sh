#!/bin/sh
#author:alienhh
#version:0.0.1
#folder、file
echo "要执行文件操作(y/n)?"
read is
if [ "$is" = "y" ];
then
	echo "要执行什么命令(mkdir/rm/mv/chmod)"
	read commond
	case $commond in
		"mkdir")
			echo "输入文件夹名字"
			read dictionary
			if [ -z "$dictionary" ] && echo "para is not set" && return
			[ -e "$dictionary" ] && echo "$dictionary exist" &&return
			mkdir $dictionary
			;;
		"rm")
			echo "rm"
			;;
	esac
else
	echo "input n"
fi
