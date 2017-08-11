#!/bin/sh
server=$1
if [ "$server" = "" ];then
	echo "require a server name"
else
	docker exec -it $(docker ps -a | grep $server | awk '{print $1}') /bin/sh
fi
