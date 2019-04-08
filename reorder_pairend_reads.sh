#!/bin/bash
# In situations where you have large fastq paired end reads, but the sequences in R1 are not in the same order as in R2 or vice versa
# You can reorder the sequences with this script.
# But if the R1 and R2 are small files, less than 3 gb, then you can use this command rather this script.
# cat $R1 | paste - - - - | sort | awk '{print $1"\n"$2"\n"$3"\n"$4}' > sorted_R1.fastq
# cat $R2 | paste - - - - | sort | awk '{print $1"\n"$2"\n"$3"\n"$4}' > sorted_R2.fastq

# once again use the below code for very large fastq files.

#Usage: bash reorder_pairend_reads.sh read1.fastq read2.fastq

R1=$1
R2=$2

echo "Working on Read1"

cat $R1 | paste - - - - | awk '{print $1}' | sort > seqids.txt
cat $R1 | paste - - - - > reformated_read1.txt ; split --suffix-length 5 --additional-suffix _seqids  -l 100 seqids.txt ;  split --suffix-length 5 --additional-suffix _reads -l 1000 reformated_read1.txt ; rm reformated_read1.txt;
if test -e reordered_R1.fastq; then rm reordered_R1.fastq; fi
for seqid in *_seqid; do for read in *_reads; do grep -w -f $seqid --no-group-separator  $read >> reordered_R1.fastq; done; done
cat reordered_R1.fastq |  awk '{print $1"\n"$2"\n"$3"\n"$4}' > sorted_R1.fastq; rm reordered_R1.fastq

echo "Read1 completed. Now deleting temp files"
rm seqids.txt
rm *_seqids *_reads


echo "Working on Read2"

cat $R2 | paste - - - - | awk '{print $1}' | sort > seqids.txt
cat $R2 | paste - - - - > reformated_read2.txt ; split --suffix-length 5 --additional-suffix _seqids  -l 100 seqids.txt ;  split --suffix-length 5 --additional-suffix _reads -l 1000 reformated_read2.txt ; rm reformated_read2.txt;
if test -e reordered_R2.fastq; then rm reordered_R2.fastq; fi
for seqid in *_seqid; do for read in *_reads; do grep -w -f $seqid --no-group-separator  $read >> reordered_R2.fastq; done; done
cat reordered_R2.fastq |  awk '{print $1"\n"$2"\n"$3"\n"$4}' > sorted_R2.fastq; rm reordered_R2.fastq

echo "Read2 completed. Now deleting temp files"
rm seqids.txt
rm *_seqids *_reads
