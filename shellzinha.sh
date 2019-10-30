#!/bin/bash

#Salva a variavel em forma global
barra="+------------------------------------------------+"

principal(){

echo $barra
echo "|    Selecione a opção que deseja executar       |"
echo $barra
echo "|  1 - Novo arq com DDD, Telefone, Estado        |"
echo "|  2 - Novo arq com cidades 4,5,6 e 7            |"
echo "|  3 - Novo arq com Nomes em letra maiuscula     |"
echo "|  4 - Novo arq sem cidades repetidas            |"
echo "|  5 - Novo arq com nome e cidade                |"
echo "|  6 - Outros                                    |"
echo $barra
echo -n "Entre com uma das opções acima: " ; read cod_ini

case $cod_ini in 
	1)escolha1 ;;
	2)escolha2 ;;
	3)escolha3 ;;
	4)escolha4 ;;
	5)escolha5 ;;
	6)escolha6 ;;
	*)cod_ini=0;;
esac

while [ $cod_ini -lt 1 ];do
		clear

		echo $barra
		echo "|    INSIRA UM VALOR VALIDO PARA CONTINUAR       |"
		echo $barra
		echo ""

		principal
done
}

escolha1(){
	clear

	#Faz o nome do arquivo
	echo $barra
	echo -n "|Insira o nome que deseja salvar seu arquivo: " ; read nome_arq

	#Faz a data e concatena com o nome escolhido
	hoje=$(date '+%d%m%H%M%S')
	nome_arq=$nome_arq-$hoje

	#Cria um arquivo novo com o nome escolhido
	#Padrao: nomearq-DiaMesHoraMinutosSegundos
	#Ex.: relatorio-3010154433
	touch "$nome_arq"

	awk -F ";" '{print $5,$1,$3}' arq3 > "$nome_arq"

	clear

	echo "+-----------------------------------------------------------+"
	echo "| O Arquivo foi salvo com o nome: $nome_arq                 "
	echo "+-----------------------------------------------------------+"
	echo "| Deseja voltar para o menu principal? (S)Sim (N)Não        |" 
	echo "+-----------------------------------------------------------+"; read decisao
	if [ $decisao = "S" ]
	then
		clear

		principal
	else
		clear
		
		exit
	fi
}	




principal


#if [ $escolha = 1 ]
#then
#	awk -F ";" '{print $5,$1,$3}' arq3 > arq_temp
#elif [ $escolha = 2 ]
#then
#	sed -n '4,7 p' arq2 > arq_temp2
#elif [ $escolha = 3 ]
#then
#	cat arq1 | tr '[:lower:]' '[:upper:]' > arq_temp3 
#elif [ $escolha = 4 ]
#then
#	cat arq2 | sort | uniq > arq_temp4
#elif [ $escolha = 5 ]
#then
#	paste arq1 arq2 > arq_temp5
#fi

