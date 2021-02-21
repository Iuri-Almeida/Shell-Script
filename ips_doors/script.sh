#! /bin/zsh

echo "ip externo: $(curl -s ifconfig.co)"

echo "ip interno: $(ifconfig | grep broadcast | tr ' ' ';' | cut -d ';' -f2)"

[ -e /usr/bin/nmap ] && echo "portas abertas: $(nmap 127.0.0.1 | grep open | cut -d '/' -f1 | tr '\n' ', ')"
