# Mean and Std Dev
# figure 02-04

# generate a series of numbers
x <- seq(0, 50, l=10000)


# generate chi squared distributed data based on the series
fx <- dchisq(x, 1)

# plot the distribution
plot(x, fx, type="l", lty=1, xlab="x", lwd = 1, xlim = c(0,16), ylim = c(0,0.4),
     ylab="f(x)", main="Chi Squared Distribution")

lines(x, dchisq(x, 16), col = 5)
lines(x, dchisq(x, 8), col = 4)
lines(x, dchisq(x, 4), col = 3)
lines(x, dchisq(x, 2), col = 2)


# add a legend
legend("topright", lwd = c(1, 1, 1, 1, 1), bty = "n", c("df=1", "df=2", "df=4", "df=8", "df=16"), 
       lty = c(1, 1, 1, 1, 1), col = c(1, 5, 4, 3, 2))