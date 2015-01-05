#!/usr/bin/perl
use strict;
use warnings;

# runs trimmomatic on single end reads, trimming TruseqV2 adapters, then clips 5' and 3' ends < Phred 10, then discards reads < 50nt long
# requires a file named "readlist.txt" in your current directory
# readlist.txt must contain only 2 columns for each library you want to trim:
#		libraryname.fastq.gz	shortUniqueDescriptor
# usage : perl batch_trimmomatic_SE.pl
# author : Alex Harkess
# last updated : January 2015

open IN, '<', "readlist.txt";
while (<IN>) {
    my ($left, $prefix) = split /\s+/, $_;
    open OUT, '>', "$prefix.trim.sh";
    print OUT "java -jar /usr/local/trimmomatic/latest/trimmomatic-0.32.jar SE -phred33 -threads 2 $left $prefix\.clean.fq.gz ILLUMINACLIP:/usr/local/trimmomatic/latest/adapters/TruSeq2-PE.fa:2:30:10 LEADING:10 TRAILING:10 MINLEN:50";
    system "qsub -q rcc-30d -pe thread 2 $prefix.trim.sh";
}
