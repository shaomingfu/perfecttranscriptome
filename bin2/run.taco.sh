#!/bin/bash

scallop=scallop.B505.0.01
stringtie=stringtie.1.3.2d.0.01
ref=`pwd`/gencode.gtf

# for scallop
tag="star"
list=$scallop/$tag.list
rm -rf $list
for k in `ls $scallop/$tag.gtf/*.gtf`
do
	echo `pwd`/$k >> $list
done

taco_run -p 6 -o $scallop/$tag.taco --gtf-expr-attr FPKM $list

cd $scallop/$tag.taco
gffcompare -r $ref assembly.gtf -M -N
cd -

tag="hisat"
list=$scallop/$tag.list
rm -rf $list
for k in `ls $scallop/$tag.gtf/*.gtf`
do
	echo `pwd`/$k >> $list
done

taco_run -p 6 -o $scallop/$tag.taco --gtf-expr-attr FPKM $list

cd $scallop/$tag.taco
gffcompare -r $ref assembly.gtf -M -N
cd -

# for stringtie

tag="star"
list=$stringtie/$tag.list
rm -rf $list
for k in `ls $stringtie/$tag.gtf/*.gtf`
do
	echo `pwd`/$k >> $list
done

taco_run -p 6 -o $stringtie/$tag.taco --gtf-expr-attr FPKM $list

cd $stringtie/$tag.taco
gffcompare -r $ref assembly.gtf -M -N
cd -

tag="hisat"
list=$stringtie/$tag.list
rm -rf $list
for k in `ls $stringtie/$tag.gtf/*.gtf`
do
	echo `pwd`/$k >> $list
done

taco_run -p 6 -o $stringtie/$tag.taco --gtf-expr-attr FPKM $list

cd $stringtie/$tag.taco
gffcompare -r $ref assembly.gtf -M -N
cd -
