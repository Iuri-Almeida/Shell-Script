#! /bin/bash

# redirecionando as informacos da porta 80 pra porta 443

while :; do sudo nc -lkvvp 80 | sudo nc -lkvvp 443; done
