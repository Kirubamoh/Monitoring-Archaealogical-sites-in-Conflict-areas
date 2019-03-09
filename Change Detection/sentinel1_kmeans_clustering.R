#load library
library(raster)
library(sp)
library(rgdal)
library(RStoolbox)
# load images
image1<-raster("subset_2_of_S1A_IW_GRDH_1SDV_20170705T152447_20170705T152512_017338_01CF31_A140_Spk_Geo_TC.tif")
image2<-raster("subset_2_of_S2A_MSIL1C_20170806T081001_N0205_R078_T37SDU_20170806T081417_resampled.tif")
# apply unsupervised classification for both images
august<-unsuperClass(image1, nsamples = 10000, nclasses=5)
august
colours<-rainbow(5)
august1<-plot(august$map, col= colours, legend=FALSE, axes =FALSE, box = FALSE)
september<-unsuperClass(image2, nSamples = 10000, nclasses=5)
september
september1<-plot(september$map, col=colours, legend=FALSE, axes =FALSE, box = FALSE)
subtract<-august1-september1
# plot images
plot(subtract)