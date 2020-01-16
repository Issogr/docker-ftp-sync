#!/bin/bash

set -e

REMOTE_URL="$1"
REMOTE_USER="$2"
REMOTE_PASS="$3"
LOCAL_FOLDER="$4"

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
    read -p "Insert absolute path local output directory: " LOCAL_FOLDER

    if [ -d "$LOCAL_FOLDER" ]; then
        docker run -d -it --rm --name ftp-sync --device /dev/fuse --privileged -v "$LOCAL_FOLDER":/mnt/host "$REMOTE_URL" "$REMOTE_USER" "$REMOTE_PASS" issogr/ftp-sync:latest
    else
        echo -e "\n$LOCAL_FOLDER not exist\n"
    fi
fi
