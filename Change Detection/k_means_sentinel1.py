import numpy as np
from sklearn import cluster
from osgeo import gdal, gdal_array
import matplotlib.pyplot as plt
# gdal to throw exception and register all drivers
gdal.UseExceptions()
gdal.AllRegister()
# read raster image
img_ds = gdal.Open('../subset_2_of_S1A_IW_GRDH_1SDV_20170705T152447_20170705T152512_017338_01CF31_A140_Spk_Geo_TC.tif', gdal.GA_ReadOnly)
band = img_ds.GetRasterBand(2)
img = band.ReadAsArray()
X = img.reshape((-1,1))
# k means classifier on data
k_means = cluster.KMeans(n_clusters=8)
k_means.fit(X)

X_cluster = k_means.labels
X_cluster = X_cluster.reshape(img.shape)
# visualize the data
plt.figure(figsize=(20,20))
plt.imshow(X_cluster, cmap="hsv")
plt.show()
# classification on all bands
img_ds = gdal.Open('../subset_2_of_S1A_IW_GRDH_1SDV_20170705T152447_20170705T152512_017338_01CF31_A140_Spk_Geo_TC.tif', gdal.GA_ReadOnly)
img = np.zeros((img_ds.RasterYSize, img_ds.RasterXSize, img_ds.RasterCount),
    gdal_array.GDALTypeCodeToNumericTypeCode(img_ds.GetRasterBand(1).DataType))
for b in range(img.shape[2]):
    img[:, :, b] = img_ds.GetRasterBand(b + 1).ReadAsArray()
    
new_shape = (img.shape[0] * img.shape[1], img.shape[2])
X = img[:, :, :13].reshape(new_shape)
k_means = cluster.KMeans(n_clusters=8)
k_means.fit(X)

X_cluster = k_means.labels
X_cluster = X_cluster.reshape(img[:, :, 0].shape)
# for plotting
plt.figure(figsize=(20,20))
plt.imshow(X_cluster, cmap="hsv")

plt.show()
