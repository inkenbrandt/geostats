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
print(round(cor(x,y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- g*2 
print(round(cor(x,y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)




y <- x*-3 + g*-6.5 
print(round(cor(x,y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- x*-3+g*-2.36
print(round(cor(x,y), digits=1))
plot(x,y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

y <- x*-3
print(round(cor(x,y), digits=1))
plot(x, y, xaxt='n', yaxt='n', ann=FALSE, frame.plot=FALSE)

##################################################################
#Heteroscedastic

x <- seq(1,100,1)

plot(x[1],x[1]*3+rnorm(1,sd=x[1]),xlim=c(0,100), ylim=c(-100,600))
for (i in x) points(x[i],x[i]*3+rnorm(1,sd=x[i]))
