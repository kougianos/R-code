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
data[2,c(1,3)] #get second line and first and third column

newData = subset(data, column1==1213) # subset

boxplot <- boxplot(data[1,]) # boxplot
piechart <- pie(as.numeric(data[1,])) #pie chart
histogram <- hist(data$column2) #histogram

data[2,c(1,3)]
