cd /homes/el302/Desktop/bigdata/cw_2

ant clean dist

hadoop jar dist/HoursCount.jar bdp.hours.HoursCount /data/olympictweets2016rio out

hadoop fs -getmerge out /homes/el302/Desktop/CW_big_data/cw_2/out/result.csv


#code for R to visialise

setwd("~/Desktop/CW_big_data_Lyapina/cw_2/out")
result <- read.csv("result.csv", sep="\t", header = FALSE)
newdata <- result[order(result$V2),]

barplot(newdata$V2, names = newdata$V1, xlab = "Lenght", ylab = "Amount", main = "Message length analysis", las=2)

