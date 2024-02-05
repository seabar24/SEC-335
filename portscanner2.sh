#!/bin/bash
# Reference: https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-aliasportfile=$2

hostprefix=$1
port=$2

# Checks if there are 2 parameters
if [[ -n $1 ]] && [[ -n $2 ]]; then

# Checks if user wants output to .csv file
read -r -p "Output to .csv file? (y/n)" csv
if [[ $csv =~ ^([yY]) ]]; then
	echo "ip,port" >> portscanned2.csv
fi

for prefix in $(seq 1 254); do
	host=$hostprefix.$prefix
	
	timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
	echo -e "Host: $hostprefix.$prefix\nOpen Port(s): $port" &&
	 
	if [[ "$csv" =~ ^([yY]) ]]; then
		echo "$host,$port" >> portscanned2.csv
	fi	
done

else
	echo "You need to enter paramters for the "host,port" files!"
fi
