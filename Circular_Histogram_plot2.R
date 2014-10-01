####################################################################################
# https://stat.ethz.ch/R-manual/R-patched/library/base/html/getwd.html
# get working directory to see where your files will be saved
getwd()

# set directory to save your files somewhere else
# make sure to use forward slashes instead of back slashes
setwd("E:/GitHub/geostats")

csv.file <- read.csv("circular_data.csv")
x <- csv.file[2]

rose.diag(x, bins=20, zero=pi/2, units = 'degrees', rotation='clock', col=3)
