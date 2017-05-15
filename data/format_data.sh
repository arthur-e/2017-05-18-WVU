#!/bin/bash

set -e

infile=$1
outfile=$2

tempfile=$(tail -n+3 ${infile} | cut -f 2 | sed 's/ *//')

i=1

while read temp; do
    printf $temp
    if [[ i -eq 12 ]]; then
        i=1
        printf '\n'
    else
        printf ','
        i=$((i + 1))
    fi
done <<< $tempfile > $outfile
