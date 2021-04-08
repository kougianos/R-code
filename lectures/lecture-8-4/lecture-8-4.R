library(maps)         ## Projections
library(maptools)     ## Data management
library(sp)           ## Data management
library(spdep)        ## Spatial autocorrelation
library(gstat)        ## Geostatistics
library(splancs)      ## Kernel Density
library(spatstat)     ## Geostatistics
library(RColorBrewer) ## Visualization
library(classInt)     ## Class intervals
library(spgwr)        ## GWR

library("rstudioapi")  
setwd(dirname(getActiveDocumentContext()$path))

url <- url("http://www.people.fas.harvard.edu/~zhukov/Datasets.RData")
load(url)
save(laos,crime,cities,volcano,election,dat88,mat88,file="Datasets.RData")

m <- matrix(c(0,0,1,1), 
            ncol = 2,
            dimnames = list(NULL, c("min", "max")))
crs <- CRS(projargs = as.character(NA))
crs


S <- Spatial(bbox = m, proj4string = crs)
S