
# inspired by http://www.r-bloggers.com/a-brief-introduction-to-mixture-distributions/

# designate the example data as x; faithful is the table and waiting is the data column
x <- faithful$waiting

# draw a probability histogram of the waiting data
hist(x, breaks=20, prob=TRUE, col ='green', ylab = 'Probability', xlab = 'waiting time (minutes)',
     main = 'Old Faithful Eruption Data \n Example of Bimodal Distribution', 
     ylim = c(-0.005,0.06), lwd = 0.5, xlim = c(35,100), xaxp  = c(35, 100, (100-35)/5))

# add a probability density estimate line
lines(density(x), col='red', lwd = 2)

y = seq(0,90)

lines(y,dnorm(y,53.5,6.8)*.34, col = "purple", lty = 2, lwd = 2)

z = seq(50,100)

lines(z,dnorm(z,80,6.8)*.63, col = "purple", lty = 2, lwd = 2)

lines( c(53.5,53.5), c(-0.005, 0.05), col = "blue", lty=2, lwd = 2)
text(53.5-0.15, 0.055, c("mean"), srt = 90)

lines( c(80,80), c(-0.005, 0.05), col = "blue", lty=2, lwd = 2)
text(80-0.15, 0.055, c("mean"), srt = 90)