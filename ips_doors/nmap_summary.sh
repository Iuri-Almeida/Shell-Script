#! /bin/bash

for ip in $(sudo nmap -sN -p 21,22,80 $(echo "$(ifconfig | grep broadcast | awk '{print $2}' | cut -d"." -f1-3).0/24") | grep "report for" | cut -d" " -f5); do
	sudo nmap -sS -F -O $ip > temp
	portas=$(cat temp | grep /tcp | cut -d"/" -f1 | tr '\n' ' ')
	if [ "$portas" == "" ]; then portas="Nenhuma porta aberta."; fi
	os=$(cat temp | grep "OS details" | cut -d" " -f3- | grep -v "fingerprints")
	if [ "$os" == "" ]; then os="Nenhum OS detectado."; fi

	echo "IP Ativo: $ip | Portas: $portas | Sistema Operacional: $os"

done

rm temp
