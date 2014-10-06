# Figure 02-09

#modified from https://en.wikipedia.org/wiki/Skewness#mediaviewer/File:Comparison_mean_median_mode.svg
# from "Skewness" by Cmglee Wikipedia Community retrieved 
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

# plot the log-normal curve with standard deviation = 0.25; add title and axes lables
plot.new()
plot(x, dlnorm(x, m, s[1]), col = 'black', type="l", xlab="x", 
     lwd = 1, ylim = c(0,2), xlim= c(0,2), lty = 1,
     ylab="f(x)", main="Log-Normal Distribution \n Solid: sd = 0.25, Dashed: sd = 1")

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
legend("topright", lwd = c(1,1,1,1), bty = "n", lty = 1, 
       c('Mean','Median','Mode'),
       col = c)
