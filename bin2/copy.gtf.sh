#!/bin/bash

dir1=/home/mingfus/data/repositories/scallop/bin
scallop=scallop.B505.0.01
stringtie=stringtie.1.3.2d.0.01

mkdir -p $scallop/star.gffcmp $scallop/hisat.gffcmp
mkdir -p $stringtie/star.gffcmp $stringtie/hisat.gffcmp

for k in `cat list10`
do
	echo $k
#ln -sf $dir1/$k.star/$scallop/scallop.gtf $scallop/star.gtf/$k.gtf
#ln -sf $dir1/$k.hisat/$scallop/scallop.gtf $scallop/hisat.gtf/$k.gtf
#ln -sf $dir1/$k.star/$stringtie/st.gtf $stringtie/star.gtf/$k.gtf
#ln -sf $dir1/$k.hisat/$stringtie/st.gtf $stringtie/hisat.gtf/$k.gtf
	ln -sf $dir1/$k.star/$scallop/gffmul.stats $scallop/star.gffcmp/$k.gffcmp
	ln -sf $dir1/$k.hisat/$scallop/gffmul.stats $scallop/hisat.gffcmp/$k.gffcmp
	ln -sf $dir1/$k.star/$stringtie/gffmul.stats $stringtie/star.gffcmp/$k.gffcmp
	ln -sf $dir1/$k.hisat/$stringtie/gffmul.stats $stringtie/hisat.gffcmp/$k.gffcmp
done
