#Author(s): Claudio Agostinelli, Ulric Lund and Hiroyoshi Arai
#Documentation reproduced from package circular, version 0.4-7. License: GPL-2
#http://cran.r-project.org/web/packages/circular/circular.pdf
 
# Generate von Mises data and create several rose diagrams.
x <- rvonmises(n=400, mu=circular(0), kappa=5 )
y <- rose.diag(x, bins=20, prop=1.5, shrink=1.5, col=2) 

# Add points to plot
points(x, plot.info=y, stack=TRUE)
 
