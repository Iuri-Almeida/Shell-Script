#! /bin/bash

# abrindo varias portas

for p in $(seq 100); do sudo nc -lvp $p & done
