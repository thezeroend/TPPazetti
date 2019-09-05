#!/bin/bash
echo "+----------------------------+"
echo "|   SHELLZINHA PARA JUNIOR   |"
echo "|   1 - Cadastrar            |"
echo "+----------------------------+" ; read cod_ini

echo ""

if [ $cod_ini = "1" ]
then
   #Variavel para salvar a data da consulta
   #data= ;date '+%d/%m/%Y'
   
   #Exibição do questionario
   echo "Nome Completo:" ; read nome
   echo "Sexo (M ou F):" ; read sexo
   echo "Pretensão Salarial (Ex.: 1.300):" ; read salario
   echo "Idade:" ; read idade
   echo "+----------------------------+"
   echo "|      Lista de Códigos      |"
   echo "|    1 - Cartógrafo          |"
   echo "|    2 - Assistente Social   |"
   echo "|    3 - Psicologo           |"
   echo "|    4 - Atendente           |"
   echo "|    5 - Secretária Bilingue |"
   echo "|    6 - Geólogo             |"
   echo "+----------------------------+"
   echo ""
   echo "Código da função desejada:" ; read cod_func

   case $cod_func in
     1) nome_func="Cartógrafo";;
     2) nome_func="Assistente Social";;
     3) nome_func="Psicologo";;
     4) nome_func="Atendente";;
     5) nome_func="Secretária Bilingue";;
     6) nome_func="Geólogo";;
     *) echo "Esse código não existe";;
   esac
   
   echo "+---------------------------------+"
   echo "|       Cadastro Efetuado         |"
   echo "+---------------------------------+"
   echo "Nome: $nome"
   echo "Função: $nome_func"
   echo "Data: " ; date '+%d/%m/%Y'
   
   echo "-----------------------------------"
else
   echo "Código inexistente"
fi



