
# Docker ftp-sync

![logo](https://raw.githubusercontent.com/Issogr/docker-ftp-sync/master/image.png)

## Overview

ftp-sync is a dedicated docker container to to execute local synchronization of a remote ftp resource.

## Build the Docker image locally

``` bash
git clone https://github.com/PizzaHack/docker-ftpsync.git
cd docker-ftpsync/
docker build -t ftp-sync .
```

## Requirements to continue

To use the container you need:

- REMOTE_URL
- REMOTE_USER
- REMOTE_PASS
- LOCAL_FOLDER (absolute path)

### Using directly

``` bash
docker run -d -it --rm --name ftp-sync --device /dev/fuse --privileged -v "LOCAL_FOLDER":/mnt/host -e REMOTE_URL='' -e REMOTE_USER='' -e REMOTE_PASS='' issogr/ftp-sync:latest
```

This piece of command is NOT optional and /mnt/host is unmutable

``` bash
-v "LOCAL_FOLDER":/mnt/host
```

You need to specify the REMOTE variables and local folder

### Using tools script

``` bash
./docker-run.sh REMOTE_URL REMOTE_USER REMOTE_PASSWORD LOCAL_FOLDER
```

After command executing, you will be asked for output directory.

## TODO

- [ ] Multi FTP sync
- [ ] Exlude FTP file
- [ ] Exlude FTP directory

## Credits

Project inspired by the work of Valuya:  [docker-volume-curlftpfs](https://github.com/Valuya/docker-volume-curlftpfs)
