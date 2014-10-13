####################################################################################
# Figure 05-02
# Z-score and how it relates to the standard deviation of a normal distribution.
# Inspired by: http://en.wikipedia.org/wiki/Standard_score#mediaviewer/File:Normal_distribution_and_scales.gif


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

# create figures for file
filename <- 'Figure 05-02'
pdf(paste(fileplace,filename,'.pdf'))

require(plotrix)
plotCI(x, mean, ui= uci, li = lci, col = 'red', 
       scol = 'blue', xlim= c(-10,100), slty = 1, sfrac = 0, 
       pch=NA, main = 'Confidence Intervals of 95%')

lines( c(-20,110), c(0, 0), col = 'red', lty=2, lwd = 1)
text(-5,0.05,'mean', col='red')

# write figures
dev.off()

####################################################################################
# Figure 05-03
# Z-score and how it relates to the standard deviation of a normal distribution.
# Inspired by: http://en.wikipedia.org/wiki/Standard_score#mediaviewer/File:Normal_distribution_and_scales.gif

# generate a series of numbers
x <- seq(-4, 4, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# create figures for file
filename <- 'Figure 05-03'
pdf(paste(fileplace,filename,'.pdf'))

# plot the normal distribution
plot(x, fx, type='l', lty=1, xlab='z-score', lwd = 2, ylim = c(-0.05,0.55), xaxp=c(-4,4,8),
     ylab='P(x)', 
     main='Normal Distribution with z-Scores and Standard Deviations',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# plot mean and label accordingly
lines( c(0,0), c(-0.05, 0.45), col = 'red', lty=2, lwd = 2, cex = sl)
text(0, 0.5, expression(bar(x)), srt = 0, col='red')

# plot standard deviation and label accordingly
lines( c(1,1), c(-0.05, 0.25), col = 'blue', lty=2, lwd = 1)
text(1, 0.35, expression(1~sigma), srt = 0, cex = sl, col='blue')

lines( c(2,2), c(-0.05, 0.05), col = 'purple', lty=2, lwd = 1)
text(2, 0.1, expression(2~sigma), srt = 0, cex = sl, col = 'purple')

lines( c(3,3), c(-0.05, 0.00), col = 'green', lty=2, lwd = 1)
text(3, 0.05, expression(3~sigma), srt = 0, cex = sl, col='blue')

lines( c(-1,-1), c(-0.05, 0.25), col = 'blue', lty=2, lwd = 1)
text(-1.01, 0.35, expression(-1~sigma), srt = 0, cex = sl, col='blue')

lines( c(-2,-2), c(-0.05, 0.05), col = 'purple', lty=2, lwd = 1)
text(-2.01, 0.1, expression(-2~sigma), srt = 0, cex = sl, col='purple')

lines( c(-3,-3), c(-0.05, 0.00), col = 'green', lty=2, lwd = 1)
text(-3.01, 0.05, expression(-3~sigma), srt = 0, cex = sl, col='green')

# add text describing extent of representative areas
text(0, 0.23, '68% of values', font = 2, srt = 0, cex = sl, col='blue')
text(0, 0.03, '95% of values', font = 2, srt = 0, cex = sl, col='purple')
text(0, -0.02, '99.7% of values', font = 2, srt = 0, cex = sl, col='green')

# add arrows showing extent of representative areas
arrows(1,0.25,x1=-1,length = 0.15, angle = 20,
       code = 3, col = 'blue', lty = par('lty'))

arrows(2,0.05,x1=-2,length = 0.15, angle = 20,
       code = 3, col = 'purple', lty = par('lty'))

arrows(3,0.0,x1=-3,length = 0.15, angle = 20,
       code = 3, col = 'green', lty = par('lty'))

# write figures
dev.off()

####################################################################################
# Figure 05-04
#
#
# http://www.r-bloggers.com/creating-shaded-areas-in-r/

# create figures for file
filename <- 'Figure 05-04'
pdf(paste(fileplace,filename,'.pdf'))

#allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))

xsrt0 <- -4
xend0 <- 4
xinc0 <- 0.001
xdim0 <- c(xsrt0, seq(xsrt0, xend0, xinc0), xend0) 
ydim0 <- c(0, dnorm(seq(xsrt0, xend0, xinc0)),0) 

xsrt <- 1.645
xend <- 4
xinc <- 0.001
xdim <- c(xsrt, seq(xsrt, xend, xinc), xend) 
ydim <- c(0, dnorm(seq(xsrt, xend, xinc)),0) 

curve(dnorm(x,0,1), xlim = c(-4,4), main = 'Normal\nPositive Extreme', 
      ylab = 'Probability(x)', xlab = 'x', ylim=c(-0.1, 0.45)) 

polygon(xdim0, ydim0, col='sky blue')
polygon(xdim, ydim, col='green')

lines( c(0,0), c(-0.2, 0.5), col = 'red', lty=2, lwd = 1)
text(-0.15,0.15, cex = 0.7, 'mean (most likely observation)', col='red', srt = 90)

lines( c(xsrt,xsrt), c(-0.2, .5), col = 'black', lty=2, lwd = 1)

arrows(xsrt,-0.05,x1=xend,length = 0.15, angle = 20,
       code = 2, col = 'dark green', lty = 1)
text(xsrt+1, -0.08, cex = 0.7, 'x > 1.645\n5% of curve area', 
     col='dark green', srt = 0)

arrows(xsrt,-0.05,x1=-4,length = 0.15, angle = 20,
       code = 2, col = 'blue', lty = 1)
text(-2, -0.08, cex = 0.7, 'x < 1.645\n95% of curve area', 
     col='blue', srt = 0)

xsrt1 <- -4
xend1 <- 4
xinc1 <- 0.001
xdim1 <- c(xsrt1, seq(xsrt1, xend1, xinc1), xend1) 
ydim1 <- c(0, dnorm(seq(xsrt1, xend1, xinc1)),0) 

xsrt2 <- -4
xend2 <- -1.645
xinc2 <- 0.001
xdim2 <- c(xsrt2, seq(xsrt2, xend2, xinc2), xend2) 
ydim2 <- c(0, dnorm(seq(xsrt2, xend2, xinc2)),0) 

curve(dnorm(x,0,1), xlim = c(-4,4), main = 'Normal\nNegative Extreme', 
      ylab = 'Probability(x)', xlab = 'x', ylim=c(-0.1, 0.45)) 

polygon(xdim1, ydim1, col='sky blue')
polygon(xdim2, ydim2, col='green')

lines( c(0,0), c(-0.2, 0.5), col = 'red', lty=2, lwd = 1)
text(-0.15,0.15, cex = 0.7, 'mean (most likely observation)', col='red', srt = 90)

lines( c(xend2,xend2), c(-0.2, .5), col = 'black', lty=2, lwd = 1)

arrows(xend2,-0.05,x1=xsrt2,length = 0.15, angle = 20,
       code = 2, col = 'dark green', lty = 1)
text(xsrt2+1, -0.08, cex = 0.7, 'x < -1.645\n5% of curve area', 
     col='dark green', srt = 0)

arrows(xend2,-0.05,x1=4,length = 0.15, angle = 20,
       code = 2, col = 'blue', lty = 1)
text(2, -0.08, cex = 0.7, 'x > -1.645\n95% of curve area', 
     col='blue', srt = 0)

# write figures
dev.off()

####################################################################################
# Figure 05-05
# Two Tail

# create figures for file
filename <- 'Figure 05-05'
pdf(paste(fileplace,filename,'.pdf'))

xsrt0 <- -1.96
xend0 <- 1.96
xinc0 <- 0.001
xdim0 <- c(xsrt0, seq(xsrt0, xend0, xinc0), xend0) 
ydim0 <- c(0, dnorm(seq(xsrt0, xend0, xinc0)),0) 

xsrt1 <- -4
xend1 <- -1.96
xinc1 <- 0.001
xdim1 <- c(xsrt1, seq(xsrt1, xend1, xinc1), xend1) 
ydim1 <- c(0, dnorm(seq(xsrt1, xend1, xinc1)),0) 

xsrt <- 1.96
xend <- 4
xinc <- 0.001
xdim <- c(xsrt, seq(xsrt, xend, xinc), xend) 
ydim <- c(0, dnorm(seq(xsrt, xend, xinc)),0) 

curve(dnorm(x), xlim = c(-4,4), main = 'Two Tailed Test\n95% Confidence', 
      ylab = 'Probability(x)', xlab = 'x', ylim=c(-0.1, 0.5)) 

polygon(xdim0, ydim0, col = 'sky blue')
polygon(xdim1, ydim1, col = 'green')
polygon(xdim, ydim, col = 'green')

lines( c(0,0), c(-0.2, 0.5), col = 'red', lty=2, lwd = 1)
text(-0.1, 0.1, cex = 0.7, 'mean', col='red', srt = 90)

lines( c(1.96, 1.96), c(-0.2, 0.5), col = 'dark green', lty=2, lwd = 1)

lines( c(-1.96, -1.96), c(-0.2, 0.5), col = 'dark green', lty=2, lwd = 1)

arrows(xsrt0,-0.07,x1 = xend0, length = 0.1, angle = 20,
       code = 3, col = 'blue', lty = 1)
text(0, -0.077, cex = 0.7, '-1.96 < x < 1.96\n95% of curve area', 
     col='blue', srt = 0)

arrows(-1.96, -0.07,x1= -4, length = 0.1, angle = 20,
       code = 2, col = 'dark green', lty = 1)
text(-3, -0.077, cex = 0.7, 'x < -1.96\n2.5% of curve area', 
     col='dark green', srt = 0)

arrows(1.96, -0.07, x1= 4, length = 0.1, angle = 20,
       code = 2, col = 'dark green', lty = 1)
text(3, -0.077, cex = 0.7, 'x > 1.96\n2.5% of curve area', 
     col='dark green', srt = 0)

# write figures
dev.off()

####################################################################################
# Figure 05-06
# F-distribution

x <- seq(-0.001,4,0.001)

d1 <- 1
d2 <- 1

y <- df(x,d1,d2)

plot(x,y,typ ='l',xlim = c(-0.1, 3), ylim = c(0,2), 
     main = 'F Distribution\nwith varying degrees of freedom (df)')

d1 <- c(1,2,100,100)
d2 <- c(1,1,1,100)
c <- c('black','red','green','blue')

for (i in 2:4) lines(x,df(x,d1[i],d2[i]),col = c[i])

legend('topright', paste('df1=',d1,' ','df2=',d2), text.col=c, bty = 'n')