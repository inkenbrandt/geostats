fileplace <- 'E:/STATS/Review/Chapters/original figures/Chapter_04/'

####################################################################################
# Figure 06-01
filename='figure06-01'
pdf(paste(fileplace,filename,'.pdf'))


x0 = seq(-2*pi,2*pi,0.01)
y0 = sin(2*pi*x0*1/2 + 30*pi/180)*2
y1 = sin(2*pi*x0*1/2 + 155*pi/180)*2.5
y2 = sin(2*pi*x0*1/2 + 90*pi/180)  

x = c(-3,-2,-1,0,1,2,3)
y = c(-1,1,-1,1,-1,1,-1)

plot(x,y, type='p', pch = 19, col='black',ylim=c(-3,3), xlim=c(-3,3),main='Sampling Periodic Events')
lines(x0,y0, col='green')
lines(x0,y1, col='blue')
lines(x0,y2, col='red')
abline(v=0, col='black')
abline(h=0, col='black')

# write figures
dev.off()
####################################################################################
# Figure 06-04
# From: http://en.wikipedia.org/wiki/R_(programming_language)


library(caTools)  # external package providing write.gif function
jet.colors = colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F", 
                                "yellow", "#FF7F00", "red", "#7F0000")) 
m = 600     # define size
C = complex( real=rep(seq(-1.8,0.6, length.out=m), each=m ), 
             imag=rep(seq(-1.2,1.2, length.out=m), m ) ) 
C = matrix(C,m,m)  # reshape as square matrix of complex numbers
Z = 0     # initialize Z to zero
X = array(0, c(m,m,20)) # initialize output 3D array
for (k in 1:20) {  # loop with 20 iterations
  Z = Z^2+C    # the central difference equation 
  X[,,k] = exp(-abs(Z)) # capture results
} 
write.gif(X,paste(fileplace, "Mandelbrot.gif"), col=jet.colors, delay=100)
