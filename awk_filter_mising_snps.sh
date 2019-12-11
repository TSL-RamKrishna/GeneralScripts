#!/usr/bin/env awk

awk '{if($0 ~ /^#/){print} else if($5 == "."){pass} else {print}}'
