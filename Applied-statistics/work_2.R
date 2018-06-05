x.norm<-rnorm(n=200,m=10,sd=2)
hist(x.norm,main="Histogram of observed data")
plot(density(x.norm),main="Density estimate of data")
plot(ecdf(x.norm), main='Empirical cumulative distribution function')

z.norm <- (x.norm-mean(x.norm)) / sd(x.norm) ## standardized data 
qqnorm(z.norm) ## drawing the QQplot
abline(0, 1) ## drawing a 45-degree reference line

x.wei<-rweibull(n=200,shape=2.1,scale=1.1) ## sampling from a Weibull distribution with parameters shape=2.1 and scale=1.1 
x.teo<-rweibull(n=200,shape=2, scale=1) ## theorical quantiles from a Weibull population with known paramters shape=2 e scale=1 
qqplot(x.teo,x.wei,main="QQ-plot distr. Weibull") ## QQ-plot
abline(0,1) ## a 45-degree reference line is plotted

x.poi<-rpois(n = 200, lambda = 2.5)
hist(x.poi, main = "Poisson distribution")
curve(dnorm(x, m = 10, sd = 2), from = 0,to = 20, main = "Normal distribution")

curve(dgamma(x, scale=1.5, shape=2),from=0, to=15, main="Gamma distribution")

curve(dweibull(x, scale=2.5, shape=1.5),from=0, to=15, main="Weibull distribution")

library(fBasics) ## package loading
skewness(x.norm) ## skewness of a normal distribution
kurtosis(x.norm)

skewness(x.wei) ## skewness of a Weibull distribution
kurtosis(x.wei)

mean.hat<-mean(x.norm)
mean.hat

