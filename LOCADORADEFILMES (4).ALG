Algoritmo "LocadoraDeFilmes"

//Disciplina: Conceitos de Algoritmos
//Professor: Gilberto Viana de Oliveira

//Projeto - 2
//Descri��o do projeto: Sistema de gerenciamento para uma Locadora De Filmes
//Grupo: ""Unidos Pelo Objetivo""

//Desenvolvido por:
// Arthur de Freitas Carvalho
// Gabriel Antonio Pereira de Camargos
// Gabriel Henrique Moreira de Souza
// Gabriel Henrique da Silva Rocha
// Raul Gomes Neto


Var

   vetNome,vetSituacao: vetor [0..9] de caractere
   vetAno,vetQtFilmes: vetor [0..9] de inteiro
   resp, maisLocado, escolhaMenu2, escolhaMenu, i, i2, alSituacao, devSituacao, escolhaSituacao: inteiro

   //Procedimento do menu
procedimento menu()

inicio

   repita
      //Interface do menu
      escreval()
      escreval("<><><><><><><><><><><><><><><><><><><><>|")
      escreval("                  MENU                  |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 1 - Cadastrar um filme                 |")
      escreval("                                        |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 2 - Listar fimes locados e disponiveis |")
      escreval("                                        |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 3 - Filmes locados                     |")
      escreval("                                        |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 4 - Alugar um filme                    |")
      escreval("                                        |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 5 - Devolver um filme                  |")
      escreval("                                        |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 6 - Filme mais locado                  |")
      escreval("                                        |")
      escreval("----------------------------------------|")
      escreval("                                        |")
      escreval(" 7 - Sair do programa                   |")
      escreval("                                        |")
      escreval("<><><><><><><><><><><><><><><><><><><><>|")
      leia(escolhaMenu)

      escolha(escolhaMenu)

      caso 1
         //No caso 1, ser� executado o procedimento "cadastro"
         cadastro()

      caso 2
         //No caso 2, ser� executado o procedimento "listaFilmes"
         listaFilmes()

      caso 3
         //No caso 3, ser� executado o procedimento "FilmesLocados"
         FilmesLocados()

      caso 4
         //No caso 4, ser� executado o procedimento "AlugarFilme"
         AlugarFilme()

      caso 5
         //No caso 5, ser� executado o procedimento "DevolverFilme"
         DevolverFilme()

      caso 6
         //No caso 6, ser� executado o procedimento "FilmeMaisLocado"
         FilmeMaisLocado()

      caso 7
         //No caso 7 o programa ser� encerrado
         limpatela()
         escreva("Fim do programa!")
      fimescolha
   ate (escolhaMenu = 7)

   limpatela()
fimprocedimento

//Procedimento CADASTRO Caso 1
procedimento cadastro()

var

