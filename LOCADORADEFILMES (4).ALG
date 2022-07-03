Algoritmo "LocadoraDeFilmes"

//Disciplina: Conceitos de Algoritmos
//Professor: Gilberto Viana de Oliveira

//Projeto - 2
//Descrição do projeto: Sistema de gerenciamento para uma Locadora De Filmes
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
         //No caso 1, será executado o procedimento "cadastro"
         cadastro()

      caso 2
         //No caso 2, será executado o procedimento "listaFilmes"
         listaFilmes()

      caso 3
         //No caso 3, será executado o procedimento "FilmesLocados"
         FilmesLocados()

      caso 4
         //No caso 4, será executado o procedimento "AlugarFilme"
         AlugarFilme()

      caso 5
         //No caso 5, será executado o procedimento "DevolverFilme"
         DevolverFilme()

      caso 6
         //No caso 6, será executado o procedimento "FilmeMaisLocado"
         FilmeMaisLocado()

      caso 7
         //No caso 7 o programa será encerrado
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
            //Impedindo o usuário de não digitar um nome para o filme
            i <- i2
            escreval()
            escreval("Digite o nome do filme: ")
            leia(vetNome[i])
            escreval()
         ate (vetNome[i] <> "") e (vetNome[i] <> " ")

         //Definindo o ano de lançamento do filme
         repita
            //Impedindo o usuário de não digitar um ano para o filme
            escreval()
            escreval("Digite o ano de lançamento do filme: ")
            leia(vetAno[i])
            escreval()
         ate (vetAno[i] <> "") e (vetAno[i] <> " ")

         //Definindo a quantidade de vezes que o filme foi alugado
         repita
            //Impedindo o usuário de não digitar a quantidade de vezes que o filme foi alugado
            escreval()
            escreval("Escreva a quantidade de vezes que esse filme foi alugado: ")
            leia(vetQtFilmes[i])
            escreval()
         ate (vetQtFilmes[i] <> "") e (vetQtFilmes[i] <> " ")

         //Definindo se o filme está alugado ou não
         repita
            //Limitando a escolha do usuário a 1 ou 2
            escreval()
            escreval("O filme está alugado? ")
            escreval("1 - Sim")
            escreval("2 - Não")
            escreval()
            leia(escolhaSituacao)
         ate (escolhaSituacao = 1) ou (escolhaSituacao = 2)

         escolha(escolhaSituacao)

         caso 1
            //Caso o filme esteja alugado, o vetor na posição i receberá "sim"
            vetSituacao[i] <- "Sim"

         caso 2
            //Caso o filme não esteja alugado, o vetor na posição i receberá "não"
            vetSituacao[i] <- "Não"

         fimescolha

         //Opção para cadastrar ou não outro filme
         repita
            //Limitando a escolha do usuário a 1 ou 2
            escreval()
            escreval("Deseja cadastrar outro filme? ")
            escreval("1 - Sim")
            escreval("2 - Não")
            escreval()
            leia(resp)
         ate (resp = 1) ou (resp = 2)

         //Incrementando a variável contadora de filmes cadastrados
         i2<-i2+1

         //Encerrando a opção de cadastro
         //"resp = 2" o usuário não deseja cadastrar outro filme
         //"i2 = 10" o usuário já cadastrou 10 filmes
      ate (resp = 2) ou (i2 = 10)
   senao
      //A opção 1 só será executada caso haja menos de 10 filmes cadastrados
      se (i2=10) entao
         //Se houver 10 filmes cadastrados, será mostrada a seguinte mensagem
         escreva("A quantidade máxima de filmes já foi registrada no sistema.")
      fimse
   fimse
   escreval()
fimprocedimento

//Procedimento "LISTAR FILMES" caso 2
procedimento listaFilmes()

var

   //declarando as variáveis locais do procedimento listaFilmes()
   vetVazio: vetor[0..9] de logico
   vazio: logico

