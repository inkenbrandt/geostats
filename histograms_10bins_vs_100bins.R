# Figure 03-01
# Two histograms using the same data. The blue histogram has 100 bins; the green histogram has 10 bins.

# generate 10,000 normally distributed datapoints
x <- rnorm(10000,0,1)

#allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))

# create a histogram using the x data and 10 bins
hist(x, breaks = seq(min(x), max(x), l = 11), xlim = c(-5,5), ylim = c(0,3500), main = '10 Bins', col = 'green')

# create a histogram using the x data and 10 bins
hist(x, breaks = seq(min(x), max(x), l = 101), xlim = c(-5,5), ylim = c(0,400), main = '100 Bins', col = 'light blue')

