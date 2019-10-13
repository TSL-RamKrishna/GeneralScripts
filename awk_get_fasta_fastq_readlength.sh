#!/bin/bash
file=$1

if [[ "$file" == *".faa" || "$file" == *".fasta" || "$file" == *".fa" ]]; then
    cat $file | awk '{if(NR%2==1){seqid=$0; sub(">", "", $0); print $0} else if  (NR%2==0){print length($0)}}' | paste - -
elif [[ "$file" == *".faa.gz" || "$file" == *".fasta.gz" || "$file" == *".fa.gz" ]]; then
    zcat $file | awk '{if(NR%2==1){seqid=$0; sub(">", "", $0); print $0} else if  (NR%2==0){print length($0)}}' | paste - -
elif [[ "$file" == *".fq" || "$file" == *".fastq" ]]; then
    cat $file | awk '{if(NR%2==1){seqid=$0; sub("@", "", $0); print $0} else if  (NR%4==2){print length($0)}}' | paste - -
elif [[ "$file" == *".fastq.gz" || "$file" == *".fq.gz" ]]; then
    zcat $file | awk '{if(NR%4==1){seqid=$0; sub("@", "", $0); print $0} else if  (NR%4==2){print length($0)}}' | paste - -
else:
    echo "Unable File Extension. FASTA format file extensions - faa, fasta or fa, FASTQ file extensions - fq, fastq"
    echo "File can be gzipped with .gz extension"
fi
