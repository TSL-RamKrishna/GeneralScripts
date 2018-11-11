#!/bin/bash
# usage : bash $0 inputfile wordToCount
word=$2
echo "Number of times the word occurred either partially or wholly: " $(grep $word $1 | sed "s/$word/ $word /g" | awk '{gsub(" ", "\n"); print}' | grep -c $word)
echo "Number of times the work occurred wholly: " $(grep -c " $word \| $word\$" $1)
