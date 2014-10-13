# http://stackoverflow.com/questions/14069629/plotting-confidence-intervals
# http://stackoverflow.com/questions/9832268/how-to-create-a-loop-for-generate-a-list-of-random-samples-in-r
# http://www.graphpad.com/guides/prism/6/statistics/index.htm?confidence_intervals.htm
# http://www.inside-r.org/packages/cran/plotrix/docs/plotCI

set.seed(65)
NormSamp <- as.data.frame(matrix(rnorm(100*100, mean=0, sd=1), ncol=100))
mean <- rowMeans(NormSamp[,1:100])
sd <- apply(NormSamp[,1:100], 1, sd)
lci <- mean - sd*1.96/sqrt(100)
uci <- mean + sd*1.96/sqrt(100)

x <- 1:100 

require(plotrix)
plotCI(x, mean, ui= uci, li = lci, col = 'red', 
       scol = 'blue', xlim= c(-10,100), slty = 1, sfrac = 0, 
       pch=NA, main = 'Confidence Intervals of 95%')

lines( c(-20,110), c(0, 0), col = 'red', lty=2, lwd = 1)
text(-5,0.05,'mean', col='red')
