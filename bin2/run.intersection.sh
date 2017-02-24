#!/bin/bash

dir=`pwd`/
ref=$dir/gencode.gtf

function func
{
	list=$dir/$1/$2.list
	cur=$dir/$1/$2.intersection
	mkdir -p $cur
	cd $cur
	#$dir/gtfmerge intersection $list intersection.gtf
	#gffcompare -r $ref intersection.gtf -M -N
	$dir/gtfcuff roc gffcmp.intersection.gtf.tmap 171986 > gffcmp.roc
	return

	for c in `echo "1 2 5 10 20 50"`
	do
		$dir/gtfformat filter $c intersection.gtf intersection.$c.gtf
		gffcompare -r $ref intersection.$c.gtf -o gffcmp.$c -M -N
	done
	cd -
}

scallop=scallop.B505.0.01
stringtie=stringtie.1.3.2d.0.01

func $scallop star
func $scallop hisat
func $stringtie star
func $stringtie hisat
