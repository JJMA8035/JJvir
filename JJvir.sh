#!/bin/bash
echo "JJvir"
#autor: Juan José Morales Aguilar
#e-mail: Juan.moralesa@uadeo.mx
#este es un pipeline en un intento para crear una forma facil de analizar virus conocidos en metagenomas o muestras de secuenciación masiva.
#fecha de creación 17 de Julio 2022, Guadalajara, México.
#Profesor investigador Universidad Autónoma de Occidente UR Guasave
#Primero debemos de meter los datos
#echo "Ingrese la libreria FASTQ forward de esta manera "libreria_R1.fastq" donde libreria_R1 es el nombre de su libreria y enter"
#read a
if [ $# -ne 2 ];
then
		echo "faltan argumetos"
		echo "saliendo del programa"
		echo "Ingresa los datos que se solicitan"
		echo "usage JJViral.sh Libreria_R1.fastq Libreria_R2.fastq"
else
	Rjj1=$1
	Rjj2=$2

	echo "Asignación = = = = = = = = = ="
	a5_pipeline.pl --threads=8 --metagenome "$Rjj1" "$Rjj2" "A5Final"

	echo "A5-pipeline = = = = = = = = = ="
	blastn -num_threads 8 -query A5Final.contigs.fasta -db ~/miniconda3/envs/JJvir/opt/blastdb/ref_viruses_rep_genomes -outfmt "6 qseqid sseqid staxids pident qstart qend sstart send evalue stitle qlen" -num_alignments 1 -out A5Final.virus.txt
	echo "Blast = = = = = = = = = ="
	R1=A5Final.virus.txt
	echo "=================== ATENTION ==================="
	echo "Indicate the minimal lenght contig to analize"
	read length
	sed "s/ /,/g" A5Final.virus.txt | sort -k 9 | awk '{if($10>$length) print($1" ",$9"  ",$10" "$3" "$2)}' > VirBlast.txt
	R2=VirBlast.txt
	echo "Parseo = = = = = = = = = ="
	sort -k 4 VirBlast.txt | uniq -c -f 4 | awk '{print($1"|"$6)}'| awk -F'[|]' '{print($1","$5)}' | sort -n -r > numviruses.csv
	R3=numviruses.csv
	echo "num_contigs,accesion" >index.csv
	cat index.csv numviruses.csv > numVirusesNCBI.csv
    	Creando grafica
    	echo "Plot = = = = = = = = = ="
    	python3 ~/miniconda3/envs/JJvir/bin/viralplot.py
    	echo "= = = = =Beging taxonomy analisis= = = = = = K-T-Kr"
	kaiju taxonomy
	kaiju -z 8 -t ~/miniconda3/envs/JJvir/opt/kaijudb/viruses/nodes.dmp -f ~/miniconda3/envs/JJvir/opt/kaijudb/viruses/kaiju_db_viruses.fmi -i $Rjj1 -j $Rjj2 -o kaiju.out
	#kaiju a krona
	echo "= = = = = = = = taxonomy analisis= = = = = = K-T-Kr"
	kaiju2krona -t ~/miniconda3/envs/JJvir/opt/kaijudb/viruses/nodes.dmp -n ~/miniconda3/envs/JJvir/opt/kaijudb/viruses/names.dmp -i kaiju.out -o kaiju_contigs.out.krona
	echo "= = = = = = = = = = =taxonomy analisis = = = K-T-HT"
	ktImportText -o kaiju_contigs.out.html kaiju_contigs.out.krona
	

	echo "============== Resultados ==========="
	echo "Archivo				Datos que contiene"
	echo "$R1		Analisis BLASTn de todos los datos"
	echo "$R2			Aquellas secuencias que son mas largas que 500 pb"
	echo "$R3			No. de secuenciencias y el ID NCBI"
	
	echo " ============= ========= ==========="
	echo "Gracias por utilizar JJvir version 4.0"
	a=0
	b=0
fi
