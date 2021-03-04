library(sp)
library(raster)

# SpatialPoints
longitude <-c(-116.7, -120.4, -116.7, -113.5, -115.5, -120.8, -119.5, -113.7, -113.7,-110.7)
latitude <-c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9, 36.2, 39, 41.6, 36.9)
lonlat <-cbind(longitude, latitude)
pts <- SpatialPoints(lonlat)
crdref <- CRS('+proj=longlat +datum=WGS84')
pts <- SpatialPoints(lonlat, proj4string=crdref)
precipvalue <- runif(nrow(lonlat), min=0, max=100)
df <-data.frame(ID=1:nrow(lonlat), precip=precipvalue)
ptsdf <- SpatialPointsDataFrame(pts, data=df)
ptsdf
str(ptsdf)
showDefault(ptsdf)
pts


# Spatial Lines and Polygons

lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
lonlat <- cbind(lon, lat)
lns <- spLines(lonlat, crs=crdref)
lns

pols <- spPolygons(lonlat, crs=crdref)
pols

plot(pols, axes=TRUE, las=1)
plot(pols, border='blue', col='yellow', lwd=3, add=TRUE)
points(pts, col='red', pch=20, cex=3)

# 
r <- raster(ncol=10, nrow=10, xmx=-80, xmn=-150, ymn=20, ymx=60)
values(r) <- runif(ncell(r))
values(r) <- 1:ncell(r)
r
plot(r)

# add polygon and points
lon <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
lat <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
lonlat <- cbind(lon, lat)
pols <- spPolygons(lonlat, crs='+proj=longlat +datum=WGS84')
points(lonlat, col='red', pch=20, cex=3)
plot(pols, border='blue', lwd=2, add=TRUE)

