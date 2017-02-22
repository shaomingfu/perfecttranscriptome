#!/bin/bash

dir=`pwd`/
scallop=scallop.B505.0.01
stringtie=stringtie.1.3.2d.0.01
ref=$dir/gencode.gtf

# for scallop
tag="star"
list=$dir/$scallop/$tag.list
cur=$dir/$scallop/$tag.merge
mkdir -p $cur
cd $cur
stringtie --merge $list -o merge.gtf -F -0.1 -T -0.1
gffcompare -r $ref merge.gtf -M -N
cd -

tag="hisat"
list=$dir/$scallop/$tag.list
cur=$dir/$scallop/$tag.merge
mkdir -p $cur
cd $cur
stringtie --merge $list -o merge.gtf -F -0.1 -T -0.1
gffcompare -r $ref merge.gtf -M -N
cd -


# for stringtie
tag="star"
list=$dir/$stringtie/$tag.list
cur=$dir/$stringtie/$tag.merge
mkdir -p $cur
cd $cur
stringtie --merge $list -o merge.gtf -F -0.1 -T -0.1
gffcompare -r $ref merge.gtf -M -N
cd -

tag="hisat"
list=$dir/$stringtie/$tag.list
cur=$dir/$stringtie/$tag.merge
mkdir -p $cur
cd $cur
stringtie --merge $list -o merge.gtf -F -0.1 -T -0.1
gffcompare -r $ref merge.gtf -M -N
cd -
