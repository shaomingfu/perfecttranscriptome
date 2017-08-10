#!/bin/bash

dir=/home/mingfus/data/repositories/perfecttranscriptome/data/sra.fastq.star

for k in `ls $dir | grep sra | grep -v bridge | sort -V`
do
	t=`readlink $dir/$k`
	d=`echo $t | cut -f 3 -d "/"`
	x=`df -h | grep $d | awk '{print $2,$3,$4,$5}'`
	c=`ls $dir/$k | wc -l`
	echo "$k $t (usage: $x) has $c alignments"
done
