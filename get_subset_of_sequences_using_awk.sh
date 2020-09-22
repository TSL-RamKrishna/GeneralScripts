#!/bin/bash

# awk command to get few sequences of sequences from a large fasta with many many sequences.
# here only 10 sequences are obtained
# usage: bash $0 10 input.fasta output.fasta

number=$1
input=$2
output=$3

awk -v number=$number 'BEGIN{count=0}{if($1 ~/>/){count=count+1;seqid=$0;   if(count > number){exit} else {print seqid}}  else { print $0}}' $input > $output

echo "Output to the file $output"
