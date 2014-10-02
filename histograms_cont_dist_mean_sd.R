# Mean and Std Dev
# figure 02-04

# generate a series of numbers
x <- seq(-4, 4, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# plot the normal distribution
plot(x, fx, type="l", lty=1, xlab="x", lwd = 2,
     ylab="P(x)", main="Continuous Distribution")


lines( c(0,0), c(0, 0.5), col = "red", lty=2, lwd = 1)
text(mx-0.15, 0.05, c("mean"), srt = 90)

# enable these lines and text to see standard deviation
#lines( c(1,1), c(0, 0.5), col = "blue", lty=2, lwd = 1)
#text(1-0.15, 0.05, c("std. dev."), srt = 90)

#lines( c(-1,-1), c(0, 0.5), col = "blue", lty=2, lwd = 1)
#text(-1.15, 0.05, c("std. dev."), srt = 90)