inicio

   limpatela()
   vazio <- VERDADEIRO
   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         //Se o vetor de filmes na posição i não possuir nomes
         //O vetor vetVazio na posição i recebe verdadeiro
         vetVazio[i] <- VERDADEIRO
      senao
         se (vetNome[i] <> "") entao
            //Se o vetor de filmes na posição i possuir nomes
            //Será listado o filme e as informações
            //O vetor vetVazio na posição i recebe falso
            escreval("Nome: ",vetNome[i]," | Ano de lançamento: ",vetAno[i]," | Quantidade de vezes que o filme foi alugado: ",vetQtFilmes[i]," | Situação: ",vetSituacao[i])
            vetVazio[i] <- FALSO
         fimse
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      //Se o vetor vetVazio na posição i for igual a falso, a variável vazio recebe falso
      se vetVazio[i] = FALSO entao
         vazio <- FALSO
      fimse
   fimpara

   //Se a variável vazio for igual a verdadeiro
   //O usuário terá que cadastrar um filme para depois exibir a lista
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema.")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - não")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)

      caso 1
         //Caso o usuário desejar cadastrar um filme, será executado o procedimento de cadastro
         cadastro()

      caso 2
         //Caso o usuário não queira, será exibido o menu
         menu()

      fimescolha
   fimse
fimprocedimento

//Prcedimento FILMES LOCADOS caso 3
procedimento FilmesLocados()

var

   //declarando as variáveis locais do procedimento FilmesLocados()
   vetVazio: vetor[0..9] de logico
   vazio: logico

inicio

   limpatela()
   vazio <- VERDADEIRO

   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         //Se o vetor de filmes na posição i não possuir nomes
         //O vetor vetVazio na posição i recebe verdadeiro
         vetVazio[i] <- VERDADEIRO
      senao
         //Se possuir nomes vetVazio na posição i recebe falso
         vetVazio[i] <- FALSO
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      se vetVazio[i] = FALSO entao
         //Se o vetor vetVazio na posição i for igual a falso, a variável vazio recebe falso
         vazio <- FALSO
      fimse
   fimpara

   //Se possuir filme cadastrados, serão listados os filmes locados
   se vazio = FALSO entao
      escreval("Filmes locados: ")
      para i de 0 ate 9 passo 1 faca
         se (vetSituacao[i] = "Sim") entao
            //Se o filmes estiver locado será listado o nome
            escreval(vetNome[i])
         fimse
      fimpara
   fimse

   //Se não possuir filmes cadastrados no programa o usuário será questionado
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema!")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - não")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)

      caso 1
         //Execuntando o procedimento de cadastro caso a resposta for "sim"
         cadastro()

      caso 2
         //Retornando ao menu caso a resposta for "não"
         menu()

      fimescolha
   fimse
fimprocedimento

// Procedimento ALUGAR FILME caso 4
procedimento AlugarFilme()

var

   //declarando as variáveis locais do procedimento AlugarFilme()
   vetVazio: vetor[0..9] de logico
   vazio, todosAlugados: logico

inicio

   limpatela()
   todosAlugados <- VERDADEIRO
   vazio <- verdadeiro

   //Definindo se possui ou não filmes cadastrados no sistema
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

   //Definindo se possui filmes não locados no sistema
   para i de 0 ate 9 passo 1 faca
      se vetSituacao[i] = "Não" entao
         todosAlugados <- FALSO
      fimse
   fimpara

   //Se o sistema possui filmes e algum deles disponível, serão listados esses
   se (vazio = FALSO) e (todosAlugados = FALSO) entao
      escreval("Lista de filmes não locados: ")
      para i de 0 ate 9 faca
         //Se o filme na posição i do vetor vetNome[] não estiver locado ele será listado
         se vetSituacao[i] = "Não" entao
            escreval(i,"- ",vetNome[i])
         fimse
      fimpara
      escreval("")
      //Definindo o filme que será locado
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

   //Se não possuir filmes cadastrados no programa o usuário poderá cadastrar
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema.")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - não")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)
      caso 1
         cadastro()

      caso 2
         menu()
      fimescolha

   senao

      //O usuário poderá cadastrar um filme se todos os filmes estiverem locados e haja vaga para cadastrar outro
      se todosAlugados = VERDADEIRO entao
         escreval("Todos filmes registrados no sistema já estão alugados no momento.")
         escreval("Deseja cadastrar outro filme no sistema?")
         escreval("1 - sim")
         escreval("2 - não")
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

   //declarando as variáveis locais do procedimento DevolverFilme()
   vetVazio: vetor[0..9] de logico
   vazio, todosLocados: logico

