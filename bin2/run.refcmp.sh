#!/bin/bash

scallop=scallop.B505.0.01
stringtie=stringtie.1.3.2d.0.01
ref=`pwd`/gencode.gtf
list=`pwd`/list10

## for scallop
#tag="star"
#dir=$scallop/$tag.refcmp
#mkdir -p $dir
#for k in `cat $list`
#do
#	taco_refcomp -p 8 -o $dir/$k -r $ref -t $scallop/$tag.gtf/$k.gtf
#done

# for scallop
tag="hisat"
dir=$scallop/$tag.refcmp
mkdir -p $dir
for k in `cat $list`
do
	taco_refcomp -p 8 -o $dir/$k -r $ref -t $scallop/$tag.gtf/$k.gtf
done

# for stringtie
tag="star"
dir=$stringtie/$tag.refcmp
mkdir -p $dir
for k in `cat $list`
do
	taco_refcomp -p 8 -o $dir/$k -r $ref -t $stringtie/$tag.gtf/$k.gtf
done

# for stringtie
tag="hisat"
dir=$stringtie/$tag.refcmp
mkdir -p $dir
for k in `cat $list`
do
	taco_refcomp -p 8 -o $dir/$k -r $ref -t $stringtie/$tag.gtf/$k.gtf
done
