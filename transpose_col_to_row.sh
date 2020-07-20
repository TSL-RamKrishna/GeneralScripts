#!/bin/bash
#usage: bash $0 csvfile

csvfile=$1

count=1;
while read line; do
  echo $line | tr -s ',' '\n' > transpose${count}.tmp; 
  count=$((count+1));  
done < ${csvfile} ;

paste transpose*.tmp

rm transpose*.tmp