inicio
   limpatela
   se (i2 < 10) entao
      repita
         limpatela()

         //Definindo o nome do filme
         repita
            //Impedindo o usu�rio de n�o digitar um nome para o filme
            i <- i2
            escreval()
            escreval("Digite o nome do filme: ")
            leia(vetNome[i])
            escreval()
         ate (vetNome[i] <> "") e (vetNome[i] <> " ")

         //Definindo o ano de lan�amento do filme
         repita
            //Impedindo o usu�rio de n�o digitar um ano para o filme
            escreval()
            escreval("Digite o ano de lan�amento do filme: ")
            leia(vetAno[i])
            escreval()
         ate (vetAno[i] <> "") e (vetAno[i] <> " ")

         //Definindo a quantidade de vezes que o filme foi alugado
         repita
            //Impedindo o usu�rio de n�o digitar a quantidade de vezes que o filme foi alugado
            escreval()
            escreval("Escreva a quantidade de vezes que esse filme foi alugado: ")
            leia(vetQtFilmes[i])
            escreval()
         ate (vetQtFilmes[i] <> "") e (vetQtFilmes[i] <> " ")

         //Definindo se o filme est� alugado ou n�o
         repita
            //Limitando a escolha do usu�rio a 1 ou 2
            escreval()
            escreval("O filme est� alugado? ")
            escreval("1 - Sim")
            escreval("2 - N�o")
            escreval()
            leia(escolhaSituacao)
         ate (escolhaSituacao = 1) ou (escolhaSituacao = 2)

         escolha(escolhaSituacao)

         caso 1
            //Caso o filme esteja alugado, o vetor na posi��o i receber� "sim"
            vetSituacao[i] <- "Sim"

         caso 2
            //Caso o filme n�o esteja alugado, o vetor na posi��o i receber� "n�o"
            vetSituacao[i] <- "N�o"

         fimescolha

         //Op��o para cadastrar ou n�o outro filme
         repita
            //Limitando a escolha do usu�rio a 1 ou 2
            escreval()
            escreval("Deseja cadastrar outro filme? ")
            escreval("1 - Sim")
            escreval("2 - N�o")
            escreval()
            leia(resp)
         ate (resp = 1) ou (resp = 2)

         //Incrementando a vari�vel contadora de filmes cadastrados
         i2<-i2+1

         //Encerrando a op��o de cadastro
         //"resp = 2" o usu�rio n�o deseja cadastrar outro filme
         //"i2 = 10" o usu�rio j� cadastrou 10 filmes
      ate (resp = 2) ou (i2 = 10)
   senao
      //A op��o 1 s� ser� executada caso haja menos de 10 filmes cadastrados
      se (i2=10) entao
         //Se houver 10 filmes cadastrados, ser� mostrada a seguinte mensagem
         escreva("A quantidade m�xima de filmes j� foi registrada no sistema.")
      fimse
   fimse
   escreval()
fimprocedimento

//Procedimento "LISTAR FILMES" caso 2
procedimento listaFilmes()

var

   //declarando as vari�veis locais do procedimento listaFilmes()
   vetVazio: vetor[0..9] de logico
   vazio: logico

inicio

   limpatela()
   vazio <- VERDADEIRO
   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         //Se o vetor de filmes na posi��o i n�o possuir nomes
         //O vetor vetVazio na posi��o i recebe verdadeiro
         vetVazio[i] <- VERDADEIRO
      senao
         se (vetNome[i] <> "") entao
            //Se o vetor de filmes na posi��o i possuir nomes
            //Ser� listado o filme e as informa��es
            //O vetor vetVazio na posi��o i recebe falso
            escreval("Nome: ",vetNome[i]," | Ano de lan�amento: ",vetAno[i]," | Quantidade de vezes que o filme foi alugado: ",vetQtFilmes[i]," | Situa��o: ",vetSituacao[i])
            vetVazio[i] <- FALSO
         fimse
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      //Se o vetor vetVazio na posi��o i for igual a falso, a vari�vel vazio recebe falso
      se vetVazio[i] = FALSO entao
         vazio <- FALSO
      fimse
   fimpara

   //Se a vari�vel vazio for igual a verdadeiro
   //O usu�rio ter� que cadastrar um filme para depois exibir a lista
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema.")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - n�o")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)

      caso 1
         //Caso o usu�rio desejar cadastrar um filme, ser� executado o procedimento de cadastro
         cadastro()

      caso 2
         //Caso o usu�rio n�o queira, ser� exibido o menu
         menu()

      fimescolha
   fimse
fimprocedimento

//Prcedimento FILMES LOCADOS caso 3
procedimento FilmesLocados()

var

   //declarando as vari�veis locais do procedimento FilmesLocados()
   vetVazio: vetor[0..9] de logico
   vazio: logico

