#!/bin/bash

dir=/home/mingfus/data/repositories/perfecttranscriptome/data/sra.fastq.star

for k in `ls $dir | grep sra | grep -v bridge | sort -V`
do
	cd $dir/$k
	echo $k
	for i in `ls`
	do
		rm -rf $i/Aligned.out.bam $i/Aligned.out.sam
	done
done
