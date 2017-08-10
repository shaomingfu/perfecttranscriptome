#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 dir-id"
	exit
fi

dirid=$1

list=../data/meta/homo.sapiens.paired.exists.paths

IFS="
"

scripts=scripts.$dirid


rm -rf $scripts

for i in `cat $list`
do
	id=`echo $i | cut -f 1 -d " "`
	f1=`echo $i | cut -f 2 -d " "`
	f2=`echo $i | cut -f 3 -d " "`

	echo `pwd`/align.single.sh $id $f1 $f2 $dirid >> $scripts
done

nohup cat $scripts | xargs -L 1 -P 4 -I CMD bash -c CMD &
