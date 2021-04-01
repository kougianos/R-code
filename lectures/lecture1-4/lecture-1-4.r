library("rstudioapi")  
setwd(dirname(getActiveDocumentContext()$path))

library(lctools) 
data(GR.Municipalities) 
inc<-GR.Municipalities$Income01 
inc.hist<-hist(inc, breaks=10, col="blue", 
               main="Income Histogram", 
               xlab="Income class", 
               ylab="Number of Municipalities") 
inc.hist 

b.plot<-boxplot( inc, col="blue", main="Income Boxplot")
b.plot

# IMPORTANT URL FOR GREEK GEODATA
# http://geodata.gov.gr/en/dataset


download.file("http://geodata.gov.gr/dataset/58c5af52-688a-4465-a466-51f319a8bcf3/resource/5af0f05f-119f-46a1-8e8d-b006159b5cd5/download/zhthshenergeiasnoikokyriwn.zip", "energy.zip")

#Αποσυμπίεση αρχείου 
unzip("energy.zip") 

#έλεγχος περιεχομένων φακέλου 
Folders <- dir() 

#έλεγχος περιεχομένων υποφακέλου 
Files <- dir(Folders[3])

install.packages("rgdal")
 install.packages("classInt ")
 library(rgdal) 
 library(classInt) 
 library(RColorBrewer) 
 library(maptools) 
 
 en.map <- readOGR("./zhthsh_energeias_noikokyriwn","zhthsh_energeias_noikokyriwn")

# ####################
 
 
