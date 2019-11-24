#!/bin/bash
# usage : bash $0 inputfile wordToCount
word=$2
#echo "Number of times the word occurred either partially or wholly: " $(grep $word $1 | tr '[:blank:]' "\n" | grep -c $word)
#echo "Number of times the work occurred wholly: " $(grep $word $1 | tr '[:blank:]' "\n" | grep -c -w $word)

# the above commands are not smart. These commands are smart and short
echo "Number of times the word occurred either wholly or partially: " $(grep -o $word $1 | wc -l)
echo "Number of times the word occurred wholly: " $(grep -o -w $word $1 | wc -l)
echo "Number of lines the word occurred: " $(grep -c $word $1)
echo "Number of lines the word occurred wholly: " $(grep -c -w $word $1)
