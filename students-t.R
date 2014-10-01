# Student's t distribution showing degrees of freedom vs. Normal distribution
# figure 02-04

# generate a series of numbers
x <- seq(-5, 5, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x)

# plot the normal distribution
plot(x, fx, type="l", lty=2, xlab="x", lwd = 2,
     ylab="P(x)", main="Student's t Distribution")

# plot the student's t distributions
lines(x, dt(x, 1), col = 4)
lines(x, dt(x, 2), col = 3)
lines(x, dt(x, 20), col = 6)

# add a legend
legend("topleft", lwd = c(1, 1, 1, 2), bty = "n", c("df=1", "df=2", "df=20", "Normal"), 
       lty = c(1, 1, 1, 2), col = c(4, 3, 6, 1))
