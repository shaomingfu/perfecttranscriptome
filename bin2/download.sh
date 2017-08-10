#!/bin/bash

if [ "$#" != "2" ]; then
	echo "usage list1 list2"
	exit
fi

bin=`pwd`
listdir=/home/mshao/data/repositories/perfecttranscriptome/data/SRAdb/homo.sapiens.paired.lists

list1=$1
list2=$2

for list in `seq $list1 $list2`
do
	$bin/download.single.py $listdir/$list
done
