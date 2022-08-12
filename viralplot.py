#!/usr/bin/python3
#Programa para imprimir una grafica derivado del resultado de contigs
#Escrito por Juan José Morales Aguilar
#juan.moralesa@uadeo.mx
#Profesor Investigador Universidad Autónoma de Occidente UR Guasave
#importar las librerias
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
#dominio de cada fución
df = pd.read_csv ('numVirusesNCBI.csv')
num_contigs = df['num_contigs']
accesion = df['accesion']
#dibujando la grafica
plt.bar(accesion,num_contigs)
plt.xticks(accesion.index)
plt.xlabel('accesion')
plt.ylabel('num_contigs')
plt.title("Cantidad de contigs por accessión")
plt.autoscale(enable=True, axis='x', tight=True)
plt.xticks(rotation=35, fontsize=8)
plt.savefig("Contigsbyaccesion.pdf", dpi=300)
#quit()
