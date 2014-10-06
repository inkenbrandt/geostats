fileplace <- 'E:/STATS/Review/original figures/'

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

library('circular')

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

library(ggplot2)
library(ggtern)

# generate ternary data points
tri_point <- data.frame(X = runif(100), Y = runif(100), Z = runif(100))

# generate ternary plot
plot <- ggtern(data = tri_point, mapping = aes(x = X, y = Y, z = Z)) + 
  geom_point() + theme_rgbg() + labs(title="Shepard Sediment Classification Diagram")

# theme_tern_rgbw adds colors for each axis

plot