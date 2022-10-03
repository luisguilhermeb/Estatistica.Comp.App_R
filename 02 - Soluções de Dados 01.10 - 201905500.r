#
#   ESTATÍSTICA COMPUTACIONAL APLICADA EM R
#   Discente: Luís Guilherme Barbosa Custódio   R.A: 201905500
#
#       == Exercicio 01 ==
data(islands)
length(islands)
#
#
#       == Exercicio 02 ==
mean(islands)
median(islands)
#
#
#       == Exercicio 03 ==
range(islands)[1]
range(islands)[2]
#
#
#       == Exercicio 04 ==
sd(islands)
range(islands)[2] - range(islands)[1]
#
#
#       == Exercicio 05 ==
quantile(islands)
quantile(islands, c(.05,.95))
#
#
#       == Exercicio 06 ==
IQR(islands)
#
#
#       == Exercicio 07 ==
hist(islands)
hist(islands,prob=T)
#
#
#       == Exercicio 08 ==
boxplot(islands)
boxplot(islands, outline = F)
#
#
#       == Exercicio 09 ==
boxplot(islands, plot=F)$out
#
#
#       == Exercicio 10 ==
stem(islands)