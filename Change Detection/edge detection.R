# loading the library
library(OpenImageR)
# load the image
edge<-raster("subset_2_of_S1A_IW_GRDH_1SDV_20170705T152447_20170705T152512_017338_01CF31_A140_Spk_Geo_TC.tif")
# the data has to be converted to matrix
res1<-as.matrix(edge)
# edge detection method is used for detecting the changes
edge_sen1 = edge_detection(res1, method = 'Frei_chen', conv_mode = 'same')

imageShow(edge_sen1)

## as the image resolution is low, the edge detection method cannot be used.In images it clearly shows that edges are visible

