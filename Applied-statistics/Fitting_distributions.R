tweettimeseries <- read.table("tweet-time-series.txt")

data <- tweettimeseries[60000:69999,2]
source('~/Documents/GitHub/Applied-statistics/Courseworks/Coursework_3.R', encoding = 'UTF-8')
plot.ccdf(data)

#EXPONENTIAL DISTRIBUTION
x.normal <- rnorm(1000,0,1)
hist(x.normal)
plot.ccdf(x.normal)

x.poisson <- rpois(1000,lambda=5)
hist(x.poisson)
plot(ecdf(x.poisson))
plot.ccdf(x.poisson)

#exponential
set.seed(123)
x.exp <- rexp(1000, 15)
hist(x.exp)
plot.ccdf(x.exp)

#HEAVY-TAIL DISTRIBUTION
library(VGAM)
x.pareto1 <- rpareto(100000,10,1)
plot.ccdf(x.pareto1)

#EXTREME VALUE DISTRIBUTION
x.weibull <- rweibull(1000,3.5,14.1)
hist(x.weibull)
plot.ccdf(x.weibull)

x.gamma <- rgamma(1000,0.83,10.59)
hist(x.gamma)
plot.ccdf(x.gamma)







#vector <- read.table('ping-1000')
lognormal <- rlnorm(1000, 4.22, 0.18)
hist(lognormal)
plot(ecdf(lognormal))
plot.ccdf(lognormal)
qqplot(vector,lognormal)
