#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 list"
	exit
fi

bin=`pwd`/
dir=$bin/sra
ref=$bin/gencode.gtf
mincoverage=0.01

IFS="
"

for k in `cat $1`
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
