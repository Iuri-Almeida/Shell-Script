#! /bin/bash

ho=$(md5sum index.html | cut -d" " -f1)

mkdir backup 2>/dev/null

cp index.html backup/index.html

while :; do
	ha=$(md5sum index.html 2>/dev/null | cut -d" " -f1)
	sleep 0.3
	if [ "$ha" != "$ho" ]; then
		echo "Recuperando arquivo original"
		cp backup/index.html index.html
	fi
done
