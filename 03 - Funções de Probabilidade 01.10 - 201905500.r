#
#   ESTATÍSTICA COMPUTACIONAL APLICADA EM R
#   Discente: Luís Guilherme Barbosa Custódio   R.A: 201905500
#
#       == Exercicio 01 ==
set.seed(1)
random_numbers <- runif(10)
print(random_numbers)
#
#
#       == Exercicio 02 ==
(cara_ou_coroa_aux <- ifelse(random_numbers>.5, 'head', 'tail'))
set.seed(1)
(cara_ou_coroa <- rbinom(n = 1, size = 10, prob = .5))
#
#
#       == Exercicio 03 ==
set.seed(1)
(moeda_viciada <- rbinom(n = 1, size = 10, prob = .3))
#
#
#       == Exercicio 04 ==
set.seed(1)
(die_roll <- runif( n = 1, min = 0, max = 6))
(ceiling(die_roll))
#
#
#       == Exercicio 05 ==
set.seed(1)
heights <- rnorm(n = 100, mean = 1.70, sd = .1)
summary(heights)
#
#
#       == Exercicio 06 ==
pnorm(1.90, mean = 1.70, sd = .1)
1 - pnorm(1.60, mean = 1.70, sd = .1)
#
#
#       == Exercicio 07 ==
set.seed(1)
(paciente <- rexp(rate = 1/50, n =30))
#
#
#       == Exercicio 08 ==
pexp(q = 10,rate = 1/50)
#
#
#       == Exercicio 09 ==
qexp(.5, rate = 1/50)
#
#
#       == Exercicio 10 ==
(1 - pexp(q=60, rate =1/50)) *100