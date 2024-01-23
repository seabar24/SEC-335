# /bin/bash

input="mydomainfiles.txt"
counter=0

while read -r line
do
	curl "${line}" -o "/home/champuser/Desktop/metagoo_out/${counter}.pdf"
       	let counter++
done < "${input}"
