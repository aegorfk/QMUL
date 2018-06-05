#install.packages('tseries')
library(tseries)


tweet.time.series <- read.table("tweet-time-series.txt")

data <- tweet.time.series[70000:269999,2]
data[is.na(data)] <- 0


#tweet.time.series$X2
data.ts = ts(data,frequency=100)
data.aggregated = aggregate(data.ts,FUN = mean)
data.decomposed = stl(data.ts,"periodic")
plot(data.decomposed)


data.decomposed$time.series[,'trend']
data.decomposed$time.series[,'seasonal']
data.decomposed$time.series[,'remainder']


acf(data.decomposed$time.series[,'trend'])
acf(diff(data.decomposed$time.series[,'remainder']))


zlag(data.decomposed$time.series[,'trend'],1)
plot(y=data.decomposed$time.series[,'trend'],
     x=zlag(data.decomposed$time.series[,'trend']),
     ylab='Inches',
     xlab='Previous Year Inches')
