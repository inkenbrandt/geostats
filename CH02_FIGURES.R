fileplace <- 'E:/STATS/Review/Chapters/original figures/Chapter_02/'

# Figure 02-04
# 

# create figures for file
filename <- 'Figure 02-04'
pdf(paste(fileplace,filename,'.pdf'))

# Boxplot 
boxplot(Speed~Expt,data=morley, main="Boxplot of Morley Speed of Light Data", 
        xlab="Experiment Number", ylab="Speed of Light (km/s + 2.99E5 ")

# add actual line to distribution
abline(h=792, col='dark green')
text(3, 794, labels=c('actual speed'), pos = 1, font=2, col='dark green', cex=0.80)




# write figures
dev.off()

data(morley)


