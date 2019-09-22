#!/bin/bash

principal(){
  #Limpa a tela antes de começar
  clear

  #Salva a linha utilizada para layout
  linha="+----------------------------+"

  #Menu inicial
  echo $linha
  echo "|   CADASTRO DE EMPREGO      |"
  echo "|   1 - Cadastrar            |"
  echo $linha ; read cod_ini

  #Se o código inicial for diferente de 1 ele retorna ao começo.
  while [ $cod_ini != 1 ];do
      echo "Tente novamente digitando o código correto"
      sleep 2
      clear
      principal
  done

  #limpa a tela
  clear

  #Fala pra ser digitado corretamente os valores
  echo $linha
  echo "|   Entre com os valores     |"
  echo "|   corretos para Cadastro   |"
  echo $linha

  #Chama a função nome
  nome
  
  #Chama a função sexo
  sexo

  #Chama a função pretensao
  pretensao

  #Chama a função idade
  idade

  #Exibe tabela de códigos
  echo $linha
  echo "|      Lista de Códigos      |"
  echo "|    1 - Cartógrafo          |"
  echo "|    2 - Assistente Social   |"
  echo "|    3 - Psicologo           |"
  echo "|    4 - Atendente           |"
  echo "|    5 - Secretária Bilingue |"
  echo "|    6 - Geólogo             |"
  echo $linha
  echo ""

  #Chama a função funcao
  funcao
    
  #Limpa a tela e exibe o resultado final
  clear
  echo $linha
  echo "|       Cadastro Efetuado    |"
  echo $linha
  echo "Nome: ${nome^}"
  echo "Função: $nome_func"
  echo -n 'Data:' ; date '+%d/%m/%Y'  
  echo $linha
  
}

nome(){
  #Exibição do questionario
  echo -n "Nome Completo:" ; read nome

  #Se a qntd de letras for menor que 3 entra no while
  while [ ${#nome} -lt 2 ] ;
  do
    echo "Erro ao continuar, insira um nome valido."
    sleep 2
    nome
  done

  #Verifica se na variavel contem caracteres especiais ou digitos
  while echo "$nome" | egrep [[:punct:][:digit:]] ;
  do
    echo "Erro ao continuar, não insira numeros ou caracteres especiais."
    echo "Somente Letras."
    sleep 2
    nome
  done

}

sexo(){
  #Exibe na tela e le o valor
  echo -n "Sexo M(Masculino) ou F(Feminino):" ; read sexo

  #Deixa a letra da variavel sexo maiuscula
  sexo=${sexo^}

  #Se a qntd de letras for menor que 1 entra no while
  while [ ${#sexo} -lt 1 ] ;
  do
    echo "Erro ao continuar, insira valor valido para sexo."
    sleep 2
    sexo
  done

  #Verifica se o valor for diferente de M ou F ele pede pra reentrar o valor.
  if [ $sexo != "F" ]
  then
    if [ $sexo != "M" ]
    then
      while [  $sexo != "M" ] ; do
        echo "Erro ao continuar, entre com os valores M para masculino ou F para feminino."
        sleep 2
        sexo
      done
    fi
  else
    while [ $sexo != "F" ] ; do
        echo "Erro ao continuar, entre com os valores M para masculino ou F para feminino."
        sleep 2
        sexo
      done
    
  fi
}

pretensao(){
  #Exibe mensagem e pede entrada do dado.
  echo -n "Pretensão Salarial (Ex.: 1300):" ; read salario

  #Se a qntd de letras for menor que 1 entra no while
  while [ ${#salario} -lt 2 ] ;
  do
    echo "Erro ao continuar, insira valor valido para a pretensão."
    sleep 2
    pretensao
  done

  #Busca dentro da variavel nome com o egrep os caracteres especiais, alfabeticos[a-z] e espaços em branco

  while echo "$salario" | egrep [[:punct:][:alpha:][:blank:]] ;
  do
    echo "Erro ao continuar, não insira letras, pontos ou caracteres especiais."
    echo "Somente Numeros."
    sleep 2
    pretensao
  done
}

idade(){
  #Exibe mensagem e pede entrada do dado.
  echo -n "Idade:" ; read idade

  #Busca dentro da variavel nome com o egrep os caracteres especiais, alfabeticos[a-z] e espaços em branco

  while echo "$idade" | egrep [[:punct:][:alpha:][:blank:]] ;
  do
    echo "Erro ao continuar, não insira letras ou caracteres especiais."
    echo "Somente Numeros."
    sleep 2
    pretensao
  done
  
  #Se a qntd de letras for menor que 1 entra no while
  while [ ${#idade} -lt 1 ] ;
  do
    echo "Erro ao continuar, insira valor valido."
    sleep 2
    idade
  done

  #Se a idade for menor de 18 fala que a idade minima é 18 finaliza o cadastro.
  if [ $idade -lt "18" ]
  then
    echo "A idade minima para se candidatar é 18 anos"
    echo "Encerrando cadastro."
    sleep 5
    clear
    principal
  fi
}

funcao(){
    #Exibe mensagem e pede entrada do dado.
    echo -n "Código da função desejada:" ; read cod_func

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
        
    while [ $cod_func -lt "1" ] ; do
      echo "Erro ao continuar, selecione um código existente."
      sleep 2
      funcao
    done

}


principal
