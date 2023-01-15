# JJvir
AUTOR: Juan José Morales Aguilar
juan.moralesa@uadeo.mx

JJvir repository of pipeline
JJvir is a pipeline in a effort to analyze viral information wihtin a illumina NGS data
JJvir used a a5-miseq pipeline, blast, kaijut, krona.

The The A5-miseq pipeline is (c) 2011-2014 Andrew Tritt and Aaron Darling. A5-miseq is free, open source software licensed under the GPLv3, please see the file LICENSE for details. The A5-miseq pipeline includes open-source components developed and copyright by 3rd parties: bwa, samtools, SGA, bowtie, IDBA-UD, SSPACE, and Trimmomatic. Source code for these components is available from the following locations:

bwa: https://sourceforge.net/projects/bio-bwa/
samtools: https://sourceforge.net/projects/samtools/
SGA: https://github.com/jts/sga
bowtie: https://sourceforge.net/projects/bowtie-bio/
Trimmomatic: http://www.usadellab.org/cms/?page=trimmomatic

Please see their license agreements for further details.
The following two components have been modified from their original versions and the corresponding GPL licensed source code is available in the A5-miseq repository:
IDBA-UD: https://sourceforge.net/p/ngopt/code/HEAD/tree/trunk/idba-1.1.1/
SSPACE: https://sourceforge.net/p/ngopt/code/HEAD/tree/trunk/SSPACE/




Instalation:
Donwload all files

#Install conda yml file
conda env create -f JJvir.yml

It required kaiju virus database
Download and install in  folder
~/miniconda3/envs/JJvir/opt/kaijudb/viruses/

It require blast db
Download and install in folder
~/miniconda3/envs/JJvir/opt/blastdb/

It require to download the script viralplot.py to the folder ~/miniconda3/envs/JJvir/bin/
