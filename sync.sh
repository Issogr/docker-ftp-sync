#!/bin/bash

set -e

FTP_DIR="/mnt/ftp"
HOST_DIR="/mnt/host"
#TMP_SYNC="/var/tmp/rsync"

#FTP mount like external device
echo -e "\nFTP Partition Mounting\n"
curlftpfs "$REMOTE_USER":"$REMOTE_PASS"@"$REMOTE_URL" "$FTP_DIR"

# Rsync
echo -e "\nRsync Execution\n"
rsync -arzvP "$FTP_DIR" "$HOST_DIR"

#Rsync with TMP
#rsync -arzvP --temp-dir="$TMP_SYNC" "$FTP_DIR" "$HOST_DIR"
