#!/bin/bash

refseq=$1
cat $refseq | awk '{if($1 ~ />/){print} else {sub("R", "A"); sub("B","C"); sub("M", "A"); sub("W", "A"); sub("S", "C"); sub("Y", "C"); sub("K", "G"); sub("K", "G"); sub("V", "A"); sub("H", "A"); sub("D", "A"); sub("B", "C"); print}}'
