#!/bin/bash

linha="+----------------------------+"
echo $linha
echo "|     CADASTRO EMPREGO       |
echo "|   1 - Cadastrar            |"
echo $linha ; read cod_ini

#Verifica se o codigo foi 1
if [ $cod_ini = "1" ]
then
  #limpa a tela
   clear

  #Fala pra ser digitado corretamente os valores
   echo $linha
   echo "|   Entre com os valores     |"
   echo "|   corretos para Cadastro   |"
   echo $linha

   #Exibição do questionario
   echo "Nome Completo:" ; read nome
   echo "Sexo (M ou F):" ; read sexo

   #Deixa todas as letras da variavel sexo maiuscula
   sexo=${sexo^^}

   #Verifica se o valor foi "M" ou "F"
   if [ $sexo = "M" -o $sexo = "F" ]
   then
      #Continua o Programa
      echo "Pretensão Salarial (Ex.: 1300):" ; read salario
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

      #Case para o codigo da função
      case $cod_func in
        1) nome_func="Cartógrafo";;
        2) nome_func="Assistente Social";;
        3) nome_func="Psicologo";;
        4) nome_func="Atendente";;
        5) nome_func="Secretária Bilingue";;
        6) nome_func="Geólogo";;
        *) cod_func="0";;
      esac
      
      #Se o codigo da funcão for diferente de 1 á 6 ele mostra
      #A mensagem a seguir
      if [ $cod_func = "0" ]
      then
        echo "Código selecionado indisponivel"
        echo "Tente novamente mais tarde."
      else
      #Limpa a tela e exibe o resultado final
        clear
        echo $linha
        echo "|       Cadastro Efetuado    |"
        echo $linha
        echo "Nome: $nome"
        echo "Função: $nome_func"
        echo -n 'Data:' ; date '+%d/%m/%Y'  
        echo $linha
      fi
    else
      echo "Erro ao inserir o valor de Sexo, inserir M ou F."
      echo "Finalizando shell"
    fi
else
   echo "Código inexistente"
fi
