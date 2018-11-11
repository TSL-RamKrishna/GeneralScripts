#!/bin/bash
# usage : bash $0 inputfile wordToCount
word=$2
echo "Number of times the word occurred either partially or wholly: " $(grep $word $1 | tr '[:blank:]' "\n" | grep -c $word)
echo "Number of times the work occurred wholly: " $(grep $word $1 | tr '[:blank:]' "\n" | grep -c -w $word)
