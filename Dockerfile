FROM bitnami/minideb:buster
LABEL maintainer="grossisimone@outlook.it"

RUN apt-get update
RUN apt-get --no-install-recommends -y install curlftpfs ftp rsync
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN echo "user_allow_other" >> /etc/fuse.conf
RUN mkdir -p /mnt/host /mnt/ftp

ENV REMOTE_URL=""
ENV REMOTE_USER=""
ENV REMOTE_PASS=""

COPY ./entrypoint.sh /
COPY ./sync.sh /

RUN chmod +x entrypoint.sh
RUN chmod +x sync.sh

ENTRYPOINT ["/entrypoint.sh"]