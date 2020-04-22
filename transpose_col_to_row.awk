#!/bin/bash

# this script is for tab delimited values
# if the values are comma delimited, edit -F "\t" to -F ","
# awk fields are space and/or tab separated by default

awk -F "\t" '{for (i=1; i<=NF; i++) a[i,NR]=$i; max=(max<NF?NF:max)}
        END {for (i=1; i<=max; i++)
              {for (j=1; j<=NR; j++)
                  printf "%s%s", a[i,j], (j<NR?OFS:ORS)
              }
        }
