#!/bin/bash
file=$1

if [[ "$file" == *".fq" || "$file" == *".fastq" ]]; then
        cat $file | awk '{if (NR%4==1){seqid=$0; sub("@", "", $0); seqid=$0}
                        else if (NR%4==2){seq=$0; seqlength=length($0)}
                        else if (NR%4==0){quallength=length($0);
                                            if(seqlength==quallength){print seqid, seqlength}
                                            else {print seqid, " sequence length does not match qual length: sequence length " seqlength ", qual length " quallength; exit}  # remove this line to not print error msg, remove exit keyword if you dont want to exit after error msg
                                        }
                        }'
elif [[ "$file" == *".fastq.gz" || "$file" == *".fq.gz" ]]; then
        zcat $file | awk '{if (NR%4==1){seqid=$0; sub("@", "", $0); seqid=$0}
                        else if (NR%4==2){seq=$0; seqlength=length($0)}
                        else if (NR%4==0){quallength=length($0);
                                            if(seqlength==quallength){print seqid, seqlength}
                                            else {print seqid, " sequence length does not match qual length: sequence length " seqlength ", qual length " quallength; exit}   # remove this line to not print error msg
                                        }
                        }'
fi
