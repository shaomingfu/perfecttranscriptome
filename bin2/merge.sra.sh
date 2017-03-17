#!/bin/bash

cur=./sra
mkdir -p $cur

for i in `cat disks`
do
	dir=$i/mingfus/sra
	for k in `ls $dir`
	do
		file=$dir/$k/scallop.gtf
		if [ -s $file ]
		then
			echo $file
		fi
	done
done > $cur/gtf.list
