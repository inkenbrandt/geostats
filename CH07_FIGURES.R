par(mfrow = c(1,7))

x <- rnorm(1000)
g <- rnorm(1000)
h <- rnorm(1000)

y <- x*0.8
print(round(cor(x,y), digits=1))
plot(x, y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- x*0.8+g*0.5
print(round(cor(x,y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- x*3 + g*6.5 
print(round(cor(x, y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- g*2 
print(round(cor(x, y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)




y <- x*-3 + g*-6.5 
print(round(cor(x, y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- x*-3+g*-2.36
print(round(cor(x, y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- x*-3
print(round(cor(x,y), digits=1))
plot(x, y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

##################################################################
#Heteroscedastic

x <- seq(1,100,1)

plot(x[1], x[1]*3+rnorm(1,sd=x[1]), xlim=c(0,100), ylim=c(-100,600))
for (i in x) points(x[i], x[i]*3+rnorm(1,sd=x[i]))

##################################################################
# autocorrelation
set.seed(60)

par(mfrow = c(2,1))

x <- seq(1,180,1)
y <- sin(pi/180*x*6)+ runif(180,-1,1)
plot(x,y, typ = 'l', col = 'red', xaxp = c(0,180,6), ylim = c(-2,2), ylab= 'f(x)', main = 'f(x) = sin(pi/180*6*x) + random noise')
lines(x, sin(pi/180*6*x), col = 'blue', lty = 2)

abline(v=0, lty = 2, col = 'grey')
abline(v=60, lty = 2, col = 'grey')
abline(v=120, lty = 2, col = 'grey')
abline(v=180, lty = 2, col = 'grey')

acf(y, lag.max=180, xaxp = c(0,180,6), main = 'Autocorrelation of f(x)')

##################################################################
#faithful

x <- faithful
plot(faithful, main = 'Old Faithful Eruption\nEruptions vs. Waiting Time',
     xlab = 'Duration of Eruptions (min)', 
     ylab = 'Time between Eruptions (min)',
     col = 'blue')

##################################################################
#faithful
library(Rcmdr)
scatterplot(waiting~eruptions, reg.line=lm, smooth=TRUE, spread=TRUE, 
            boxplots='xy', span=0.5, data=faithful)

##################################################################
#




