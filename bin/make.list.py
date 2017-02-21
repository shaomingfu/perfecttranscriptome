#!/usr/bin/python

import sys;
import os.path;

if len(sys.argv) < 3:
	print "usage:", sys.argv[0], "existing list", "sra list"
	sys.exit(0)

myset = set(line.strip() for line in open(sys.argv[2]))

myfile = open(sys.argv[1]);

for s in myfile:
	line = s.split();
	if line[0] not in myset:
		continue

	if len(line) == 3:
		disk = line[1].split("/")[2];
		file1 = "/mnt/" + disk + "/sra/" + line[0] + "_1.fasta.gz";
		file2 = "/mnt/" + disk + "/sra/" + line[0] + "_2.fasta.gz";
		if os.path.exists(file1) and os.path.exists(file2):
			print line[0], file1, file2;
	elif len(line) == 4:
		disk = line[1].split("/")[2];
		file1 = "/mnt/" + disk + "/sra/" + line[0] + "_1.fasta.gz";
		file2 = "/mnt/" + disk + "/sra/" + line[0] + "_3.fasta.gz";
		if os.path.exists(file1) and os.path.exists(file2):
			print line[0], file1, file2;
