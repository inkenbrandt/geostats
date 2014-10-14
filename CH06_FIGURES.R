fileplace <- 'E:/STATS/Review/original figures/'
####################################################################################
# Figure 06-

# http://pascencio.cos.ucf.edu/classes/Methods/R%20demos/R%20Demonstration%20Law%20Large%20numbers%202012.pdf

#sample <- rbinom(1,30, 1/6) 

plot(1,mean(rnorm(i,3.5,1.709)),xlim=c(0,1000), main = 'Law of Large Numbers', 
     ylab = 'Mean Result', xlab = 'Number of Dice Rolls')



for (i in 1:1000) points(i,mean(rnorm(i,3.5,1.709)))


lines(c(-100,1100), c(3.5,3.5), col='red', lty = 2, lwd = 2)