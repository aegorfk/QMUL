#1 task
data <- rnorm(10000)
hist(data, bin = 100)
summary(data)
#install.packages("modeest")
library(modeest)
mlv(data, method = "mfv")
#find mid-range
(max(data) + min(data))/2
