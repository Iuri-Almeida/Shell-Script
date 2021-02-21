#! /bin/bash

# enviando dados aleatorios para o nmap

while :; do
	cat /dev/urandom | sudo nc -lvp 80
done
