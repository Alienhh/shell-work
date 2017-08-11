#!/bin/bash
#Desc: generate shell script file 
#Author: Alienhh
#Date: 18/07/17
#Version: 1.0.0
function printUsage() {
    echo "USAGE: ./generage_shell_script.sh [filename]"
}
name_count=$#
if [ $name_count -eq 0 ]
then
	printUsage
	exit -1
else
	for i in "$@";do
		if [ -e $i.sh ]
		then
			echo "file $i.sh exist"
		else
			touch $i.sh
			chmod +x  $i.sh
		fi
	done
fi
