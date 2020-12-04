# Author: Nikos Kougianos
# Date: 4/12/2020

# Use these 2 lines to set working directory as the current directory of the
# file. Tested on Rstudio @ Windows 10 OS.
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir);

# Read data
data <- read.table("iqdata.txt", sep=" ")

# Create one dataframe with non depressed mothers ->scorend
# and another one with depressed mothers
scorend <- subset(data, V1=="nd")
scored <- subset(data, V1=="d")