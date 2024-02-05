#!/bin/bash
# Reference: https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-aliasportfile=$2

hostfile=$1
portfile=$2

# Checks if there are 2 parameters
if [[ -n $1 ]] && [[ -n $2 ]]; then

# Checks if user wants output to .csv file
read -r -p "Output to .csv file? (y/n)" csv
if [[ $csv =~ ^([yY]) ]]; then
	echo "host,port" >> portscanned.csv
fi

for host in $(cat $hostfile); do
	# List of open ports from hostfile
	openports=()
	echo "Host: $host"

	for port in $(cat $portfile); do
		timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
		openports+="$port," &&
			 
		if [[ "$csv" =~ ^([yY]) ]]; then
			echo "$host,$port" >> portscanned.csv
		fi	
	done
	#Prints out each open port within the list of openports
	echo "Open Ports: $openports" | sed 's/,$//'
	echo "---"
done


else
	echo "You need to enter paramters for the "host,port" files!"
fi
