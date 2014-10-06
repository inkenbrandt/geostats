fileplace <- 'E:/STATS/Review/original figures/'
sm <- 1 # for font size
sl <- 1
sa <- 1
####################################################################################
# Figure 03-01
# Two histograms using the same data. The blue histogram has 100 bins; the green histogram has 10 bins.

# generate 10,000 normally distributed datapoints
x <- rnorm(10000,0,1)

# create figures for file
filename <- 'Figure 03-01'
pdf(paste(fileplace,filename,'.pdf'))

#allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))
par(cex.main = sm, cex.lab = sl, cex.axis = sa)
# create a histogram using the x data and 10 bins
hist(x, breaks = seq(min(x), max(x), l = 11), xlim = c(-5,5), ylim = c(0,3500), main = '10 Bins', col = 'green')

# create a histogram using the x data and 10 bins
hist(x, breaks = seq(min(x), max(x), l = 101), xlim = c(-5,5), ylim = c(0,400), main = '100 Bins', col = 'light blue')

# write figures
dev.off()

####################################################################################
# Figure 03-02
# Histogram of discrete distribution generated using R

# generate series from 1 to 100 
x <- 1:100

# generate discrete binomial distribution
p <- dbinom(x, size=100, prob=0.5)

# create figures for file
filename <- 'Figure 03-02'
pdf(paste(fileplace,filename,'.pdf'))

# plot the distribution
plot(x, p, type='h', xlim=c(30,70), ylim=c(0,0.09), col='blue', ylab='Probability', main='Discrete Distribution',
     cex.main = sm, cex.lab = sl, cex.axis = sa)
points(x, p, col='red')

# write figures
dev.off()

####################################################################################
# Figure 03-03
# Continuous Distribution Histogram

