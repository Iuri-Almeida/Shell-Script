#! /bin/bash

if [ "$1" == "" ]; then exit; fi

echo

echo "Mensagem criptografada: $1"

echo

p1=$(echo $1 | tr "[a-z]" ' ')

p2=$(for i in $p1; do
	v=$(echo $i | grep "[1-9]")
	if [ "$v" != "" ]; then
		let count++
		echo $(($i / $count))
	else
		echo $i
	fi
done | tr '\n' ' ')

p3=$(for i in $p2; do
	v=$(echo $i | grep "[1-9]")
	if [ "$v" != "" ]; then
		echo {a..z} | tr -d ' ' | cut -b $i
	else
		echo $i
	fi
done | tr '\n' ' ' | tr 'za-y' 'a-z' | tr -d ' ' | tr ':' ' ' | tr -d '@')

echo "Mensagem descriptografada: $p3"
