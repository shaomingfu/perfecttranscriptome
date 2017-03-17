#!/bin/bash

if [ "$#" != 1 ]; then
	echo "usage $0 <list>"
	exit
fi

dir=`pwd`/sra
genome=/home/mingfus/data/transcriptomics/STAR/GRCh38
mincoverage=0.01

IFS="
"

for k in `cat $1`
do
	id=`echo $k | cut -f 1 -d " "`
	file1=`echo $k | cut -f 2 -d " "`
	file2=`echo $k | cut -f 3 -d " "`

	echo $id $file1 $file2 $dir

	cur=$dir/$id
	mkdir -p $cur

	cd $cur
	rm -rf perfect.log

	echo "scp fasta file from rainforest ..." >> perfect.log; date >> perfect.log
	scp mingfus@rainforest:$file1 .
	scp mingfus@rainforest:$file2 .

	echo "start uncompressing fasta ..." >> perfect.log; date >> perfect.log
	gzip -d `basename $file1` -c > "$id"_1.fasta
	gzip -d `basename $file2` -c > "$id"_2.fasta

	echo "start running STAR ..." >> perfect.log; date >> perfect.log
	STAR --runThreadN 6 --outSAMstrandField intronMotif --chimSegmentMin 20 --genomeDir $genome --readFilesIn "$id"_1.fasta "$id"_2.fasta

	echo "start running samtools ..." >> perfect.log; date >> perfect.log
	samtools view --threads 6 -b Aligned.out.sam > Aligned.out.bam
	samtools sort --threads 6 Aligned.out.bam > star.sort.bam

#echo "start running scallop ..." >> perfect.log; date >> perfect.log
#{ /usr/bin/time -v scallop -i star.sort.bam -o scallop.gtf --min_transcript_coverage $mincoverage --library_type first > scallop.log; } 2> scallop.time

#echo "start running stringtie ..." >> perfect.log; date >> perfect.log
#{ /usr/bin/time -v stringtie star.sort.bam -o stringtie.gtf -c $mincoverage --rf > stringtie.log; } 2> stringtie.time

	rm "$id"_1.fasta "$id"_2.fasta Aligned.out.* Chimeric.out.* Log.* SJ.out*
	rm `basename $file1` `basename $file2`
	#rm star.sort.bam

	echo "finish instance $id ..." >> perfect.log; date >> perfect.log
done
