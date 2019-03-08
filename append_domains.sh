#!/bin/sh

words_file="$1"
domains_file="$2"
output_file="$3"

if [ $# -lt 2 ]; then
    echo "Append domains to each word in a word file and write to stdout or given output file"
    echo
    echo "Usage:"
    echo "\t$0 words_file domains_file [output_file]"
    echo
    echo "\tdomains can be read from stdin, put - for the argument"
    exit 0
fi

# disable wildcard expansion
set -f

# check if read from domain list file or stdin
if [ $domains_file == "-" ]; then
	domains_file="/dev/stdin"
fi

if [ -z $output_file ]; then
	output_file="/dev/stdout"
fi

# read all subdomains
while read domain; do
	sed 's/^\.//g' "$words_file" | sed 's/\.$//g' | 
            awk '{print $0"'.$domain'"}' >> "$output_file"
done < "$domains_file"
