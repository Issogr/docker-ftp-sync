#!/bin/bash

set -e

if [ -z "$REMOTE_URL" ]; then
	echo "Missing FTP Url"
	exit 1
elif [ -z "$REMOTE_USER" ]; then
	echo "Missing FTP User"
	if [ -z "$REMOTE_PASS" ]; then
	echo "Missing FTP Password of User:$REMOTE_USER"
	exit 1
	fi
else
	echo -e "\nEverything OK :)\nLets Sync!!\n"
	./sync.sh
fi

exit 0
