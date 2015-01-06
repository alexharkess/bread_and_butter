bread and butter
================

My bread and butter scripts for short read inspection, cleaning, RNAseq alignment, DNAseq alignment, bisulfite alignment. Free to anyone, but hardcoded with paths for the University of Georgia zcluster as well as some placeholders of my own files (like .gff file names, which you'll need to replace with your own). I mean for this to be an example of how I do things -- it won't necessarily work for you out of the box. 

readCleaning
------------
###### batch_fastqc.pl
* Runs FASTQC on all fastq.gz in a directory

###### batch_trimmomatic_SE.pl
* Runs Trimmomatic in single end mode for all fastq files you specify in a directory

###### batch_trimmomatic_PE.pl
* Runs Trimmomatic in paired end mode for all fastq files you specify in a directory

RNAseq
----------
###### batch_tophat2.pl
* Runs tophat2 against a reference genome on all fastq files you specify in a directory

