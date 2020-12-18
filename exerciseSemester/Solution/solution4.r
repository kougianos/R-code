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

# Create plot parameters
geoPosition <- df[,'Geo_Position']
plantHeight <- df[,'Plant_Height']

# Create plot
plot(geoPosition, plantHeight,
     main = "Plot of plant heights separated by geo_position" ,
     xlab="Plant Geo Position",
     ylab="Plant Height"
     )

# Add extra space for legend
par(mar=c(5.1, 4.1, 4.1, 10.1))

# Add legend
legend("topright", inset=c(-0.6,0), legend=c("1.0 = North Greece","2.0 = South Greece"), pch=c(1,1), title="Geo Position Legend")

