#!/bin/bash

for ip in $(seq 2 50)
do
	UpIP=$(ping -c 1 -i .02 10.0.5.$ip | grep "100% packet loss")
	if [[ -z $UpIP ]]
	then 
		echo "10.0.5.$ip" >> ./sweep.txt
	fi
done
