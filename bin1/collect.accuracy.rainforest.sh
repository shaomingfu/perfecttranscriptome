#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 disk"
	exit
fi

ver="v0.9.7"
bin=`pwd`/
dir=/mnt/$1/mingfus/sra

for k in `ls $dir`
do
	cur=$dir/$k

	if [ ! -s $cur/gffcmp.stats ]; then
		continue
	fi

	x=`cat $cur/gffcmp.stats | grep Intron | grep chain | grep level`

	if [ "$x" == "" ]; then
		continue;
	fi

	s=`ls -la $cur/star.sort.bam | awk '{print $5}'`

	x1=`echo $x | awk '{print $4}'`
	x2=`echo $x | awk '{print $6}'`

	echo $k $x1 $x2 $s
done
