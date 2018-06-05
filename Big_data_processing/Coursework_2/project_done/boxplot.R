D <- read.table("2D.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)

boxplot(D[,2] ~ D[,1], notch=T, col=(c("RED", "BLUE", "GREEN")), outline=F, varwidth=T)
