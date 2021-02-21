#! /bin/bash

if [ "$1" == "" ]; then
	echo "Uso: $0 word"
	exit
fi

echo "[INFO] Monitorando \"$1\" em pastebin.com"

echo

rm templinks 2>/dev/null

touch templinks

while :; do

	links=$(curl -s "https://pastebin.com/archive" | grep status | cut -d"\"" -f4 | tr -d '/')

	sleep 2

	for l in $links; do
		r=$(grep "$l" templinks)
		if [ "$r" == "" ]; then
			echo "$l" >> templinks
			r2=$(curl -s "https://pastebin.com/raw/$l" | grep "$1")
			if [ "$r2" != "" ]; then echo "https://pastebin.com/raw/$l"; fi
			sleep 2
		fi
	done

	sleep 5

done
