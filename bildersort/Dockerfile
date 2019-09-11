FROM ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update && apt-get full-upgrade -y && apt-get install -y \
    exiftool \
    mediainfo \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Setup rsync
EXPOSE 873

VOLUME /mnt/webdav
VOLUME /mnt/server
VOLUME /mnt/scripte

CMD [""]
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /entrypoint.sh
RUN chmod 744 /entrypoint.sh
