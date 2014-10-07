# Figure 03-03
# Continuous Distribution Histogram

# generate a series of numbers
x <- seq(-10, 100, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x, mean = 50, sd = 3)



# plot the normal distribution
plot(x, fx, type='l', lty=1, xlab='x', lwd = 2, ylim = c(-.02,0.18),
     ylab='P(x)', xlim = c(0,70), main='Continuous Distribution')

# add mean line to distribution
lines( c(20,20), c(0, 0.5), col = 'red', lty=1, lwd = 1)
text(18.5, 0.05, c('actual value'), srt = 90)
text(48.5, 0.05, c('measurement mean'), srt = 90)

lines( c(50, 50), c(0.001, 0.5), col = 'red', lty=1, lwd = 1)


# add an arrow indicating direction of skew
arrows(20,0.15,x1=50,length = 0.25, angle = 30,
       code = 3, col = 'blue', lty = 1)
text(35, 0.155, c('accuracy'), srt = 0)

arrows(42,-0.001,x1=59,length = 0.25, angle = 30,
       code = 3, col = 'blue', lty = 1)
text(50, -0.006, c('precision'), srt = 0)
