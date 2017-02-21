#!/usr/bin/python

import sys;
import os.path;

myfile = open(sys.argv[1], "r");

for s in myfile:
	line = s.split();
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
