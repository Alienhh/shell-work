#!/bin/zsh
#产生脚本文件
script_file_name=$1
if [ "$script_file_name" = "" ]; then
	echo "file name can't null"
else
	touch $script_file_name.sh
	chmod +x  $script_file_name.sh
fi
