#!/bin/bash
set -e

case "$1" in
	handy)
		echo "Handy Script gewählt"
		cd /mnt/scripte/handy
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
		cd /mnt/scripte/kamera
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
