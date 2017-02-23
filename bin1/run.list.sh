#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 <list>"
	exit
fi

dir=/mnt/disk10/mingfus/sra
genome=/home/mingfus/data/transcriptomics/STAR/GRCh38
mincoverage=0.01

for id in `cat $1`
do
	echo $id
	cur=$dir/$id
	mkdir -p $cur

	cd $cur
	rm -rf perfect.log

	echo "start downloading instance $id ..." >> perfect.log; date >> perfect.log
	fastq-dump --split-files --gzip $id

	echo "start uncompressing fastq ..." >> perfect.log; date >> perfect.log
	gzip -d "$id"_1.fastq.gz
	gzip -d "$id"_2.fastq.gz

	echo "start running STAR ..." >> perfect.log; date >> perfect.log
	STAR --runThreadN 6 --outSAMstrandField intronMotif --chimSegmentMin 20 --genomeDir $genome --readFilesIn "$id"_1.fastq "$id"_2.fastq

	echo "start running samtools ..." >> perfect.log; date >> perfect.log
	samtools view --threads 6 -b Aligned.out.sam > Aligned.out.bam
	samtools sort --threads 6 Aligned.out.bam > star.sort.bam

	echo "start running scallop ..." >> perfect.log; date >> perfect.log
	{ /usr/bin/time -v scallop -i star.sort.bam -o scallop.gtf --min_transcript_coverage $mincoverage --library_type first > scallop.log; } 2> scallop.time

	echo "start running stringtie ..." >> perfect.log; date >> perfect.log
	{ /usr/bin/time -v stringtie star.sort.bam -o stringtie.gtf -c $mincoverage --rf > stringtie.log; } 2> stringtie.time

	echo "finish instance $id ..." >> perfect.log; date >> perfect.log
done
