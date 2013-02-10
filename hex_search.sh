#!/bin/sh
#assigning file to the variable
pcap=$1
#assigning hex stream to the variable
hex=$2
#adding \x to the each byte
hex_x=`echo $2 | sed 's/\s*//g' | sed 's/\([a-f0-9][a-f0-9]\)/\\\x\1/gi';`
#extract all x's for count
extract_x="${hex_x//[^x]}"
#count the no.of x's
hex_count=`echo "${#extract_x}"`
#changing file into hex stream
od_out=`od -A n -t x1 $pcap`
#defining a variable to reduce given hex stream till 3 bytes
c=3
#compare given hex stream in file by decreasing each byte from RHS
while [[ $c -lt $hex_count ]];
        do
            dec_hex=$(echo $hex_x | cut -d "\\" -f -$hex_count)
            rem_hex=$(echo $dec_hex | sed 's/\\x/ /g')
            if [[ $od_out =~ $rem_hex ]]; then
                echo $rem_hex "Match"
                break;
            else
                echo $rem_hex ":Not match"
            fi
            hex_count=$(( $hex_count-1 ))
        done