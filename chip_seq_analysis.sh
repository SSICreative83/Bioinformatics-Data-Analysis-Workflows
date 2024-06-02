#!/bin/bash

# read data
fastq_files=("sample1.fastq" "sample2.fastq")

# QC
for file in "${fastq_files[@]}"
do
  fastqc $file -o ./qc_reports/
done

# Alignment
for file in "${fastq_files[@]}"
do
  bwa mem reference_genome.fa $file > ${file%.fastq}.sam
done

# SAM2BAM
for file in "${fastq_files[@]}"
do
  samtools view -Sb ${file%.fastq}.sam > ${file%.fastq}.bam
done

# peak
for file in "${fastq_files[@]}"
do
  macs2 callpeak -t ${file%.fastq}.bam -f BAM -g hs -n ${file%.fastq}_peaks
done
