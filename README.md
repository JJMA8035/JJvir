# JJvir
JJvir repository of pipeline
JJvir is a pipeline in a effort to analyze viral information wihtin a illumina NGS data
JJvir used a a5-miseq pipeline, blast, kaijut, krona.

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
