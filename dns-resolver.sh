#!/bin/bash

network_prefix=$1
dns=$2

echo "dns resolution for $network_prefix"

for prefix in $(seq 1 254); do
	nslookup $network_prefix.$prefix $dns 2>/dev/null | egrep '^[[:digit:]]'
done
