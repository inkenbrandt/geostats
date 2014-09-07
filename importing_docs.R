# http://www.r-tutor.com/r-introduction/data-frame/data-import
# http://www.computerworld.com/article/2497164/business-intelligence/beginner-s-guide-to-r-get-your-data-into-r.html

####################################################################################
# https://stat.ethz.ch/R-manual/R-patched/library/base/html/getwd.html
# get working directory to see where your files will be saved
getwd()

# set directory to save your files somewhere else
# make sure to use forward slashes instead of back slashes
setwd("E:/GitHub/geostats")


####################################################################################
# to see and import sample data
sample()

beaver1

####################################################################################
# http://stat.ethz.ch/R-manual/R-devel/library/utils/html/read.table.html
# to import and assign a text file

text.file <- read.table("file.txt", sep=",", header=TRUE) 

# to import and assign a text file

csv.file <- read.csv("file.txt")

####################################################################################
# Excel Files
# http://cran.r-project.org/web/packages/XLConnect/index.html

library(XLConnect)               # load XLConnect package 
wrkbk <- loadWorkbook("file.xlsx") 
dataframe <- readWorksheet(wrkbk, sheet="file")