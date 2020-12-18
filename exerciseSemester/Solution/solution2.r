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

# Create frequency histogram
frequency_histogram <- hist(df$Plant_Height, xlab="Plant height", main = "Frequency histogram of plant height")

# Create relative frequency histogram
relative_frequency_histogram <- hist(df$Plant_Height, freq=FALSE, xlab="Plant height", main = "Relative Frequency histogram of plant height")

