#!/bin/bash

# awk command to get few sequences of sequences from a large fasta with many many sequences.
# here only 10 sequences are obtained
number=10
awk -v number=number 'BEGIN{count=0}{if($1 ~/>/){count=count+1;seqid=$0;   if(count > number){exit} else {print seqid}}  else { print $0}}' large_sequences.fa > few_seqs.fasta
