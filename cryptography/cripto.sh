#! /bin/bash

num() { echo {a..z} | cut -d"$1" -f1 | tr ' ' '\n' | wc -l ; }

letra() { echo {a..z} | tr -d ' ' | cut -b $((($RANDOM%25)+1)) ; }

if [ "$1" == "" ]; then exit; fi

echo

echo "Mensagem digitada: $1"

echo

p1=$(echo "$1" | tr 'a-z' 'za-y' | tr ' ' ':' | tr '\n' '@')

p2=$(for i in $(seq $(echo -n $p1 | wc -c )); do
	c=$(echo $p1 | cut -b $i)
	v=$(echo $c | grep "[a-z]")
	if [ "$v" != "" ]; then num $c; else echo $c; fi
done | tr '\n' ' ')

p3=$(for i in $p2; do
	v=$(echo $i | grep "[1-9]")
	if [ "$v" != "" ]; then
		let count++
		echo $(($count * $i))$(letra)
	else
		echo $i$(letra)
	fi
done | tr -d '\n')

echo "Mensagem criptografada: $p3"

echo
