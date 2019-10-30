#!/bin/bash

barra="+--------------------------+"

echo $barra
echo "|    Selecione a opção     |"
echo "|  1 - Novo arq com DDD, Telefone, Estado|"
echo "|  2 - Novo arq com cidades 4,5,6 e 7|"
echo "|  3 - Novo arq com Nomes em letra maiuscula |"
echo "|  4 - Novo arq sem cidades repetidas |"
echo "|  5 - Novo arq com nome e cidade |"; read escolha

if [ $escolha = 1 ]
then
	awk -F ";" '{print $5,$1,$3}' arq3 > arq_temp
	#cut -d ";" -f5 arq3 > arq_temp | cut -d ";" -f1,3 arq3 >> arq_temp
elif [ $escolha = 2 ]
then
	sed -n '4,7 p' arq2 > arq_temp2
elif [ $escolha = 3 ]
then
	cat arq1 | tr '[:lower:]' '[:upper:]' > arq_temp3 
elif [ $escolha = 4 ]
then
	cat arq2 | sort | uniq > arq_temp4
elif [ $escolha = 5 ]
then
	paste arq1 arq2 > arq_temp5
fi
