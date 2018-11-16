#!/bin/bash

awk 'BEGIN{seqid=""; seq=""}{if($0 ~ /^>/){if(seq != ""){print seq"\n"$0; seq=""} else {print $0}} else {seq=seq""$0;}} END{print seq}' $1
