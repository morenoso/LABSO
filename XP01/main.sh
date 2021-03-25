#!/bin/bash
# Cria uma lista dos arquivos a serem comparados.
files=(`ls -I"*.sh" -I"resultado.txt"`)
# Tamanho da lista.
len=${#files[*]}

# Cria o arquivo de resultado.
> resultado.txt;

# Loop utilizado para comparar os arquivos e inserir os resultados no arquivo.
for((i=0; i<$len; i++)); do
  for((j=1; j<$len-i; j++)); do
    echo "#### Comparacao entre os arquivos" ${files[i]} "e" ${files[j+i]} "####" >> resultado.txt;
    echo "$ DIFF:" >> resultado.txt;
    diff -s ${files[i]} ${files[j+i]} >> resultado.txt;
    echo >> resultado.txt;
  done
done