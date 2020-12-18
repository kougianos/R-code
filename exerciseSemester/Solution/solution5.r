# Author: Nikos Kougianos
# Date: 18/12/2020

# Use these 2 lines to set working directory as the current directory of the
# file. Tested on Rstudio @ Windows 10 OS.
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir);

# Read data
data <- read.table("data.csv", sep=",",header=TRUE)

# Create dataframe with 2 columns instead of 4
df <- data.frame('Plant_Height'=c(data$Plant.Height,data$Plant.Height.1), 'Geo_Position'=c(data$Geo.Position,data$Geo.Position.1))

# Subset dataframe, extract height plants where plant is from North
plantsNorth <- df$Plant_Height[df$Geo_Position==1]
# Subset dataframe, extract height plants where plant is from South
plantsSouth <- df$Plant_Height[df$Geo_Position==2]

# Calculate median of heights of North plants
medianNorth <- median(plantsNorth)

# Calculate median of heights of South plants
medianSouth <- median(plantsSouth)