inicio

   limpatela()
   vazio <- VERDADEIRO

   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         //Se o vetor de filmes na posi��o i n�o possuir nomes
         //O vetor vetVazio na posi��o i recebe verdadeiro
         vetVazio[i] <- VERDADEIRO
      senao
         //Se possuir nomes vetVazio na posi��o i recebe falso
         vetVazio[i] <- FALSO
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      se vetVazio[i] = FALSO entao
         //Se o vetor vetVazio na posi��o i for igual a falso, a vari�vel vazio recebe falso
         vazio <- FALSO
      fimse
   fimpara

   //Se possuir filme cadastrados, ser�o listados os filmes locados
   se vazio = FALSO entao
      escreval("Filmes locados: ")
      para i de 0 ate 9 passo 1 faca
         se (vetSituacao[i] = "Sim") entao
            //Se o filmes estiver locado ser� listado o nome
            escreval(vetNome[i])
         fimse
      fimpara
   fimse

   //Se n�o possuir filmes cadastrados no programa o usu�rio ser� questionado
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema!")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - n�o")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)

      caso 1
         //Execuntando o procedimento de cadastro caso a resposta for "sim"
         cadastro()

      caso 2
         //Retornando ao menu caso a resposta for "n�o"
         menu()

      fimescolha
   fimse
fimprocedimento

// Procedimento ALUGAR FILME caso 4
procedimento AlugarFilme()

var

   //declarando as vari�veis locais do procedimento AlugarFilme()
   vetVazio: vetor[0..9] de logico
   vazio, todosAlugados: logico

inicio

   limpatela()
   todosAlugados <- VERDADEIRO
   vazio <- verdadeiro

   //Definindo se possui ou n�o filmes cadastrados no sistema
   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         vetVazio[i] <- VERDADEIRO
      senao
         vetVazio[i] <- FALSO
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      se vetVazio[i] = FALSO entao
         vazio <- FALSO
      fimse
   fimpara

   //Definindo se possui filmes n�o locados no sistema
   para i de 0 ate 9 passo 1 faca
      se vetSituacao[i] = "N�o" entao
         todosAlugados <- FALSO
      fimse
   fimpara

   //Se o sistema possui filmes e algum deles dispon�vel, ser�o listados esses
   se (vazio = FALSO) e (todosAlugados = FALSO) entao
      escreval("Lista de filmes n�o locados: ")
      para i de 0 ate 9 faca
         //Se o filme na posi��o i do vetor vetNome[] n�o estiver locado ele ser� listado
         se vetSituacao[i] = "N�o" entao
            escreval(i,"- ",vetNome[i])
         fimse
      fimpara
      escreval("")
      //Definindo o filme que ser� locado
      escreval("Digite o numero do filme que deseja alugar: ")
      leia(alSituacao)
      para i de 0 ate 9 faca
         //Definindo o filme escolhido como locado
         se alSituacao = i entao
            vetSituacao[i] <- "Sim"
            vetQtFilmes[i] <- vetQtFilmes[i] + 1
         fimse
      fimpara
   fimse

   //Se n�o possuir filmes cadastrados no programa o usu�rio poder� cadastrar
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema.")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - n�o")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)
      caso 1
         cadastro()

      caso 2
         menu()
      fimescolha

   senao

      //O usu�rio poder� cadastrar um filme se todos os filmes estiverem locados e haja vaga para cadastrar outro
      se todosAlugados = VERDADEIRO entao
         escreval("Todos filmes registrados no sistema j� est�o alugados no momento.")
         escreval("Deseja cadastrar outro filme no sistema?")
         escreval("1 - sim")
         escreval("2 - n�o")
         leia(escolhaMenu2)

         escolha(escolhaMenu2)
         caso 1
            cadastro()

         caso 2
            menu()
         fimescolha
      fimse
   fimse
fimprocedimento

//Procedimento DEVOLVER FILME caso 5
procedimento DevolverFilme()
var

   //declarando as vari�veis locais do procedimento DevolverFilme()
   vetVazio: vetor[0..9] de logico
   vazio, todosLocados: logico

