#!/bin/bash

if [ "$#" != 4 ]; then
	echo "usage $0 ID fasta1 fasta2 dir-id"
	exit
fi

id=$1
fasta1=$2
fasta2=$3
dirid=$4

dir=/home/mingfus/data/repositories/perfecttranscriptome/data/sra.fastq.star

#genome=/home/mingfus/data/transcriptomics/STAR/GRCh38

if [ `hostname` == "arctic" ]; then
	genome=/mnt/disk51/user/mingfus/transcriptomics/STAR/GRCh38
elif [ `hostname` == "arctic.compbio.cs.cmu.edu" ]; then
	genome=/mnt/disk51/user/mingfus/transcriptomics/STAR/GRCh38
elif [ `hostname` == "ocean" ]; then
	genome=/mnt/disk48/user/mingfus/transcriptomics/STAR/GRCh38
elif [ `hostname` == "rainforest" ]; then
	genome=/mnt/disk44/user/mingfus/data/transcriptomics/STAR/GRCh38
elif [ `hostname` == "savanna" ]; then
	genome=/mnt/disk31/user/mingfus/transcriptomics/STAR/GRCh38
else
	exit
fi

# check exisits
for i in `ls $dir | grep sra`
do
	if [ -d $dir/$i/$id ]; then
		echo $i contains $id
		exit
	fi
done

cur=$dir/$dirid/$id
mkdir -p $cur

cd $cur
rm -rf perfect.log

echo "start running STAR ..." >> perfect.log; date >> perfect.log
STAR --runThreadN 4 --outSAMstrandField intronMotif --chimSegmentMin 20 --genomeDir $genome --readFilesCommand zcat --readFilesIn $fasta1 $fasta2

echo "start running samtools ..." >> perfect.log; date >> perfect.log
samtools view --threads 4 -b Aligned.out.sam > Aligned.out.bam
samtools sort --threads 4 Aligned.out.bam > star.sort.bam

rm -rf Aligned.out.sam Aligned.out.bam

echo "finish instance $id ..." >> perfect.log; date >> perfect.log
