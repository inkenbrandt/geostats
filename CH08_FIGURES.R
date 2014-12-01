par(mfrow = c(1,2))

set.seed(70)
# http://stackoverflow.com/questions/9403660/how-to-create-thiessen-polygons-from-points-using-r-packages


library(geometry)
dat <- data.frame(x=runif(20), y=runif(20))


tmesh <- delaunayn(dat)
trimesh(tmesh,p=dat[1],p2=dat[2])
points(dat, col ='red')

circum(tmesh,dat)

library(tripack)
# example from TRIPACK:
data(tritest)
tritest.vm<-voronoi.mosaic(tritest$x,tritest$y)
tritest.vm
# use a part of the quakes data set:
data(quakes)
quakes.part<-quakes[(quakes[,1]<=-17 & quakes[,1]>=-19.0 &
                       quakes[,2]<=182.0 & quakes[,2]>=180.0),]
quakes.vm<-voronoi.mosaic(quakes.part$lon, quakes.part$lat, duplicate="remove")
quakes.vm

# y <- sin(alpha)
# circtest2<-list(x=cos(alpha)+runif(100,0,0.1)