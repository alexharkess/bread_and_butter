#!/usr/bin/perl
use strict;
use warnings;

# runs tophat2 on a set of paired end libraries against a reference genome, using gene models in a .gff file
# NOTE: you will need to replace the .gff3 file and the AmTr genome scaffolds with your own gff3 file and indexed genome. These are strictly example placeholders
# Also take note of my parameters listed -- 50kb max introns, very sensitive alignment, high effort. Read manual and adjust accordingly
# requires the same readlist.txt file with 3 columns:
# leftside.fq.gz rightside.fq.gz shortUniqueIdentifier
# usage : perl batch_tophat2.pl
# author : Alex Harkess
# last updated : Jan 2015


open IN, '<', "readlist.txt";
while (<IN>) {
    my ($left, $right, $base) = split /\s+/, $_;
    open OUT, '>', "$base\.tophat.sh";
    print OUT "#!/bin/bash\n";
    print OUT "/usr/local/tophat/latest/bin/tophat2 -o $base\_tophat -I 50000 --b2-very-sensitive --b2-D 50 --rg-id $base --rg-sample $base -G AmTr_v1.0_evm_run27_filter02.gff3 AmTr_v1.0_454Scaffolds $left $right";
    system "qsub -q rcc-mc-30d -cwd -pe thread 4 $base\.tophat.sh";
    close OUT;
}
