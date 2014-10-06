# Mean and Std Dev
# figure 02-11

# generate a series of numbers
x <- seq(-4, 4, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# plot the normal distribution
plot(x, fx, type='l', lty=1, xlab='z-score', lwd = 2, ylim = c(-0.05,0.55), xaxp=c(-4,4,8),
     ylab='P(x)', cex.main =0.95,
     main='Normal Distribution with z-Scores and Standard Deviations')

lines( c(0,0), c(-0.05, 0.45), col = 'red', lty=2, lwd = 2)
text(0, 0.5, expression(bar(x)), srt = 0, col='red')

# enable these lines and text to see standard deviation
lines( c(1,1), c(-0.05, 0.25), col = 'blue', lty=2, lwd = 1)
text(1, 0.35, expression(1~sigma), srt = 0, cex=0.8, col='blue')

lines( c(2,2), c(-0.05, 0.05), col = 'purple', lty=2, lwd = 1)
text(2, 0.1, expression(2~sigma), srt = 0, cex=0.8, col = 'purple')

lines( c(3,3), c(-0.05, 0.00), col = 'green', lty=2, lwd = 1)
text(3, 0.05, expression(3~sigma), srt = 0, cex=0.8, col='blue')

lines( c(-1,-1), c(-0.05, 0.25), col = 'blue', lty=2, lwd = 1)
text(-1.01, 0.35, expression(-1~sigma), srt = 0, cex=0.8, col='blue')

lines( c(-2,-2), c(-0.05, 0.05), col = 'purple', lty=2, lwd = 1)
text(-2.01, 0.1, expression(-2~sigma), srt = 0, cex=0.8, col='purple')

lines( c(-3,-3), c(-0.05, 0.00), col = 'green', lty=2, lwd = 1)
text(-3.01, 0.05, expression(-3~sigma), srt = 0, cex=0.8, col='green')

text(0, 0.23, '68% of values', font = 2, srt = 0, cex = 0.8, col='blue')
text(0, 0.03, '95% of values', font = 2, srt = 0, cex = 0.8, col='purple')
text(0, -0.02, '99.7% of values', font = 2, srt = 0, cex = 0.8, col='green')

arrows(1,0.25,x1=-1,length = 0.15, angle = 20,
       code = 3, col = "blue", lty = par("lty"))

arrows(2,0.05,x1=-2,length = 0.15, angle = 20,
       code = 3, col = "purple", lty = par("lty"))

arrows(3,0.0,x1=-3,length = 0.15, angle = 20,
       code = 3, col = "green", lty = par("lty"))
