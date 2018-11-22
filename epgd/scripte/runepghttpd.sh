#!/bin/sh
# Dieses Script startet den epgd http
export LANG="de_DE.UTF-8"

exec /sbin/setuser vdr /usr/local/bin/startepghttpd.sh
