# from http://www.ggtern.com/2013/12/12/hello-world-2-2/

library(ggtern)

# generate ternary data points
tri_point <- data.frame(X = runif(100), Y = runif(100), Z = runif(100))

# generate ternary plot
plot <- ggtern(data = tri_point,
               mapping = aes(x = X, y = Y, z = Z)) +
        geom_point() + theme_tern_rgbg()

# theme_tern_rgbw adds colors for each axis

plot