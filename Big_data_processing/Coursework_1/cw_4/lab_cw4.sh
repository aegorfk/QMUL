cd /homes/el302/Desktop/bigdata/lab4-part1

ant clean dist

hadoop jar dist/StockJoin.jar bdp.stock.StockCompanyReplJoin  /data/NASDAQseq out

hadoop fs -getmerge out /homes/el302/Desktop/bigdata/lab4-part1/out/result.csv


#code for R to visialise

setwd("~/Desktop/bigdata/cw/out")
result <- read.csv("result.csv", sep="\t", quote="", header = FALSE)
newdata <- result[order(result$V2),]

barplot(newdata$V2, names = newdata$V1, xlab = "Lenght", ylab = "Amount", main = "Message length analysis", las=2)


hadoop fs -copyToLocal /data/NASDAQseq/part-m-00035 /homes/el302/Desktop/bigdata/lab4-part1/data

hadoop fs -cat /data/companylist.tsv


hadoop fs -du -s /data/companylist.tsv  | awk '{s+=$1} END {printf "%.3fGB\n", s/1000000000}'

hadoop fs -cat /data/medalistsrio.csv |head -100 
251192385,Alexey Cheremisinov,RUS,male,7/9/1985,1.83,75,fencing,1,0,0



hadoop fs -cat /data/medalistsrio.csv |head -100 
