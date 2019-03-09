# this is for sentinel 2 image
# load library
library(raster)
# image of sentinel 2 for the year 2015
s <- brick('S2A_20150916T080746.tif')

# image of sentinel 2 for the year 2016
s1<- brick('S2A_20160817T081006.tif')
# subtracting both images for detecting the changes
change<-s1-s
plot(change)
# applying K means clustering (image processing method)
kMeansResult <- kmeans(change[], centers=6)
result <- raster(change[[1]])
result <- setValues(result, kMeansResult$cluster)
plot(result)


