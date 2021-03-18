# Use these 2 lines to set working directory as the current directory of the
# file. Tested on Rstudio @ Windows 10 OS.
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

library(rgdal)
epsg <- make_EPSG()
i <-grep("France", epsg$note, ignore.case=TRUE)

epsg[i[1:3], ]

###########

library(raster)
library(rgdal)
f <- system.file("external/lux.shp", package="raster")
p <- shapefile(f)
p

pp <- p
crs(pp) <- NA
crs(pp)

newcrs <- CRS("+proj=robin +datum=WGS84")

rob <- spTransform(p, newcrs)
rob

p2 <- spTransform(rob, CRS("+proj=longlat +datum=WGS84"))

###########

r <- raster(xmn=-110, xmx=-90, ymn=40, ymx=60, ncols=40, nrows=40)
r <- setValues(r, 1:ncell(r))
r
plot(r)

##########
newproj <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"
pr1 <- projectRaster(r, crs=newproj)
crs(pr1)
pr3 <- projectExtent(r, newproj)
res(pr3) <- 200000
pr3 <- projectRaster(r, pr3)
pr3
plot(pr3)

###########################################
###########################################
f <- system.file("external/lux.shp", package="raster")
library(raster)
p <- shapefile(f)
p

par(mai=c(0,0,0,0))
plot(p)

d <- data.frame(p)
head(d)

g <- geom(p)
head(g)

p$NAME_2
p[, 'NAME_2']

set.seed(0)
p$new <- sample(letters, length(p))
p

p$new <- sample(LETTERS, length(p))
p

#####
z <- raster(p, nrow=2, ncol=2, vals=1:4)
names(z) <- 'Zone'
z <- as(z, 'SpatialPolygonsDataFrame')
z
z2 <- z[2,]
plot(p)
plot(z, add=TRUE, border='blue', lwd=5)
plot(z2, add=TRUE, border='red', lwd=2, density=3, col='red')

b <- bind(p, z)
head(b)
tail(b)

pa <- aggregate(p, by='NAME_1')
za <- aggregate(z)
plot(za, col='light gray', border='light gray', lwd=5)
plot(pa, add=TRUE, col=rainbow(3), lwd=3, border='white')

zag <- aggregate(z, dissolve=FALSE)
zag
plot(zag, col="light gray")
zd <- disaggregate(zag)
zd
e <- erase(p, z2)
e <- p - z2
plot(e)
