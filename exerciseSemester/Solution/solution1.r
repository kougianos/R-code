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

# Calculate mean, median, and standard deviation of plant heights
mean <- mean(df$Plant_Height)
median <- median(df$Plant_Height)
sd <- sd(df$Plant_Height)

# Calculate quantiles
quantiles <- quantile(df$Plant_Height)

# Calculate first quantile
quantile1 <- quantiles[2]

# Calculate third quantile
quantile3 <- quantiles[4]
