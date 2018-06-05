data <- read.csv("njgolf.csv")
summary(data$sprice)
summary(data$lotsize)
summary(data$beds)
summary(data$drarea)
summary(data$kitarea)
summary(data$lotsizef)

#There are three different prices in the dataset, 
#selling price (sprice), offered price (oprice), 
#and listed price (lprice). Often, different variations 
#of a given concept are provided in data as different 
#fields, which may or may not be the case in this 
#specific situation.  Rely on your understanding 
#of descriptive statistics to build more confidence 
#about the 3 versions of prices of this dataset, by 
#using the summary() command, for example for the sprice 
#field:

summary(data$sprice)
summary(data$oprice)
summary(data$lprice)

hist(data$sprice)
hist(data$oprice)
hist(data$lprice)

library(reshape2) # For the melt function
library(ggplot2)
# Fake data
ZONES = data.frame(sprice=data$sprice, 
                   oprice=data$oprice, 
                   lprice=data$lprice)

# Melt into long format (take a look at the melted data frame to see what melt is doing)
ZONES.M <- melt(ZONES)

ggplot(ZONES.M, aes(value, fill=variable)) +
  geom_density(alpha=0.5)

plot(ecdf(data$sprice))
plot(ecdf(data$oprice))
plot(ecdf(data$lprice))

#range
max(data$sprice, na.rm=TRUE) - min(data$sprice, na.rm=TRUE)
max(data$oprice, na.rm=TRUE) - min(data$oprice, na.rm=TRUE)
max(data$lprice, na.rm=TRUE) - min(data$lprice, na.rm=TRUE)

#variance
var(data$sprice, na.rm=TRUE)
var(data$oprice, na.rm=TRUE)
var(data$lprice, na.rm=TRUE)

#standart deviation
sd(data$sprice, na.rm=TRUE)
sd(data$oprice, na.rm=TRUE)
sd(data$lprice, na.rm=TRUE)

qqplot(data$sprice, data$oprice)
qqplot(data$oprice, data$lprice)
qqplot(data$lprice, data$sprice)


#Check the correlation
cor(data$sprice, data$oprice, method = c("pearson", "kendall", "spearman"))
cor(data$oprice, data$lprice, method = c("pearson", "kendall", "spearman"))
cor(data$lprice, data$sprice, method = c("pearson", "kendall", "spearman"))


library(lattice)
xyplot(sprice ~ lotsize, data=data, scale=list(y=list(alternating=2)), xlab="lot size",ylab="selling price")
xyplot(sprice ~ lotsize | lotsize >0, data=data, scale=list(y=list(alternating=2)), xlab="lot size",ylab="selling price")
xyplot(sprice ~ lotsize, group=factor(data$lotsizef=="house", labels=c("condominium","house")), data=data, panel=panel.superpose, pch=16, scale=list(y=list(alternating=2)), ylab="selling price", key=list(border=T,text=list(c("Condominium","House")),points=list(col=trellis.par.get("superpose.symbol")$col[1:2],pch=16),space="top"))

pairs(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data)

panel.regression <- function (x, y, col = par("col"), bg = NA, pch = par("pch"),cex = 1, col.regres = "red", ...)
{
  points(x, y, pch = pch, col = col, bg = bg, cex = cex)
  ok <- is.finite(x) & is.finite(y)
  if (any(ok))
    abline(stats::lm(y[ok] ~ x[ok]), col = col.regres, ...)
}

pairs(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data[data$lotsize > 0, ], panel=panel.regression)
twoPredictorModel <- lm(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data[data$lotsize > 0, ])
twoPredictorModel
summary(twoPredictorModel)

pairs(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data[data$lotsize > 0, ],panel=panel.regression)

pairs(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data[data$lotsize == 0, ],panel=panel.regression)
twoPredictorModel <- lm(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data[data$lotsize == 0,])
twoPredictorModel
summary(twoPredictorModel)

nrow(data[data$lotsize == 0,])
nrow(data[data$lotsize > 0, ])




pairs(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data, panel=panel.regression)
pairs(sprice ~ beds + lrarea + drarea + kitarea + famarea, data=data[data$lotsize > 0, ],panel=panel.regression)
