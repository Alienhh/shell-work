#!/bin/zsh
#Desc: generate shell script file 
#Author: Alienhh
#Date: 18/07/17
#Version: 1.0.0
function printUsage() {
    echo "usage: ./generage_shell_script.sh [filename]"
}
script_file_name=$1
if [ "$script_file_name" = "" ]; then
    printUsage
else
	touch $script_file_name.sh
	chmod +x  $script_file_name.sh
fi
