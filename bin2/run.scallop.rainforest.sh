#!/bin/bash

if [ "$#" != 2 ]; then
	echo "usage $0 disk list"
	exit
fi

bin=`pwd`/
dir=/mnt/$1/mingfus/sra
ref=$bin/gencode.gtf

IFS="
"

for k in `cat $2`
do
	cur=$dir/$k
	if [ ! -s $cur/star.sort.bam ]
	then
		continue
	fi

	echo $k

	cd $cur
	{ /usr/bin/time -v $bin/scallop -i star.sort.bam -o scallop.gtf > scallop.log; } 2> scallop.time
	gffcompare -r $ref scallop.gtf -M -N
done