inicio

   limpatela()
   todosLocados <- VERDADEIRO
   vazio <- verdadeiro

   //Definindo se possui ou n�o filmes cadastrados no sistema
   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         vetVazio[i] <- VERDADEIRO
      senao
         vetVazio[i] <- FALSO
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      se vetVazio[i] = FALSO entao
         vazio <- FALSO
      fimse
   fimpara

   //Definindo se os filmes est�o todos locados ou n�o
   para i de 0 ate 9 passo 1 faca
      se vetSituacao[i] = "Sim" entao
         todosLocados <- FALSO
      fimse
   fimpara

   //Se o sistema possui filmes e todos n�o est�o locados, ser�o listados
   se (vazio = FALSO) e (todosLocados = FALSO) entao
      escreval("Lista de filmes locados: ")
      escreval("")
      para i de 0 ate 9 faca
         //Listando os filmes locados
         se vetSituacao[i] = "Sim" entao
            escreval(i,"- ",vetNome[i])
         fimse
      fimpara
      escreval("")
      //Definindo qual filme ser� devolvido � locadora
      escreval("Digite o n�mero do filme que deseja devolver: ")
      leia(devSituacao)
      para i de 0 ate 9 faca
         se devSituacao = i entao
            //Definindo o filme escolhindo como n�o locado
            vetSituacao[i] <- "N�o"
         fimse
      fimpara
   fimse

   //Se n�o possuir filmes cadastrados no programa o usu�rio poder� cadastrar
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema.")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - n�o")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)
      caso 1
         //Execuntando o procedimento de cadastro caso a resposta for "sim"
         cadastro()

      caso 2
         //Caso o usu�rio n�o queira, ser� exibido o menu
         menu()
      fimescolha

      //Se todos os filmes do sistema est�o dispon�veis, o usu�rio poder� alugar algum
   senao
      se todosLocados = VERDADEIRO entao
         escreval("Nenhum filme registrado no sistema est� locado no momento!")
         escreval("Deseja alugar um filme agora?")
         escreval("1 - sim")
         escreval("2 - n�o")
         leia(escolhaMenu2)

         escolha(escolhaMenu2)
         caso 1
            //Execuntando o procedimento de alugar filmes caso a resposta for "sim"
            AlugarFilme()

         caso 2
            //Caso o usu�rio n�o queira, ser� exibido o menu
            menu()
         fimescolha
      fimse
   fimse
fimprocedimento

// Procedimento Filme MAIS LOCADO caso 6
procedimento FilmeMaisLocado()

var

   //declarando as vari�veis locais do procedimento FilmeMaisLocado()
   vetVazio: vetor[0..9] de logico
   vazio: logico

inicio

   limpatela()
   vazio <- VERDADEIRO

   //Definindo se possui ou n�o filmes cadastrados no sistema
   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         vetVazio[i] <- VERDADEIRO
      senao
         vetVazio[i] <- FALSO
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      se vetVazio[i] = FALSO entao
         vazio <- FALSO
      fimse
   fimpara

   //Se o sistema possuir filmes, ent�o ser� listado o mais locado
   se vazio = FALSO entao
      //Definindo o filme mais locado
      maisLocado <- vetQtFilmes[0]
      para i de 0 ate 9 faca
         se vetQtFilmes[i] > maisLocado entao
            maisLocado <- vetQtFilmes[i]
         fimse
      fimpara

      //Mostrando o filme mais locado e sua descri��o
      para i de 0 ate 9 faca
         se vetQtFilmes[i] = maisLocado entao
            escreval("Filme mais alugado: ")
            escreval("")
            escreval("Nome: ",vetNome[i])
            escreval("Ano de lan�amento: ",vetAno[i])
            escreval("Quantidade de vezes que o filme foi alugado: ",vetQtFilmes[i])
            escreval("Alugado? ",vetSituacao[i])
         fimse
      fimpara
   fimse

   //Se n�o possuir filmes cadastrados no programa o usu�rio poder� cadastrar
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema!")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - n�o")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)
      caso 1
         //Execuntando o procedimento de cadastro caso a resposta for "sim"
         cadastro()

      caso 2
         //Caso o usu�rio n�o queira, ser� exibido o menu
         menu()
      fimescolha
   fimse
fimprocedimento

inicio

   //Executando o procedimento do menu, a base do programa
   menu()

Fimalgoritmo