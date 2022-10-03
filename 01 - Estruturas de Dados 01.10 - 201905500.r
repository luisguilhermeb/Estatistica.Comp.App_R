#
#   ESTATÍSTICA COMPUTACIONAL APLICADA EM R
#   Discente: Luís Guilherme Barbosa Custódio   R.A: 201905500
#
#       == Exercicio 01 ==
v <- sample(-100:100, 10, replace=TRUE)
print(v)
#
#
#       == Exercicio 02 - A ==
a <- array(seq(from = 26, length.out = 25, by = 2), c(5, 5))
print(a)
#
#
#       = Exercicio 02 - B ==
s <- LETTERS[match("C", LETTERS):(match("C", LETTERS)+19)]
print(s)
#
#
#       == Exercicio 03 ==
l <- list(a = v, b = a, c = s)
length(l)
str(l)
#
#
#       == Exercicio 04 ==
#
#  01 - Qual é o resultado de l[[3]]?   R: Os elementos contidos em 'C' (Exercicio 2 - B)  que estão armazenados na 3° linha de 'l'.
#  02 - Como você acessaria a letra random-th no elemento da lista c?   R: l[[3]][sample(1:length(l[[3]]), 1)].
#  03 - Se você converter a lista 'l' em um vetor, qual será o tipo de seus elementos?    R: Os elementos serão do tipo caractere.
#  04 - Esta lista pode ser convertida em uma matriz? Qual será o tipo de dados dos elementos na matriz?    R: Sim. Serão do tipo lista.
#
l[[3]]
l[[3]][sample(1:length(l[[3]]), 1)]
class(unlist(l))
converter_em_matriz <- array(l)
class(converter_em_matriz[1])
#
#
#       == Exercicio 05 ==
l$c <- NULL
class(unlist(l))
#
#
#       == Exercicio 06 ==
setdiff(l$a, l$b)
intersect(l$a, l$b)
33 %in% union(l$a, l$b)
#
#
#       == Exercicio 07 ==
m <- matrix(data = round(runif(5*5, 0.99, 100.00), 2), nrow = 5)
print(m)
#
#
#       == Exercicio 08 ==
#
#   Qual será a classe da estrutura de dados se você converter a matriz mpara:
#     1 - Vetor?    R: Será do tipo numérico.
#     2 - Lista?    R: Será do tipo lista.
#     3 - Quadro de dados?  R: Será do tipo quadro de dados.
#     4 - Variedade?  R: Será do tipo matriz.
#
class(as.vector(m))
class(as.list(m))
class(as.data.frame(m))
class(as.array(m))
#
#
#       == Exercicio 09 ==
as.matrix(aperm(l$b))
#
#
#       == Exercicio 10 ==
sort(union(as.vector(m), unlist(l)))