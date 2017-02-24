#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 <disk>"
	exit
fi

bin=`pwd`/
dir=/mnt/$1/mingfus/sra
mincoverage=0.01
ref=$bin/gencode.gtf

IFS="
"

for k in `ls $dir`
do
	cur=$dir/$k
	if [ ! -s $cur/star.sort.bam ]
	then
		continue
	fi

	cd $cur
	{ /usr/bin/time -v $bin/scallop -i star.sort.bam -o scallop.gtf --min_transcript_coverage $mincoverage --library_type first > scallop.log; } 2> scallop.time
	gffcompare -r $ref scallop.gtf -M -N

	#{ /usr/bin/time -v stringtie star.sort.bam -o stringtie.gtf -c $mincoverage --rf > stringtie.log; } 2> stringtie.time
done
