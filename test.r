hs <- c(130, 132, 139, 136, 131, 153, 133, 129, 133, 119, 132, 135, 132, 134, 130, 135, 130, 136, 134, 137)
ws <- c(35, 41, 38, 41, 43, 51, 40.5, 38.5, 36, 39, 40, 37, 40, 43, 38, 30, 42.5, 36, 38, 40)

hist(hs, breaks=50, col=5, xlab='Ύψος (cm)', ylab='Συχνότητα')
abline(b=90,v=mean(hs), col=2, lwd=3) #Add vertical line in plot

boxplot(ws, horizontal=T, xlab=c('weight (kg)'))

plot(ws, hs, col=4, xlab='Βάρος (kg)', ylab='Ύψος (cm)')

abline(b=90,h=mean(hs), col=2, lwd=3) #Add vertical line in plot
abline(b=90,v=mean(ws), col=2, lwd=3) #Add vertical line in plot

############################################################################################################

x<-rnorm(20)

wmean<-function(x)
{
    m<-mean(x)
    s<-sd(x)
    
    w1<-rep(1,length(x))
    
    w2<-NULL
    
    for (i in 1:length(x))
    {
        if (abs((x[i]-m)/s)<1) w2[i]<-1
        else if(1<=abs((x[i]-m)/s) &  abs((x[i]-m)/s)<2) w2[i]<-0.5
        else if(2<=abs((x[i]-m)/s)) w2[i]<-0
    }
    
    w3<-dnorm(x,m,s)
    
    newm1<-sum(w1*x)/sum(w1)
    newm2<-sum(w2*x)/sum(w2)
    newm3<-sum(w3*x)/sum(w3)
    
    return(list(weighted_mean1=newm1,weighted_mean2=newm2,weighted_mean3=newm3))
}

############################################################################################################

iqdata<-read.table("iqdata.txt")
attach(iqdata)
scorend <- iqdata$V2[V1=="nd"]
scored <- iqdata$V2[V1=="d"]
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
