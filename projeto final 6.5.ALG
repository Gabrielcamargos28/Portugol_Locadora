Algoritmo "LocadoraDeFilmes"

//Projeto - 2
//Grupo: ""Unidos Pelo Objetivo""

//Disciplina: Conceitos de Algoritmos
//Professor: Gilberto Viana de Oliveira

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

procedimento menu()
inicio
   repita

      escreval()
      escreval()
      escreval("<><><><><><><><><><><><><><><><><><><><>|")
      escreval("Menu                                    |")
      escreval("<><><><><><><><><><><><><><><><><><><><>|")
      escreval("1 - Cadastrar filme                     |")
      escreval("2 - Listar fimes locados e disponiveis  |")
      escreval("3 - Filmes locados                      |")
      escreval("4 - Alugar um filme                     |")
      escreval("5 - Devolver um filme                   |")
      escreval("6 - Filme mais locado                   |")
      escreval("7 - Sair do programa                    |")
      escreval("<><><><><><><><><><><><><><><><><><><><>|")
      leia(escolhaMenu)

      escolha(escolhaMenu)

      caso 1
         cadastro()
      caso 2
         listaFilmes()
      caso 3
         FilmesLocados()
      caso 4
         AlugarFilme()
      caso 5
         DevolverFilme()
      caso 6
         FilmeMaisLocado()
      caso 7
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
   se (i2 < 10) entao
      repita
         limpatela()
         repita
            i <- i2
            escreval()
            escreval("Digite o nome do filme: ")
            leia(vetNome[i])
            escreval()
         ate (vetNome[i] <> "") e (vetNome[i] <> " ")
         repita
            escreval()
            escreval("Digite o ano de lançamento do filme: ")
            leia(vetAno[i])
            escreval()
         ate (vetAno[i] <> "") e (vetAno[i] <> " ")
         repita
            escreval()
            escreval("Escreva a quantidade de vezes que esse filme foi alugado: ")
            leia(vetQtFilmes[i])
            escreval()
         ate (vetQtFilmes[i] <> "") e (vetQtFilmes[i] <> " ")
         repita
            escreval()
            escreval("O filme está alugado? ")
            escreval("1 - Sim")
            escreval("2 - Não")
            escreval()
            leia(escolhaSituacao)
         ate (escolhaSituacao = 1) ou (escolhaSituacao = 2)
         escolha(escolhaSituacao)
         caso 1
            vetSituacao[i] <- "Sim"
         caso 2
            vetSituacao[i] <- "Não"
         fimescolha
         escreval()
         escreval("Deseja cadastrar outro filme? ")
         escreval("1 - Sim")
         escreval("2 - Não")
         escreval()
         leia(resp)
         i2<-i2+1
      ate (resp = 2) ou (i2 = 10)
   senao
      se (i2=10) entao
         escreva("A quantidade máxima de filmes já foi registrada no sistema.")
      fimse
   fimse
   escreval()
fimprocedimento
//Procedimento LISTA FILMES  caso 2


procedimento listaFilmes()
var
   vetVazio: vetor[0..9] de logico
   vazio: logico
inicio
   limpatela()
   vazio <- VERDADEIRO
   para i de 0 ate 9 passo 1 faca
      se (vetNome[i] = "") entao
         vetVazio[i] <- VERDADEIRO
      senao
         se (vetNome[i] <> "") entao
            escreval("Nome: ",vetNome[i]," | Ano de lançamento: ",vetAno[i]," | Quantidade de vezes que o filme foi alugado: ",vetQtFilmes[i]," | Situação: ",vetSituacao[i])
            vetVazio[i] <- FALSO
         fimse
      fimse
   fimpara

   para i de 0 ate 9 passo 1 faca
      se vetVazio[i] = FALSO entao
         vazio <- FALSO
      fimse
   fimpara

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
   fimse
fimprocedimento


//Prcedimento FILMES LOCADOS caso 3
procedimento FilmesLocados()
var
   vetVazio: vetor[0..9] de logico
   vazio: logico
inicio
   limpatela()
   vazio <- VERDADEIRO

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

   se vazio = FALSO entao
      escreval("Filmes locados: ")
      para i de 0 ate 9 passo 1 faca
         se (vetSituacao[i] = "Sim") entao
            escreval(vetNome[i])
         fimse
      fimpara
   fimse

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
   fimse

fimprocedimento
// Procedimento ALUGAR FILME caso 4
procedimento AlugarFilme()
var
   vetVazio: vetor[0..9] de logico
   vazio, todosAlugados: logico
inicio
   limpatela()
   todosAlugados <- VERDADEIRO

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

   para i de 0 ate 9 passo 1 faca
      se vetSituacao[i] = "Não" entao
         todosAlugados <- FALSO
      fimse
   fimpara

   se (vazio = FALSO) e (todosAlugados = FALSO) entao
      escreval("Lista de filmes não locados: ")
      para i de 0 ate 9 faca
         se vetSituacao[i] = "Não" entao
            escreval(i,"- ",vetNome[i])
         fimse
      fimpara
      escreval("Digite o numero do filme que deseja alugar: ")
      leia(alSituacao)
      para i de 0 ate 9 faca
         se alSituacao = i entao
            vetSituacao[i] <- "Sim"
            vetQtFilmes[i] <- vetQtFilmes[i] + 1
         fimse
      fimpara
   fimse

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
   vetVazio: vetor[0..9] de logico
   vazio, todosLocados: logico
inicio
   limpatela()
   todosLocados <- VERDADEIRO

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

   para i de 0 ate 9 passo 1 faca
      se vetSituacao[i] = "Não" entao
         todosLocados <- FALSO
      fimse
   fimpara

   se (vazio = FALSO) e (todosLocados = FALSO) entao
      escreval("Lista de filmes locados: ")
      para i de 0 ate 9 faca
         se vetSituacao[i] = "Sim" entao
            escreval(i,"- ",vetNome[i])
         fimse
      fimpara
      escreval("Digite o número do filme que deseja devolver: ")
      leia(devSituacao)
      para i de 0 ate 9 faca
         se devSituacao = i entao
            vetSituacao[i] <- "Não"
         fimse
      fimpara
   fimse

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
      se todosLocados = VERDADEIRO entao
         escreval("Nenhum filme registrado no sistema está locado no momento.")
         escreval("Deseja alugar um filme agora?")
         escreval("1 - sim")
         escreval("2 - não")
         leia(escolhaMenu2)

         escolha(escolhaMenu2)

         caso 1
            AlugarFilme()

         caso 2
            menu()

         fimescolha
      fimse
   fimse


fimprocedimento

// Procedimento Filme MAIS LOCADO caso 6
procedimento FilmeMaisLocado()
var
   vetVazio: vetor[0..9] de logico
   vazio: logico
inicio
   limpatela()
   vazio <- VERDADEIRO

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

   se vazio = FALSO entao
      maisLocado <- vetQtFilmes[0]
      para i de 0 ate 9 faca
         se vetQtFilmes[i] > maisLocado entao
            maisLocado <- vetQtFilmes[i]
         fimse
      fimpara


      para i de 0 ate 9 faca
         se vetQtFilmes[i] = maisLocado entao
            escreval("Filme mais alugado: ")
            escreval("Nome: ",vetNome[i])
            escreval("Ano de lançamento: ",vetAno[i])
            escreval("Quantidade de vezes que o filme foi alugado: ",vetQtFilmes[i])
            escreval("Alugado? ",vetSituacao[i])

         fimse
      fimpara
   fimse

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
   fimse

fimprocedimento

inicio
   menu()

Fimalgoritmo