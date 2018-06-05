cd /homes/el302/Desktop/CW_big_data_Lyapina/cw_3

ant clean dist

hadoop jar dist/HashtagsCount.jar bdp.tweets.HashtagsCount /data/olympictweets2016rio out

hadoop fs -getmerge out /homes/el302/Desktop/CW_big_data_Lyapina/cw_3/out/result.csv


#code for R to visialise

setwd("~/Desktop/CW_big_data_Lyapina/cw_3/out")
result <- read.csv("result.csv", sep="\t",  quote = "", header = FALSE)
newdata <- result[order(result$V2),]
newdata[91100:91113,]