inicio

   limpatela()
   todosLocados <- VERDADEIRO
   vazio <- verdadeiro

   //Definindo se possui ou não filmes cadastrados no sistema
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

   //Definindo se os filmes estão todos locados ou não
   para i de 0 ate 9 passo 1 faca
      se vetSituacao[i] = "Sim" entao
         todosLocados <- FALSO
      fimse
   fimpara

   //Se o sistema possui filmes e todos não estão locados, serão listados
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
      //Definindo qual filme será devolvido à locadora
      escreval("Digite o número do filme que deseja devolver: ")
      leia(devSituacao)
      para i de 0 ate 9 faca
         se devSituacao = i entao
            //Definindo o filme escolhindo como não locado
            vetSituacao[i] <- "Não"
         fimse
      fimpara
   fimse

   //Se não possuir filmes cadastrados no programa o usuário poderá cadastrar
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema.")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - não")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)
      caso 1
         //Execuntando o procedimento de cadastro caso a resposta for "sim"
         cadastro()

      caso 2
         //Caso o usuário não queira, será exibido o menu
         menu()
      fimescolha

      //Se todos os filmes do sistema estão disponíveis, o usuário poderá alugar algum
   senao
      se todosLocados = VERDADEIRO entao
         escreval("Nenhum filme registrado no sistema está locado no momento!")
         escreval("Deseja alugar um filme agora?")
         escreval("1 - sim")
         escreval("2 - não")
         leia(escolhaMenu2)

         escolha(escolhaMenu2)
         caso 1
            //Execuntando o procedimento de alugar filmes caso a resposta for "sim"
            AlugarFilme()

         caso 2
            //Caso o usuário não queira, será exibido o menu
            menu()
         fimescolha
      fimse
   fimse
fimprocedimento

// Procedimento Filme MAIS LOCADO caso 6
procedimento FilmeMaisLocado()

var

   //declarando as variáveis locais do procedimento FilmeMaisLocado()
   vetVazio: vetor[0..9] de logico
   vazio: logico

inicio

   limpatela()
   vazio <- VERDADEIRO

   //Definindo se possui ou não filmes cadastrados no sistema
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

   //Se o sistema possuir filmes, então será listado o mais locado
   se vazio = FALSO entao
      //Definindo o filme mais locado
      maisLocado <- vetQtFilmes[0]
      para i de 0 ate 9 faca
         se vetQtFilmes[i] > maisLocado entao
            maisLocado <- vetQtFilmes[i]
         fimse
      fimpara

      //Mostrando o filme mais locado e sua descrição
      para i de 0 ate 9 faca
         se vetQtFilmes[i] = maisLocado entao
            escreval("Filme mais alugado: ")
            escreval("")
            escreval("Nome: ",vetNome[i])
            escreval("Ano de lançamento: ",vetAno[i])
            escreval("Quantidade de vezes que o filme foi alugado: ",vetQtFilmes[i])
            escreval("Alugado? ",vetSituacao[i])
         fimse
      fimpara
   fimse

   //Se não possuir filmes cadastrados no programa o usuário poderá cadastrar
   se vazio = VERDADEIRO entao
      escreval("Nenhum filme foi registrado no sistema!")
      escreval("Deseja cadastrar um filme no sistema agora?")
      escreval("1 - sim")
      escreval("2 - não")
      leia(escolhaMenu2)

      escolha(escolhaMenu2)
      caso 1
         //Execuntando o procedimento de cadastro caso a resposta for "sim"
         cadastro()

      caso 2
         //Caso o usuário não queira, será exibido o menu
         menu()
      fimescolha
   fimse
fimprocedimento

inicio

   //Executando o procedimento do menu, a base do programa
   menu()

Fimalgoritmo