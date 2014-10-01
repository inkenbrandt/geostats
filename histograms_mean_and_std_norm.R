# Mean and Std Dev
# figure 02-04

# generate a series of numbers
x <- seq(-5, 5, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)


# plot the normal distribution
plot(x, fx, type="l", lty=2, xlab="x", lwd = 2, ylim = c(0,.8),
     ylab="P(x)", main="Normal Distributions with different Mean and Stand. Dev.")


# plot the different normal distributions
lines(x, dnorm(x, mean = 1, sd = 1), col = 4)
lines(x, dnorm(x, mean = 0, sd = 0.5), col = 3)
lines(x, dnorm(x, mean = 0, sd = 2), col = 6)

# add a legend
legend("topleft", lwd = c(1, 1, 1, 2), bty = "n", c("mean = 1, sd = 1", 
                                                    "mean = 0, sd = 0.5", "mean = 0, sd = 2", 
                                                    "mean = 0, sd = 1"), 
       lty = c(1, 1, 1, 2), col = c(4, 3, 6, 1))