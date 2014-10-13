####################################################################################
# Figure 05-05
# IQ Distribution


xsrt0 <- 40
xend0 <- 180
xinc0 <- 0.01
xdim0 <- c(xsrt0, seq(xsrt0, xend0, xinc0), xend0) 
ydim0 <- c(0, dnorm(seq(xsrt0, xend0, xinc0),100,16),0) 

xsrt <- 140
xend <- 180
xinc <- 0.01
xdim <- c(xsrt, seq(xsrt, xend, xinc), xend) 
ydim <- c(0, dnorm(seq(xsrt, xend, xinc),100,16),0) 

curve(dnorm(x,100,16), xlim = c(36,180), main = 'IQ Distribution', 
      ylab = 'Probability(x)', xlab = 'x', ylim=c(-0.02, 0.03),
      xaxp = c(36,180,9)) 

polygon(xdim0, ydim0, col='sky blue')
polygon(xdim, ydim, col='green')

lines( c(100,100), c(-0.2, 0.5), col = 'red', lty=2, lwd = 1)
text(97,-0.01, cex = 0.7, 'average IQ', col='red', srt = 90)

lines( c(160,160), c(-0.2, 0.5), col = 'blue', lty=2, lwd = 1)
text(157,-0.01, cex = 0.7, 'Einstein\'s IQ', col='blue', srt = 90)

lines( c(xsrt,xsrt), c(-0.2, .5), col = 'black', lty=2, lwd = 1)

arrows(xsrt,-0.05,x1=xend,length = 0.15, angle = 20,
       code = 2, col = 'dark green', lty = 1)
text(xsrt+1, -0.08, cex = 0.7, 'x > 1.645\n5% of curve area', 
     col='dark green', srt = 0)

arrows(xsrt,-0.05,x1=-4,length = 0.15, angle = 20,
       code = 2, col = 'blue', lty = 1)
text(-2, -0.08, cex = 0.7, 'x < 1.645\n95% of curve area', 
     col='blue', srt = 0)
