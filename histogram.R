#create 10000 random normally distributed data points with a mean of 0 and standard deviation of 1
NormalData<-rnorm(n=10000, m=0, sd=1) 

#allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))

#create histogram
h <- hist(NormalData, col=2, ylim=c(0,2000), xlim=c(-4,4), main='Ordinary histogram')

#create cumulative dataset
h$counts <- cumsum(h$counts) # replace the cell freq.s by cumulative freq.s

#plot cumulative histogram
plot( h, col=2, main = 'Cumulative histogram', xlim=c(-4,4) ) # plot a cumulative histogram of y
