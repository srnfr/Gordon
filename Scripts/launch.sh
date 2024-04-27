#!/bin/bash
set -x
#Usage: ./launch.sh <target URL> <Index number - for repeated tests>

sudo ifconfig ingress mtu 296
gcc -Wall -o prober ../probe.c -lnfnetlink -lnetfilter_queue -lpthread -lm

echo "0 0 0" > ../Data/windows.csv

echo "0 0" > ../Data/buff.csv

for i in {1..10}
do

	sudo iptables -I INPUT -p tcp -d 100.64.0.2 -m state --state ESTABLISHED -j NFQUEUE --queue-num 0
	echo "--------------------------------- RTT-$i ----------------------"
	sudo ./prober "$1" 8000 5000 1000 >> ../Data/buff.csv
	sleep 2
	rm -f index*
 	rm -f *MB.bin*
	sudo iptables --flush
	sleep 3
done

