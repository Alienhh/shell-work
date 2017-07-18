#!/bin/bash
time=$(date +"%y-%m-%d")
pwd=`pwd`
pre=$pwd"/dump"
host=127.0.0.1
port=3306
user=alienhh
pwd=123456asd
database=spider
if [ ! -d "$pre/$time" ]
then
    sudo mkdir -p $pre/$time
    chmod -R 775 $pre/$time
    echo "create $pre/$time"
else
    echo "$pre/$time exist"
fi
if [ -d "$pre/$time" ]
then
    sudo mysqldump -h$host -P$port -u$user -p$pwd $database > $pre/$time/$database.sql
    echo "mysql back end"
else
    echo "can't find backup file"
fi 
