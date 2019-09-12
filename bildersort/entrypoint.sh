#!/bin/bash
set -e

mkdir /usr/local/bin/scripte

case "$1" in
	handy)
		echo "Handy Script gewählt"
		## Config Einlesen
		. /mnt/scripte/handy/config
		cp -r $mv_scripte/handy/* $rn_scripte/handy
		cd $rn_scripte/handy
		chmod +x *.sh
		echo "Scripte"
		ls -lah
		echo "WebDav"
		ls -lah /mnt/webdav
		echo "Scripte"
		ls -lah /mnt/scripte/handy
		echo "Server"
		ls -lah /mnt/server
		echo "Starte Sortierung"
		# bash ./run.sh > /mnt/srcipte/handy/last.log
		./run.sh
		;;
	kamera)
 		echo "Kamery Script gewählt"
		## Config Einlesen
		. /mnt/scripte/kamera/config
		cp -r $mv_scripte/kamera/* $rn_scripte/kamera
		cd $rn_scripte/kamera
		chmod +x *.sh
		echo "Scripte"
		ls -lah
		echo "WebDav"
		ls -lah /mnt/webdav
		echo "Scripte"
		ls -lah /mnt/scripte/kamera
		echo "Server"
		ls -lah /mnt/server
		echo "Starte Sortierung"
		# bash ./run.sh > /mnt/srcipte/kamera/last.log
		./run.sh
		;;
	*)
 		echo "Kein Script gewählt"
		;;
esac
		
		
#exec "$@"
