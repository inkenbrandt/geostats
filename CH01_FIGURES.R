fileplace <- 'E:/STATS/Review/original figures/'

####################################################################################
# Figure 01-02
# Accuracy vs. Precision
# Inspired by: http://en.wikipedia.org/wiki/Accuracy_and_precision#mediaviewer/File:Accuracy_(trueness_and_precision).svg

# generate a series of numbers
x <- seq(-10, 100, l=1000)

# generate normally distributed data based on the series
fx <- dnorm(x, mean = 50, sd = 3)

# create figures for file
filename <- 'Figure 01-02'
pdf(paste(fileplace,filename,'.pdf'))

# plot the normal distribution
plot(x, fx, type='l', lty=1, xlab='x', lwd = 2, ylim = c(-.02,0.18),
     ylab='P(x)', xlim = c(0,70), main='Accuracy and Precision in terms of a Distribution')

# add actual value line to distribution
lines( c(20,20), c(0, 0.5), col = 'red', lty=1, lwd = 1)
text(18.5, 0.05, c('actual value'), srt = 90)

# add a measure values mean line to the distribution
lines( c(50, 50), c(0.001, 0.5), col = 'red', lty=1, lwd = 1)
text(48.5, 0.05, c('measurement mean'), srt = 90)

# add an arrow indicating the accuracy
arrows(20,0.15,x1=50,length = 0.25, angle = 30,
       code = 3, col = 'blue', lty = 1)
text(35, 0.155, c('accuracy'), srt = 0)

# add an arrow indicating the accuracy
arrows(42,-0.001,x1=59,length = 0.25, angle = 30,
       code = 3, col = 'blue', lty = 1)
text(50, -0.006, c('precision'), srt = 0)

# write figures
dev.off()

####################################################################################
# Figure 01-04
# Screenshot of histograms created using R.

#create 10000 random normally distributed data points with a mean of 0 and standard deviation of 1
NormalData<-rnorm(n=10000, m=0, sd=1) 

# create figures for file
filename <- 'Figure 01-04'
pdf(paste(fileplace,filename,'.pdf'))

#allow for stacking of figures 1 row and 2 columns in size
par(mfrow=c(1,2))

#create histogram
h <- hist(NormalData, col=2, ylim=c(0,2000), xlim=c(-4,4), main='Ordinary histogram')

#create cumulative dataset
h$counts <- cumsum(h$counts) # replace the cell freq.s by cumulative freq.s

#plot cumulative histogram
plot( h, col=2, main = 'Cumulative histogram', xlim=c(-4,4) ) # plot a cumulative histogram of y

# write figures
dev.off()

####################################################################################
# Figure 01-05
# Rose diagram.
# https://stat.ethz.ch/R-manual/R-patched/library/base/html/getwd.html
# http://cran.r-project.org/web/packages/circular/circular.pdf

library('circular', lib = 'E:/R-Portable/App/R-Portable/library')

# get working directory to see where your files will be saved
getwd()

# set directory to save your files somewhere else
# make sure to use forward slashes instead of back slashes
setwd("E:/GitHub/geostats")

csv.file <- read.csv("circular_data.csv")
x <- csv.file[2]

# create figures for file
filename <- 'Figure 01-05'
pdf(paste(fileplace,filename,'.pdf'))

rose.diag(x, bins=20, zero=pi/2, units = 'degrees', rotation='clock', col=3, main = 'Rose Diagram')

# write figures
dev.off()

####################################################################################
# Figure 01-06
# Scatterplot.

# create x
x <- c(1,2,3,4,5,6,7,8,9,10)

# generate y from x
y <- x*1.2 + runif(10,2,6)

# create figures for file
filename <- 'Figure 01-06'
pdf(paste(fileplace,filename,'.pdf'))

# generate scatterplot
plot(x, y, main="Scatterplot Example", 
     xlab="x", ylab="y", pch=19, col = 2)

# write figures
dev.off()

####################################################################################
# Figure 01-07
# from http://www.ggtern.com/2013/12/12/hello-world-2-2/

library(ggplot2, lib = 'E:/R-Portable/App/R-Portable/library')
library(ggtern, lib = 'E:/R-Portable/App/R-Portable/library')

# create figures for file
filename <- 'Figure 01-07'
pdf(paste(fileplace,filename,'.pdf'))

# generate ternary data points
tri_point <- data.frame(X = runif(100), Y = runif(100), Z = runif(100))

# generate ternary plot
plot <- ggtern(data = tri_point, mapping = aes(x = X, y = Y, z = Z)) + 
  geom_point() + theme_rgbg() + labs(title = 'Ternary Diagram')

# plot ternary plot
plot

# write figures
dev.off()

####################################################################################
# Figure 01-08
# 3D Exploded Pie Chart

# import plotrix library
library(plotrix, lib = 'E:/R-Portable/App/R-Portable/library')

# generate x data
x <- c(9, 45, 6, 41)

# generate labels
labl <- c("A", "B", "C", "D")

# assign colors for plots
c <- c('red', 'purple', 'blue', 'green')

# create figures for file
filename <- 'Figure 01-08'
pdf(paste(fileplace,filename,'.pdf'))

# allow for 1 row and 2 columns of plots
par(mfrow=c(1, 2))

# make pie chart
pie(x, labels = labl, col = c, main="Pie Chart")

# make 3D pie chart
pie3D(x,labels = labl, theta = pi/8, explode = 0.1, col = c,
      main="Misleading Pie Chart", start = pi/2, height = 0.2, sector.order = c(4,1,3,2))

# write figures
dev.off()

