vector = read.table("ping-1000.txt")

trim <- function(x,prop=.05) 
{
  trimx <- x[x < quantile(x,prob=(1-prop))]
  return(trimx)
}
vector2 <- trim(vector[,1])

normal <- rnorm(1000, mean(vector[,1]), sd(vector[,1]))
hist(normal)
plot(ecdf(normal))
qqplot(vector[,1], normal)

normal <- rnorm(1000, mean(vector2), sd(vector2))
hist(normal)
plot(ecdf(normal))
qqplot(vector2, normal)

poisson = rpois(1000,lambda=mean(vector[,1]))
hist(poisson)
plot(ecdf(poisson))
qqplot(vector[,1], poisson)

poisson = rpois(1000,lambda=mean(vector2))
hist(poisson)
plot(ecdf(poisson))
qqplot(vector2, poisson)


alpha = mean(vector[,1])/var(vector[,1])
beta = (mean(vector[,1]))**2/var(vector[,1])
x.gamma = rgamma(n=1000, scale=alpha, shape=beta)
hist(x.gamma)
qqplot(vector[,1], x.gamma)


