# including Libraries for doing Archeological Index
## including the spatial packages
library(raster)
library(rgdal)
library(rgeos)

## Error in library(rgeos): there is no package called 'rgeos
library(RColorBrewer)

# turn off factors
options(stringsAsFactors = FALSE)

# importing the august month Sentinel 2 Satellite data for Palmyra region
August_st <- stack("G:/MCA/S2A_20150817T081006.tif")

# converting the raster data into rasterbrick for faster processing
August_br <- brick(August_st)

# Calculation of Normalised archeological Index for august month
## Description of the band 5 and band 7
August_br[[5]]
August_br[[7]]

# Formula for Normalised Archeological Index
NDAI_August<- (August_br[[7]]-August_br[[5]])/(August_br[[7]]+August_br[[5]])

#Plotting the output
AugustNDAI<-plot(NDAI_August,main = "NDAI for August month", col=c("blue", "orange", "darkgreen", "red"))

# importing the September month Sentinel 2 Satellite data for Palmyra region
September_st <- stack("G:/MCA/S2A_20150916T080746.tif")

# converting the raster data into rasterbrick for faster processing
September_br <- brick(September_st)

# Calculation of Normalised archeological Index for september month
## Description of the band 5 and band 7
September_br[[5]]
September_br[[7]]

# Formula for Normalised Archeological Index
NDAI_September<- (September_br[[7]]-September_br[[5]])/(September_br[[7]]+September_br[[5]])

#Plotting the output
plot(NDAI_September,main = "NDAI for September month", col=c("blue", "orange", "darkgreen", "red"))

# Changes by differencing and Plotting
change1 = NDAI_August- NDAI_September
Plot(change1)
