#!/bin/bash

# usage: bash $0 fastq
file=$1
if [[ "$file" == *".fq" || "$file" == *".fastq" ]]; then
  cat $file | awk '{if(NR%4==1) {seqid=$0; print}; if(NR%4==2){seq=$0; print}; if(NR%4==3){print}; if(NR%4==0){qual=$0; if(length(seq)==length(qual)) {print qual} else {print "sequence and quality not same length; sequence id - " seqid > "/dev/stderr"; exit}} }'
elif [[ "$file" == *".fq.gz" || "$file" == *".fastq.gz" ]]; then
  zcat $file | awk '{if(NR%4==1) {seqid=$0; print}; if(NR%4==2){seq=$0; print}; if(NR%4==3){print}; if(NR%4==0){qual=$0; if(length(seq)==length(qual)) {print qual} else {print "sequence and quality not same length; sequence id - " seqid > "/dev/stderr"; exit}} }'

fi
