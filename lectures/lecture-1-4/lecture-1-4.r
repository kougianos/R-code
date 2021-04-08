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
 library(lctools)
 data(GR.Municipalities)
 mydata<-GR.Municipalities
 
 #δημιουργία πλαισίου δεδομένων για ταυτόχρονη δημιουργία θηκογραμμάτων
 df<-data.frame(Male.Unempl.Rate= mydata$UnemrM01, Female.Unempl.Rate= mydata$UnemrF01)
 
 # δημιουργία θηκογραμμάτων και αποθήκευση των δεδομένων στο αντικείμενο b.plot
 b.plot<-boxplot(df, col="orange", main="Unemployment Boxplot")
 
 
 # εξαγωγή έκτροπων παρατηρήσεων και το φύλο που αφορούν
 outliers<-cbind(out=b.plot$out,sex=b.plot$group)
 
 #υπολογισμός ορίου από το οποίο και πάνω μια παρατήρηση θεωρείται έκτροπη, κατά φύλο
 out.limits <- aggregate(out ~ sex, data=outliers, min)
 
 #εξαγωγή έκτροπων παρατηρήσεων από τη βάση για τους άνδρες
 m.outliers<-mydata@data[which(mydata$UnemrM01>=out.limits$out[1]),]
 
 #προβολή α/α, ονόματος και ποσοστού ανεργίας ανδρών έκτροπων παρατηρήσεων
 m.outliers[,c(4,9)]
 
 #εξαγωγή εγγραφών από τη βάση που είναι έκτροπες παρατηρήσεις
 #για τις γυναίκες
 f.outliers<-mydata@data[which(mydata$UnemrF01>=out.limits$out[2]),]
 
 #προβολή α/α, ονόματος και ποσοστού ανεργίας γυναικών
 #έκτροπων παρατηρήσεων
 f.outliers[,c(4,10)]
 
 
