# this script filters out any snp rows from vcf file where alternative column (5th column is '.')
# usage:
# cat sample.vcf | awk_filter_missing_snps.sh 

awk '{if($0 ~ /^#/){print} else if($5 == "."){pass} else {print}}'
