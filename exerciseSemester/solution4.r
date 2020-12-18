# Author: Nikos Kougianos
# Date: 18/12/2020

# Use these 2 lines to set working directory as the current directory of the
# file. Tested on Rstudio @ Windows 10 OS.
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir);

# Read data
data <- read.table("data.csv", sep=",", header=TRUE)

data$column1 # get column1
data[1,] # get first row all columns
data[1,2] # get first row second column

newData = subset(data, column1==1213) # subset

