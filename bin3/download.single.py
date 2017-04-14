#!/usr/bin/python

import sys;
import os.path;
import subprocess;

if len(sys.argv) < 2:
	print "usage:", sys.argv[0], "<list-file>";
	sys.exit(0);

myfile = open(sys.argv[1]);

for x in myfile:
	x = x.splitlines(False)[0];

	dir1 = x[0:6] + "/";
	dir2 = "";
	if len(x) == 10:
		dir2 = "00" + x[-1:] + "/";
	elif len(x) == 11:
		dir2 = "0" + x[-2:] + "/";
	elif len(x) == 12:
		dir2 = x[-3:] + "/";

	file1 = x + "_1.fastq.gz";
	file2 = x + "_2.fastq.gz";
	file3 = x + "_3.fastq.gz";
	url1 = "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/" + dir1 + dir2 + x + "/" + file1;
	url2 = "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/" + dir1 + dir2 + x + "/" + file2;
	url3 = "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/" + dir1 + dir2 + x + "/" + file3;
	cur = "/home/mshao/data/repositories/perfecttranscriptome/data/sra/" + x;

	cmd0 = "mkdir -p " + cur;
	cmd1 = "wget " + url1 + " -O " + cur + "/" + file1;
	cmd2 = "wget " + url2 + " -O " + cur + "/" + file2;
	cmd3 = "wget " + url3 + " -O " + cur + "/" + file3;

	#print cmd0
	#print cmd1
	#print cmd2
	#print cmd3
	#sys.exit(0);

	os.system(cmd0);
	os.system(cmd1);
	os.system(cmd2);
	os.system(cmd3);
