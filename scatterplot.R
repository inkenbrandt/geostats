#Scatterplot

#create x
x <- c(1,2,3,4,5,6,7,8,9,10)
y <- x*1.2 + runif(10,2,6)

plot(x, y, main="Scatterplot Example", 
     xlab="x", ylab="y", pch=19, col = 2)