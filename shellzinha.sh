#!/bin/bash

#Salva a variavel em forma global
barra="+------------------------------------------------+"

#Função Principal
principal(){

#Exibe o Menu
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
# -n parametro para permitir inserir o read na mesma linha
# read le o que o usuário digitar e salva na variavel cod_ini

#Caso o Codigo seja um dos escolhidos
#Leva para respectiva função
case $cod_ini in 
	1)escolha1 ;;
	2)escolha2 ;;
	3)escolha3 ;;
	4)escolha4 ;;
	5)escolha5 ;;
	6)escolha6 ;;
	*)cod_ini=0;;
esac

#Se o cod_ini for = 0
#Vai ficar em loop aguardando uma resposta correta 
if [ $cod_ini -lt 1 ]
then
	#limpa a tela
	clear

	#Exibe mensagem
	echo $barra
	echo "|    INSIRA UM VALOR VALIDO PARA CONTINUAR       |"
	echo $barra
	echo ""

	#Entra em modo de espera por 2 segundos
	sleep 1

	#Retorna para o começo da função
	#Para entrar com o valor correto
	principal
fi
}

escolha1(){
	#Chama a função para criar arquivo
	cria_arq

	#Le o arquivo com o delimitador ";" e salva os campos
	#Re-ordenado no padrão solicitado
	#DDD (5), Telefone(1) e Estado(3)
	awk -F ";" '{print $5,$1,$3}' arq3 > "$nome_arq"

	#Chama a função Final para verificar se o usuário deseja continuar
	final
}	

escolha2(){
	#Chama a função para criar arquivo
	cria_arq

	#Exibe somente as linhas 4 a 7 e salva no arquivo criado
	sed -n '4,7 p' arq2 > "$nome_arq"

	#Chama a função Final para verificar se o usuário deseja continuar
	final
}	

escolha3(){
	#Chama a função para criar arquivo
	cria_arq

	#Le os nomes do arq1 e deixa maiusculo e salva no arquivo criado
	cat arq1 | tr '[:lower:]' '[:upper:]' > "$nome_arq"

	#Chama a função Final para verificar se o usuário deseja continuar
	final
}

escolha4(){
	#Chama a função para criar arquivo
	cria_arq

	#Le as cidades do arq2 e salva somente uma vez
	#Com o sort e uniq no arquivo criado
	cat arq2 | sort | uniq > "$nome_arq"

	#Chama a função Final para verificar se o usuário deseja continuar
	final
	
}

escolha5(){
	#Chama a função para criar arquivo
	cria_arq

	#Agrupa os dados no formato Nome | Cidade e salva
	paste arq1 arq2 > "$nome_arq"

	#Chama a função Final para verificar se o usuário deseja continuar
	final
}

final(){
	#Limpa a tela
	clear

	#Exibe o menu
	echo "+-----------------------------------------------------------+"
	echo "| O Arquivo foi salvo com o nome: $nome_arq"
	echo "+-----------------------------------------------------------+"
	echo "| Deseja voltar para o menu principal? (S)Sim (N)Não        |" 
	echo "+-----------------------------------------------------------+"; read decisao

	#Deixa a primeira letra maiuscula
	decisao=${decisao^}

	case $decisao in
		S) $decisao = "S" ;;
		N) $decisao = "N" ;;
		*) $decisao = "Opcao Invalida!" ;;
	esac

 	#Se for "S"
	if [ $decisao = "S" ];
	then
		#Limpa a tela
		clear
		#Volta para o começo
		principal
	elif [ $decisao = "N" ]
	then
		#Sai do aplicativo
		exit
	else
		echo "Erro ao continuar, insira valor valido'." 
    	#Tempo de espera 2 segundos
    	sleep 2
    	#Volta pro começo da função final
    	final
	fi
}

cria_arq(){
	#Limpa a tela
	clear

	#Solicita o nome do arquivo e salva na variavel nome_arq
	echo -n "Insira o nome que deseja salvar seu arquivo: ";read nome_arq

	#Busca dentro da variavel nome com o egrep os caracteres especiais e espaços em branco
	#E depois joga em um local nulo para não replicar a mensagem do echo
	while echo "$nome_arq" | egrep [[:punct:][:blank:]] > /dev/null ;
	 do
    	echo "Erro ao continuar, não insira caracteres especiais."
    	sleep 2
    	cria_arq
 	done

	#Se o valor for branco / nulo pede pra
	#Reentrar com um valor valido
	while [ ${#nome_arq} -lt 1 ] ;
 	do
    	echo "Erro ao continuar, insira valor valido'." 
    	#Tempo de espera 2 segundos
    	sleep 2
    	#Volta pro começo da função cria_arq
    	cria_arq
 	done

	#Faz a data e concatena com o nome escolhido
	#Para evitar arquivos com o mesmo nome
	#Padrao: nomearq-DiaMesHoraMinutosSegundos
	#Ex.: relatorio-3010154433
	hoje=$(date '+%d%m%H%M%S')
	nome_arq=$nome_arq-$hoje

	#Cria um arquivo novo com o nome escolhido
	touch "$nome_arq"
}

principal
