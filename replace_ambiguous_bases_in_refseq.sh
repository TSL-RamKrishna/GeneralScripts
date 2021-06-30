#!/bin/bash

refseq=$1
cat $refseq | awk '{if($1 ~ />/){print} else {sub("R", "A"); sub("B","C"); sub("M", "A"); sub("W", "A"); sub("S", "C"); sub("Y", "C"); sub("K", "G"); sub("K", "G"); sub("V", "A"); sub("H", "A"); sub("D", "A"); sub("B", "C"); print}}'

# sed can also be used to replace ambiguous base. command below will replace all ambiguous bases to N
# sed '/^[^>]/s/[R|Y|W|S|M|K|H|B|V|D]/N/g' input_file > output_file
