import os, sys

list_to_extract = []
with open(sys.argv[1]) as fh:
	for line in fh:
		chr = line.rstrip()
		list_to_extract.append(chr)

seq_found = False
with open(sys.argv[2]) as fh:
	for line in fh:
		line = line.rstrip()
		if line.startswith(">"):
			chrom = line.split()[0][1:]
			if list_to_extract == []:
				break
			if chrom in list_to_extract:
				print(line)
				list_to_extract.remove(chrom)
				seq_found = True
			else:
				seq_found = False
		else:
			if seq_found:
				print(line)
