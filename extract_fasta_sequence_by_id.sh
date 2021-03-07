#!/bin/bash
# a short quick program uisng awk, paste and grep command to extract fasta sequence by list of seqids  in a file
# fasta sequences can be in mulitple lines, so here we are reading the input fasta file using the script read_fasta_with_awk.sh
# this converts multiple line fasta sequences to single line
# paste command prints seqids and sequence in two column tabular file
# grep -f command filters out lines containing the seqids listed in the file
# finally, the awk code at the end, stores the sequence to variable seq and then replaces the sequence by empty char giving only the seqid and then finally prints the seqid, newline and sequence

fasta=$1
seqidlist=$2

bash read_fasta_with_awk.sh $fasta | paste - - | grep -f $seqidlist | awk '{seq=$NF; gsub($NF,"", $0);print $0"\n"seq}'
