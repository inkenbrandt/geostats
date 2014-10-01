

x = 1:100

p = dbinom(x, size=100, prob=0.5)

plot(x, p, type="h", xlim=c(30,70), ylim=c(0,0.09), col="blue", ylab="Probability", main="Discrete Distribution")

points(x, p, col="red")