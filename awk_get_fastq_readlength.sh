#!/bin/bash
cat fastq | awk '{if(NR%4==1){seqid=$0; sub("@", "", $0); print $0} else if  (NR%4==2){print length($0)}}' | paste - -
