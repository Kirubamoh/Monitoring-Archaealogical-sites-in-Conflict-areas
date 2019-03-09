# this is for sentinel 2 image
# load library
library(raster)
# image of sentinel 2 for the year 2015
s <- brick('S2A_20150916T080746.tif')
## create the function for NDVI classification
vi <- function(img, i, k){
  + bi <- img[[i]]
  + bk <- img[[k]]
  + vi <- (bk-bi)/(bk+bi)
  + return(vi)
   }
# band values
ndvi <- vi(s, 4,8)
# image of sentinel 2 for the year 2016
s1<- brick('S2A_20160817T081006.tif')
# band values
ndvi1 <- vi(s1, 4,8)
# subtracting both images for detecting the changes
change= ndvi1-ndvi
plot(change)
# applying K means clustering (image processing method)
kMeansResult <- kmeans(change[], centers=6)
result <- raster(change[[1]])
result <- setValues(result, kMeansResult$cluster)
plot(result)


