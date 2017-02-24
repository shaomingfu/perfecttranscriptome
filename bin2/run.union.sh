#!/bin/bash

dir=`pwd`/
ref=$dir/gencode.gtf

function func
{
	list=$dir/$1/$2.list
	cur=$dir/$1/$2.union
	mkdir -p $cur
	cd $cur
	#$dir/gtfmerge union $list union.gtf
	$dir/gtfcuff roc gffcmp.union.gtf.tmap 171986 > gffcmp.roc
	return

	for c in `echo "0 1 2 5 10 20 50"`
	do
		$dir/gtfformat filter $c union.gtf union.$c.gtf
		gffcompare -r $ref union.$c.gtf -o gffcmp.$c -M -N
	done
	cd -
}

scallop=scallop.B505.0.01
stringtie=stringtie.1.3.2d.0.01

func $scallop star
func $scallop hisat
func $stringtie star
func $stringtie hisat
