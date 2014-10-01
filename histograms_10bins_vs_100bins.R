x <- rnorm(10000,0,1)

#allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))


hist(x, breaks = seq(min(x), max(x), l = 11), col = 2, xlim = c(-5,5), ylim = c(0,3500), main="10 Bins")
hist(x, breaks = seq(min(x), max(x), l = 101), col = 2, xlim = c(-5,5), ylim = c(0,400), main="100 Bins")

