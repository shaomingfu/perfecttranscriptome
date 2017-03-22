#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 disk"
	exit
fi

ver="v0.9.7"
bin=`pwd`/
dir=/mnt/$1/mingfus/sra
gtf=`pwd`/gtf.$ver

for k in `ls $dir`
do
	cur=$dir/$k
	
	if [ ! -s $cur/scallop.gtf ]; then
		continue
	fi

	if [ ! -s $cur/scallop.log ]; then
		continue
	fi

	v=`cat $cur/scallop.log | head -n 1 | cut -f 2 -d " "`

	if [ "$v" != "$ver" ]; then
		continue
	fi

	echo $k
	cp $cur/scallop.gtf $gtf/$k.gtf
done
