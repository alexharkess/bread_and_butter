#!/usr/bin/perl

# run fastqc on all files that end in *fastq.gz in your current directory
# usage : perl batch_fastqc.pl
# author : Alex Harkess
# last updated : Jan 2015

use strict;
use warnings;

my @fastqs = <*fastq.gz>;
my $files = join (" ", @fastqs);

open OUT, '>', "all_fastqc.sh";

print OUT "#!/bin/bash\n";
print OUT "/usr/local/fastqc/latest/fastqc -f fastq -t 3 $files\n";
close OUT;

system "qsub -q rcc-30d -cwd -pe thread 3 -l mem_total=20G ./all_fastqc.sh";
