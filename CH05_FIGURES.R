fileplace <- 'E:/STATS/Review/Chapters/original figures/Chapter_05/'
sm <- 1 # for font size
sl <- 1
sa <- 1

####################################################################################
# Figure 05-02
# Z-score and how it relates to the standard deviation of a normal distribution.
# Inspired by: http://en.wikipedia.org/wiki/Standard_score#mediaviewer/File:Normal_distribution_and_scales.gif


# http://stackoverflow.com/questions/14069629/plotting-confidence-intervals
# http://stackoverflow.com/questions/9832268/how-to-create-a-loop-for-generate-a-list-of-random-samples-in-r
# http://www.graphpad.com/guides/prism/6/statistics/index.htm?confidence_intervals.htm
# http://www.inside-r.org/packages/cran/plotrix/docs/plotCI

# define the random seed used so that the 'random' set can be reproduced
set.seed(65)

# generate 100 samples having 100 values
NormSamp <- as.data.frame(matrix(rnorm(100*100, mean=0, sd=1), ncol=100))

# generate mean of the 100 samples
mean <- rowMeans(NormSamp[,1:100])

# generate Standard deviation of the 100 samples
sd <- apply(NormSamp[,1:100], 1, sd)

# determine the upper and lower confidence intervals
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
text(3, 0.05, expression(3~sigma), srt = 0, cex = sl, col='green')

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

# define the dimensions of the polygons used on the normal curve
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

# define the dimensions of the polygons used on the normal curve
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

# draw the normal curve
curve(dnorm(x), xlim = c(-4,4), main = 'Two Tailed Test\n95% Confidence', 
      ylab = 'Probability(x)', xlab = 'x', ylim=c(-0.1, 0.5)) 

# draw the polygons to fill the normal curve
polygon(xdim0, ydim0, col = 'sky blue')
polygon(xdim1, ydim1, col = 'green')
polygon(xdim, ydim, col = 'green')

# add mean line
lines( c(0,0), c(-0.2, 0.5), col = 'red', lty=2, lwd = 1)
text(-0.1, 0.1, cex = 0.7, 'mean', col='red', srt = 90)

# add lines bordering the polygons
lines( c(1.96, 1.96), c(-0.2, 0.5), col = 'dark green', lty=2, lwd = 1)

lines( c(-1.96, -1.96), c(-0.2, 0.5), col = 'dark green', lty=2, lwd = 1)

# add arrows defining the areas and extents of the polygons
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

# generate a sequence of x values
x <- seq(-0.001,4,0.001)

# create a list of degrees of freedom and colors for lines
d1 <- c(1,2,100,100)
d2 <- c(1,1,1,100)
c <- c('black','red','green','blue')

# create figures for file
filename <- 'Figure 05-06'
pdf(paste(fileplace,filename,'.pdf'))

# plot the first line of the F distribution
plot(x,df(x,d1[1],d2[1]),typ ='l',xlim = c(-0.1, 3), ylim = c(0,2), 
     main = 'F Distribution\nwith varying degrees of freedom (df)')

# plot the other lines for the F distribution
for (i in 2:4) lines(x,df(x,d1[i],d2[i]),col = c[i])

# add a legend
legend('topright', paste('df1=',d1,' ','df2=',d2), text.col=c, bty = 'n')

# write figures
dev.off()

####################################################################################
# Figure 05-07
# 

# create figures for file
filename <- 'Figure 05-07'
pdf(paste(fileplace,filename,'.pdf'))

# generate a sequence of x values
x <- seq(0,20,0.01)

# plot the normal distribution based on a mean of 15 and a population sd of 0.5
plot(x, dnorm(x,15,0.5), typ = 'l', xlab = 'Loaf Height (cm)',
     xlim = c(12,18), ylab = 'Probability',
     main = 'Bread Loaf Height')

# draw a line showing where 17 cm bread heights would be
lines( c(17, 17), c(-0.2, 1.5), col = 'dark green', lty=2, lwd = 1)

# print the probability that the mean of a sample of bread heights will
# equal or exceed 17 cm
print(1-pnorm(17,15,0.5))


# write figures
dev.off()