# generate a series of numbers
x <- seq(-4, 4, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# create figures for file
filename <- 'Figure 03-03'
pdf(paste(fileplace,filename,'.pdf'))

# plot the normal distribution
plot(x, fx, type='l', lty=1, xlab='x', lwd = 2,
     ylab='P(x)', main='Continuous Distribution',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# add mean line to distribution
lines( c(0,0), c(0, 0.5), col = 'red', lty=2, lwd = 1)
text(-0.15, 0.05, c('mean'), srt = 90, cex = sl)

# uncomment the lines below to see standard deviation and text
#lines( c(1,1), c(0, 0.5), col = 'blue', lty=2, lwd = 1)
#text(1-0.15, 0.05, c('std. dev.'), srt = 90)
#lines( c(-1,-1), c(0, 0.5), col = 'blue', lty=2, lwd = 1)
#text(-1.15, 0.05, c('std. dev.'), srt = 90)

# write figures
dev.off()

####################################################################################
# Figure 03-04
# Student's T Distribution 
# Inspired by http://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Student_t_jpeg.svg/325px-Student_t_jpeg.svg.png

# generate a series of numbers
x <- seq(-5, 5, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# create figures for file
filename <- 'Figure 03-04'
pdf(paste(fileplace,filename,'.pdf'))

# plot the normal distribution
plot(x, fx, type='l', lty=2, xlab='x', lwd = 2,
     ylab='P(x)', main='Student\'s t Distribution',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# plot the student's t distributions
lines(x, dt(x, 1), col = 4)
lines(x, dt(x, 2), col = 3)
lines(x, dt(x, 20), col = 6)

# add a legend
legend('topleft', lwd = c(1, 1, 1, 2), bty = 'n', c('df=1', 'df=2', 'df=20', 'Normal'), 
       lty = c(1, 1, 1, 2), col = c(4, 3, 6, 1), cex = sl)

# write figures
dev.off()

####################################################################################
# Figure 03-05
# Graphic illustration of a bimodal distribution - a distribution having two peaks. 
# inspired by http://www.r-bloggers.com/a-brief-introduction-to-mixture-distributions/
# Data from https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/faithful.html
# Härdle, W. (1991) Smoothing Techniques with Implementation in S. New York: Springer.
# Azzalini, A. and Bowman, A. W. (1990). A look at some data on the Old Faithful geyser. Applied Statistics 39, 357-365.

# designate the example data as x; faithful is the table and waiting is the data column
x <- faithful$waiting

# create figures for file
filename <- 'Figure 03-05'
pdf(paste(fileplace,filename,'.pdf'))

# draw a probability histogram of the waiting data
hist(x, breaks=20, prob=TRUE, col ='green', ylab = 'Probability', xlab = 'Waiting Time (minutes)',
     main = 'Old Faithful Eruption Data \n Example of Bimodal Distribution', 
     ylim = c(-0.005,0.06), lwd = 0.5, xlim = c(35,100), xaxp  = c(35, 100, (100-35)/5),
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# add a probability density estimate line to the Old Faithful data
lines(density(x), col='pink', lwd = 5)

# generate and plot a normal curve to match first peak of distribution; draw mean line of first peak
y = seq(0,90)
lines(y,dnorm(y,53.5,6.8)*.34, col = 'brown', lty = 2, lwd = 2)
lines( c(53.5,53.5), c(-0.005, 0.05), col = 'blue', lty=2, lwd = 2)
text(53.5-0.15, 0.055, c('mean'), srt = 90, cex = sl)

# generate and plot a normal curve to match second peak of distribution; draw mean line of second peak
z = seq(50,100)
lines(z,dnorm(z,80,6.8)*.63, col = 'brown', lty = 2, lwd = 2)
lines( c(80,80), c(-0.005, 0.05), col = 'blue', lty=2, lwd = 2)
text(80-0.15, 0.055, c('mean'), srt = 90, cex = sl)

# write figures
dev.off()

####################################################################################
# Figure 03-06
# Four examples of data with different standard deviations.

# generate a series of numbers
x <- seq(-5, 5, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# create figures for file
filename <- 'Figure 03-06'
pdf(paste(fileplace,filename,'.pdf'))

# plot the normal distribution
plot(x, fx, type='l', lty=2, xlab='x', lwd = 2, ylim = c(0,.8),
     ylab='P(x)', main='Normal Distributions with different Means and Standard Deviations',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# plot the different normal distributions
lines(x, dnorm(x, mean = 1, sd = 1), col = 4)
lines(x, dnorm(x, mean = 0, sd = 0.5), col = 3)
lines(x, dnorm(x, mean = 0, sd = 2), col = 6)

# add a legend
legend('topleft', lwd = c(1, 1, 1, 2), bty = 'n', c('mean = 1, stand. dev. = 1', 
                                                    'mean = 0, stand. dev. = 0.5', 
                                                    'mean = 0, stand. dev. = 2', 
                                                    'mean = 0, stand. dev. = 1'), 
       lty = c(1, 1, 1, 2), col = c(4, 3, 6, 1), 
       cex = sl)

# write figures
dev.off()

####################################################################################
# Figure 03-07
# Graphic illustration of a Negative (left) and Positive (right) skew.
# Inspired by: https://en.wikipedia.org/wiki/Skewness#mediaviewer/File:Negative_and_positive_skew_diagrams_(English).svg

x <- seq(-4,4,length=10000)

a <- 4
b <- 2

# create figures for file
filename <- 'Figure 03-07'
pdf(paste(fileplace,filename,'.pdf'))

# allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))

# plot the negative skew histogram
plot(x,dbeta(x,a,b),xlim=c(0,1), ylim=c(0,2.7), type='l', lty=1, xlab='', ylab='', lwd = 1, yaxt='n',
     main='Left (negative) skew', bty='n', col='red', col.main = 'red', xaxt='n',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# add an arrow indicating direction of skew
arrows(1,2.6,x1=0,length = 0.25, angle = 30,
       code = 2, col = 'red', lty = par('lty'))

# plot the positve skew histogram
plot(x,dbeta(x,b,a),xlim=c(0,1), ylim=c(0,2.7), type='l', lty=1, xlab='', ylab='', lwd = 1, yaxt='n', 
     main='Right (positive) skew', bty='n', col='blue', col.main = 'blue', xaxt='n',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# add an arrow indicating direction of skew
arrows(0,2.6,x1=1,length = 0.25, angle = 30,
       code = 2, col = 'blue', lty = par('lty'))

# write figures
dev.off()

####################################################################################
# Figure 03-08
# Example of Chi-Squared Distribution
# Inspired by: http://en.wikipedia.org/wiki/Chi-squared_distribution#mediaviewer/File:Chi-square_pdf.svg

# generate a series of numbers
x <- seq(0, 50, l=10000)

# generate chi squared distributed data based on the series
fx <- dchisq(x, 1)

# create figures for file
filename <- 'Figure 03-08'
pdf(paste(fileplace,filename,'.pdf'))

# plot the distribution
plot(x, fx, type='l', lty=1, xlab='x', lwd = 1, xlim = c(0,16), ylim = c(0,0.4),
     ylab='f(x)', main='Chi Squared Distribution', cex.main = sm, cex.lab = sl, cex.axis = sa)

lines(x, dchisq(x, 16), col = 5)
lines(x, dchisq(x, 8), col = 4)
lines(x, dchisq(x, 4), col = 3)
lines(x, dchisq(x, 2), col = 2)

# add a legend
legend('topright', lwd = c(1, 1, 1, 1, 1), bty = 'n', c('df=1', 'df=2', 'df=4', 'df=8', 'df=16'), 
       lty = c(1, 1, 1, 1, 1), col = c(1, 5, 4, 3, 2), cex = sl)

# write figures
dev.off()

####################################################################################
# Figure 03-09
# Comparison of mean, median, and mode of two log-normal distributions with different skewness. 
# Modified from: https://en.wikipedia.org/wiki/Skewness#mediaviewer/File:Comparison_mean_median_mode.svg
# from 'Skewness' by Cmglee Wikipedia Community retrieved 
# from https://en.wikipedia.org/wiki/Skewness   
# used under a Creative Commons Attribution 
# http://creativecommons.org/licenses/by-sa/3.0/.

# generate a series of numbers
x <- seq(0, 5, l=1000)

# define the variables used to create the lognormal plots
m <- 0    # mean = 0
s <- c(0.25,1) # standard deviations are 0.25 and 1
c <- c('red', 'green', 'blue') # color scheme for mean, median, & mode

# determine median, mean, and mode of the log-normal plots
Median <- exp(m)  # median is same for both plots
Mean <- c(exp(m+(s[1]^2)/2),exp(m+(s[2]^2)/2))
Mode <- c(exp(m-s[1]^2),exp(m-(s[2]^2)))

# create figures for file
filename <- 'Figure 03-09'
pdf(paste(fileplace,filename,'.pdf'))

# plot the log-normal curve with standard deviation = 0.25; add title and axes lables
plot(x, dlnorm(x, m, s[1]), col = 'black', type='l', xlab='x', 
     lwd = 1, ylim = c(0,2), xlim= c(0,2), lty = 1,
     ylab='f(x)', main='Log-Normal Distribution \n Solid: sd = 0.25, Dashed: sd = 1',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

# add log-normal curve with a standard deviation = 1
lines(x, dlnorm(x, m, s[2]), col = 'black', lty = 3, lwd = 3)

# add vertical lines for the two means of the log-normal curves
lines(c(Mean[1], Mean[1]), c(-0.5,1.53), lty = 1, col='red', lwd=1)
lines(c(Mean[2], Mean[2]), c(-0.5,0.25), lty = 3, col='red', lwd=3)

# add vertical lines for the two modes of the log-normal curves 
lines(c(Mode[1], Mode[1]), c(-0.5,1.65), lty = 1, col='blue', lwd=1)
lines(c(Mode[2], Mode[2]), c(-0.5,0.7), lty = 3, col='blue', lwd=3)

# add vertical lines for the two medians of the log-normal curves 
lines(c(Median, Median), c(-0.5,1.6), lty = 1, col='green', lwd=1)
lines(c(Median, Median), c(0,0.4), lty = 3, lwd = 3, col = 'green')

# add a legend
legend('topright', lwd = c(1,1,1,1), bty = 'n', lty = 1, 
       c('Mean','Median','Mode'),
       col = c, cex = sl)

# write figures
dev.off()

####################################################################################
# Figure 03-10
# Skewness of a distribution will shift the mean and mode away from the median.

# generate sequence of x values
x <- seq(-4,4,length=10000)

# define histogram shape parameters
a <- 4
b <- 2

# create figures for file
filename <- 'Figure 03-10'
pdf(paste(fileplace,filename,'.pdf'))

# allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,3))
par(cex.main = sm, cex.lab = sl, cex.axis = sa)

# plot negative skew curve
plot(x,dbeta(x,a,b),xlim=c(0,1), ylim=c(0,2.7), type='l', lty=1, xlab='', ylab='', lwd = 1, yaxt='n',
     main='Left (negative) skew', bty='n', col='red', col.main = 'red', xaxt='n',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

mean <- a/(a+b)
median <- (a-(1/3))/(a+b-(2/3))
mode <- (a-1)/(a+b-2)

# plot mean for negative skew and label accordingly
lines( c(mean,mean), c(-0.05, 2.3), col = 'black', lty=3, lwd = 3)

# plot median for negative skew and label accordingly
lines( c(median,median), c(-0.05, 2.3), col = 'green', lty=3, lwd = 2)

# plot mode for negative skew and label accordingly
lines( c(mode,mode), c(-0.05, 2.3), col = 'orange', lty=2, lwd = 2)

# plot arrow indicating negative skew
arrows(1,2.6,x1=0,length = 0.25, angle = 30,
       code = 2, col = 'red', lty = par('lty'))

# plot normal curve
plot(x,dbeta(x,a,a),xlim=c(0,1), ylim=c(0,2.7), type='l', lty=1, xlab='SKEW', ylab='', lwd = 1, yaxt='n', 
     main='Normal', bty='n', xaxt='n', cex.axis = 2, cex.main = sm, cex.lab = sl, cex.axis = sa)

mean <- a/(a+a)
median <- (a-(1/3))/(a+a-(2/3))
mode <- (a-1)/(a+a-2)

# plot mean for negative skew and label accordingly
lines( c(mean,mean), c(-0.05, 2.3), col = 'black', lty=3, lwd = 3)

# plot mode for negative skew and label accordingly
lines( c(mode,mode), c(-0.05, 2.3), col = 'orange', lty=2, lwd = 2)

# plot median for negative skew and label accordingly
lines( c(median,median), c(-0.05, 2.3), col = 'green', lty=3, lwd = 2)

# add a legend
legend('top', lwd = c(3,2,2), bty = 'n', lty = c(3,3,2), 
       c('Mean','Median','Mode'),
       col = c('black', 'green', 'orange'))

# plot positive skew curve
plot(x,dbeta(x,b,a),xlim=c(0,1), ylim=c(0,2.7), type='l', lty=1, xlab='', ylab='', lwd = 1, yaxt='n', 
     main='Right (positive) skew', bty='n', col='blue', col.main = 'blue', xaxt='n',
     cex.main = sm, cex.lab = sl, cex.axis = sa)

mean <- b/(b+a)
median <- (b-(1/3))/(b+a-(2/3))
mode <- (b-1)/(b+a-2)

# plot mean for negative skew and label accordingly
lines( c(mean,mean), c(-0.05, 2.3), col = 'black', lty=3, lwd = 3)

# plot mode for negative skew and label accordingly
lines( c(mode,mode), c(-0.05, 2.3), col = 'orange', lty=2, lwd = 2)

# plot median for negative skew and label accordingly
lines( c(median,median), c(-0.05, 2.3), col = 'green', lty=3, lwd = 2)

# plot arrow indicating positive skew
arrows(0,2.6,x1=1,length = 0.25, angle = 30,
       code = 2, col = par('fg'), lty = par('lty'))

# write figures
dev.off()

####################################################################################
# Figure 03-11
# Z-score and how it relates to the standard deviation of a normal distribution.
# Inspired by: http://en.wikipedia.org/wiki/Standard_score#mediaviewer/File:Normal_distribution_and_scales.gif

# generate a series of numbers
x <- seq(-4, 4, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# create figures for file
filename <- 'Figure 03-11'
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