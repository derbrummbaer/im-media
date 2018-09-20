#!/bin/bash

# Dieses Script wird vor dem Programm start ausgeführt
# copy /etc/epgd /backup/etc/epgd
cp -a -v --no-clobber /backup/etc/epgd/* /etc/epgd
cp -a -v /backup/etc/epgd/*.dat /etc/epgd
cp -a -v /backup/etc/epgd/*.xml /etc/epgd
cp -a -v /backup/etc/epgd/*.xsl /etc/epgd
cp -a -v /backup/etc/epgd/*.sql /etc/epgd

# copy /var/epgd/www/channellogos /backup/var/epgd/www/channellogos
cp -a -v --no-clobber /backup/var/epgd/www/* /var/epgd/www

# copy /var/cache/epgd /backup/var/cache/epgd
cp -a -v --no-clobber  /backup/var/cache/epgd/* /var/cache/epgd

# Set the uid:gid to run as
[ "$USERID" ] && usermod  -o -u "$USERID" vdr
[ "$GROUPID" ] && groupmod -o -g "$GROUPID" vdr

chown -R root:vdr /etc/epgd
chown -R root:vdr /var/epgd
chown -R root:vdr /var/cache/epgd
chmod -R 775 /etc/epgd
chmod -R 775 /var/epgd
chmod -R 775 /var/cache/epgd
