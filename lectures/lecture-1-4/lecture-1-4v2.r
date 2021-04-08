library("rstudioapi")  
setwd(dirname(getActiveDocumentContext()$path))

library(raster)

dir.create('data', showWarnings = FALSE)
if (!file.exists('data/rs/samples.rds')) { 
        download.file('https://biogeo.ucdavis.edu/data/rspatial/rsdata.zip', dest = 'data/rsdata.zip') 
        unzip('data/rsdata.zip', exdir='data')
}


# Blue
b2 <- raster('data/rs/LC08_044034_20170614_B2.tif')
# Green
b3 <- raster('data/rs/LC08_044034_20170614_B3.tif')
# Red
b4 <- raster('data/rs/LC08_044034_20170614_B4.tif')
# Near Infrared (NIR)
b5 <- raster('data/rs/LC08_044034_20170614_B5.tif')

b2

# coordinate reference system (CRS)
crs(b2)

ncell(b2)
dim(b2)
res(b2)
nlayers(b2)
compareRaster(b2,b3)
s <- stack(b5, b4, b3)
s


#first create a list of raster layers to use
filenames <- paste0('data/rs/LC08_044034_20170614_B', 1:11, ".tif")
filenames


landsat <- stack(filenames)
landsat


par(mfrow = c(2,2))
plot(b2, main = "Blue", col = gray(0:100 / 100))
plot(b3, main = "Green", col = gray(0:100 / 100))
plot(b4, main = "Red", col = gray(0:100 / 100))
plot(b5, main = "NIR", col = gray(0:100 / 100))

landsatRGB <- stack(b4, b3, b2)
plotRGB(landsatRGB, axes = TRUE, stretch = "lin", main = "Landsat True Color Composite")

par(mfrow = c(1,2))
plotRGB(landsatRGB, axes=TRUE, stretch="lin", main="Landsat True Color Composite")
landsatFCC <- stack(b5, b4, b3)
plotRGB(landsatFCC, axes=TRUE, stretch="lin", main="Landsat False Color Composite")


set.seed(1)
sr <- sampleRandom(landsat, 10000)
plot(sr[,c(4,5)], main = "NIR-Red plot")

pca <- prcomp(sr, scale = TRUE)
pca


screeplot(pca)
pci <- predict(landsat, pca, index = 1:2)
plot(pci[[1]])
pc2 <- reclassify(pci[[2]], c(-Inf,0,1,0,Inf,NA))
par(mfrow = c(1,2))
plotRGB(landsatFCC, r = 1, g = 2, b = 3, axes = TRUE, stretch = "lin", main ="Landsat False Color Composite")
plotRGB(landsatFCC, r = 1, g = 2, b = 3, axes = TRUE, stretch = "lin", main ="Landsat False Color Composite")
plot(pc2, legend = FALSE, add = TRUE)
