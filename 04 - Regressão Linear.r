#
#   ESTATÍSTICA COMPUTACIONAL APLICADA EM R
#   Discente: Luís Guilherme Barbosa Custódio   R.A: 201905500
#

# 1) Estimar uma regressão linear simples para modelar Y (rating) em função de X1 (complaints)
data("attitude")
?attitude
attitude

# Gráficos de dispersão para todas as combinações de variáveis no conjunto de dados.
require(stats); require(graphics)
pairs(attitude, main = "attitude data")

# Visualiza graficamente as variáveis que serão modeladas.
hist(attitude$rating)
hist(attitude$complaints)
plot(rating ~ complaints, data = attitude, pch = 16)
m1 = lm(rating ~ complaints, data = attitude)
m1

# Gráfico e linha de regressão:
plot(rating ~ complaints, data = attitude, pch = 16)
abline(m1)

# summary() retorna as estatísticas, mostra a estimativa de cada coeficiente associada ao respectivo teste de hipótese.
# mínimo, quartis, média e máximo (Resoduals), intercept e complaints (Coefficients) etc.
summary(m1)

# 2) Apresente os resultados dos parâmetros, interprete e faça análise dos resíduos dessa regressão.

# É observado que os dados apresentados são independentes e a variância dos resíduos é homogênea com distr. normal.
# Gráfico de dispersão entre os resíduos do valor observavel com o valor previsto.
plot(resid(m1) ~ fitted(m1), pch = 16, ylab = "Resíduos", xlab = "Valores ajustados")
abline(h = 0, col = 2)

# Podemos refinar nosso modelo e verificar um modelo menor que usa apenas complaintscomo um preditor para a resposta.
summary(fm2 <- lm(rating ~ complaints, data = attitude))

# O historiograma é esperado entre -1,96 e +1,96.
hist(rstudent(m1))
# Teste de Shapiro-Wilk testa a hipótese nula que uma amostra y1,y2,⋯,yn, retirada de uma população, tem distribuição normal.
shapiro.test(rstudent(m1))

# Diagnóstico da regressão entre os pontos influentes da regressão.
par(mfrow  = c(2,2))
plot(m1)

# 3) Estime um modelo de regressão linear múltipla adicionando as demais variáveis como explicativas.

# Regressão múltipla do conjunto "attitude".
pairs(attitude)

# Ajusta o modelo de regressão múltipla.
modelo.regressao = lm(rating ~ complaints + privileges + learning + raises + critical + advance, data  = attitude)
modelo.regressao

# Exibe o resultado dos testes de hipótese para cada valor com o modelo de regressão.
summary(modelo.regressao)

# Exibe a Análise de Variância (ANOVA) do modelo.
anova(modelo.regressao)

# 4) Há indícios de problemas nesse modelo? Multicolinearidade, por exemplo?

# Complaints, privileges, learning, raises, critical, advance
panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...){
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits = digits)[1]
  txt <- paste0(prefix, txt)
  if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}
pairs(attitude[,-1], lower.panel = panel.smooth, upper.panel = panel.cor)

# Complaints x raises é r = 0.67 e learning x raises, r = 0.64. (indício de colinearidade)
# Multicolinearidade Fator de Inflação de Variância (VIF, Variance Inflation Factor).
# VIF mede o quanto a variâncias dos estimadores de regressão aumenta devido a multicolinearidade. 

# Seja Xi. a variável preditora i. O VIF associado a esta variável tem relação ao R2i
# VIFi é calculado por: VIFi = 1 / (1 -  R2i ). Quanto maior R2i, maior o grau de multicolinearidade devido à Xi.
# VIF associado a variável complaints
mcomp = summary(lm(complaints ~ privileges + learning + raises + critical + advance, data  = attitude))
mcomp$r.squared
Vif.comp = 1/ (1 - mcomp$r.squared)
Vif.comp

# VIF para a variável complaints: 2,667.
# Na presença de multicolinearidade, os estimadores da regressão tornam-se instáveis.
# A retirada de uma das variável muda drasticamente os coeficientes das demais.
# Caso occorra a retirada uma das variáveis 
modelo.regressao = lm(rating ~ complaints + privileges + learning + raises + critical + advance, data  = attitude)
summary(modelo.regressao)

# 5) Apresente os resultados dos parâmetros, interprete e faça análise dos resíduos dessa regressão.

# Gráfico de dispersão entre os resíduos do valor observavel com o valor previsto.
plot(resid(modelo.regressao) ~ fitted(modelo.regressao), pch = 16, ylab = "Resíduos", xlab = "Valores ajustados")
abline(h = 0, col = 2)

# O historiograma é esperado entre -1,96 e +1,96.
hist(rstudent(modelo.regressao))
# Teste de Shapiro-Wilk testa a hipótese nula que uma amostra y1,y2,⋯,yn, retirada de uma população, tem distribuição normal.
shapiro.test(rstudent(modelo.regressao))

# Diagnóstico da regressão entre os pontos influentes da regressão.
par(mfrow  = c(2,2))
plot(modelo.regressao)