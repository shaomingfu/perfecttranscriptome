#!/bin/bash

bin=`pwd`
listdir=/home/mshao/data/repositories/perfecttranscriptome/data/SRAdb/homo.sapiens.paired.lists

list1=1000
list2=1009

sblist=`pwd`/batch."$list1"."$list2".list
rm -rf $sblist

sb=`sbatch -p RM-shared -N 1 -t 48:00:00 --time-min 12:00:00 $bin/download.single.py $listdir/$list1`
id=`echo $sb | cut -f 4 -d " "`

echo "$list1 $id" >> $sblist

let list1=$list1+1
for list in `seq $list1 $list2`
do
	sb=`sbatch -p RM-shared -N 1 -t 48:00:00 --time-min 12:00:00 -d after:$id $bin/download.single.py $listdir/$list`
	id=`echo $sb | cut -f 4 -d " "`

	echo "$list $id" >> $sblist
done
