#!/bin/bash

#
##
###
####
BaseDir=$PWD
nSamples=2 # number of samples to run in parallel
nThreads=2 # per-sample number of threads 
#####
####
##
#

cd $BaseDir

mapDir=$BaseDir/map
DataExt=".bam"

if [[ ! -d $mapDir ]]; then
  mkdir $mapDir
fi

cpsDir=$BaseDir/cps
if [[ ! -d $cpsDir ]]; then
  mkdir $cpsDir
fi

FILE=$BaseDir/cps/cps.txt
if test -f "$FILE"; then
    echo "$FILE exists"
    else
    touch $FILE
    echo "$FILE created."
fi

varDir=${BaseDir}/var

if [[ ! -d $varDir ]]; then
  mkdir $varDir
fi

bwa index ${BaseDir}/rep/*fa >/dev/null 2> /dev/null

wait 

#### Compact version 
#### fastqs are stored in seq and named sample_1.fastq.gz/sample_2.fastq.gz (paired-end)
#### sample_1.fastq.gz only (single-end)
for IndS in $(ls ${BaseDir}/seq/*_1.* | rev | cut -d"/" -f1 | rev | cut -d"_" -f1)
do
	cps=$(grep -w $IndS ${BaseDir}/cps/cps.txt)
	if [ -z "$cps" ]
	then
		revers=$(find ${BaseDir}/seq | grep ${IndS}_2)
		IndR=$(ls ${BaseDir}/rep/*.fa)
		refID=$(basename $IndR | cut -d "." -f 1)
		((i++))
		(
		#### short reads alignment
		#### IF T runs paired end ELSE single end
		if [ ! -z "$revers" ]
		then
			bwa mem -t $nThreads $BaseDir/rep/$refID.genome.fa ${BaseDir}/seq/${IndS}_1.* ${BaseDir}/seq/${IndS}_2.* -o $mapDir/$IndS".sam" 2> /dev/null
		elif [ -z "$revers" ]
		then
			bwa mem -t $nThreads $BaseDir/rep/$refID.genome.fa ${BaseDir}/seq/${IndS}_1* -o $mapDir/$IndS".sam" 2> /dev/null
		fi
		
		#### SAM processing
		samtools fixmate -@$nThreads -O bam,level=1 -m $mapDir/$IndS".sam" $mapDir/$IndS".fix.bam"
		samtools sort -l 1 -@$nThreads $mapDir/$IndS".fix.bam" -T $BaseDir/tmp/$IndS".tmp.bam" -o $mapDir/$IndS".fix.srt.bam"
		samtools markdup -@$nThreads -O bam,level=1 $mapDir/$IndS".fix.srt.bam" $mapDir/$IndS".fix.srt.mrk.bam" 
		samtools view -@$nThreads $mapDir/$IndS".fix.srt.mrk.bam" -o $mapDir/$IndS.$refID.bam
		samtools index $mapDir/$IndS.$refID.bam
		
		#### The line below remove intermediate files
		# rm -r $mapDir/$IndS.sam  $mapDir/$IndS.fix.bam $mapDir/$IndS.fix.srt.bam $mapDir/$IndS.fix.srt.mrk.bam
		
		#### Genotype
		#### filt Q and DP, only snps, no indels
		bcftools mpileup -E -Ou -q 5 -a DP -f ${BaseDir}/rep/${refID}.genome.fa $mapDir/$IndS.$refID.bam | bcftools call -mO v | bcftools view --max-alleles 2 --exclude-types indels -e 'QUAL <= 20 || FORMAT/DP <= 10' | bcftools annotate -x ID,INFO,FILTER | bgzip > $varDir"/"$IndS"."$refID".gvcf.gz"
		bcftools index $varDir"/"$IndS"."$refID".gvcf.gz"
		
		echo $IndS >> $BaseDir/cps/cps.txt
		#### The line below remove the bam files
		# rm $mapDir/$IndS.$refID.bam $mapDir/$IndS.$refID.bam.bai
		)&

		#### As soon as one strain is done, move to the next
		#### Do not run one less not one more, respect the limit of samples imposed by nSamples.
		if (( i % nSamples == 0 )); then
			wait -n
			i=$(($nSamples-1))
		fi
	fi
done
