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

scorend <- data$V2[data$V1=="nd"]
scored <- data$V2[data$V1=="d"]
boxplot(scorend, scored, names=c("Non-depressed mothers","Depressed mothers"))
par(mfrow=c(2,1))
hist(scorend, xlab="IQ of children from Non-depressed mothers")
hist(scored, xlab="IQ of children from depressed mothers")
qqnorm(scorend,main="")
qqline(scorend)
title(main="Normal Probability plot for IQ of children from Non-depressed mothers")
qqnorm(scored,main="")
qqline(scored)
title(main="Normal Probability plot for IQ of children from depressed mothers")