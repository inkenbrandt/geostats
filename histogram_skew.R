
# figure 02-10

par(mfrow=c(1,3))

x <- seq(-4,4,length=10000)

a=4
b=2

plot(x,dbeta(x,a,b),xlim=c(0,1), ylim=c(0,2.7), type="l", lty=1, xlab="", ylab='', lwd = 1, yaxt='n',
     main="Left (negative) skew", bty="n", col='red', col.main = 'red', xaxt='n' )

mean <- a/(a+b)
median <-(a-(1/3))/(a+b-(2/3))
mode <- (a-1)/(a+b-2)

arrows(1,2.6,x1=0,length = 0.25, angle = 30,
       code = 2, col = par("fg"), lty = par("lty"))

plot(x,dbeta(x,a,a),xlim=c(0,1), ylim=c(0,2.7), type="l", lty=1, xlab="SKEW", ylab='', lwd = 1, yaxt='n', 
     main="Normal", bty="n", xaxt='n', cex.axis = 2)

lines(c(0,1),c(2.6,2.6))

plot(x,dbeta(x,b,a),xlim=c(0,1), ylim=c(0,2.7), type="l", lty=1, xlab="", ylab='', lwd = 1, yaxt='n', 
     main="Right (positive) skew", bty="n", col='blue', col.main = 'blue', xaxt='n')

arrows(0,2.6,x1=1,length = 0.25, angle = 30,
       code = 2, col = par("fg"), lty = par("lty"))
