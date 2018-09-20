#!/bin/sh
# Dieses Script startet den epgd
export LANG="de_DE.UTF-8"

exec /sbin/setuser vdr /usr/local/bin/startepgd.sh
