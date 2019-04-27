#Set wd
setwd("C:/Users/BIO/Desktop/Data_Analysis_Comparation/Clase_Datos")

# Importing the dataset
dataset = read.csv('Data_des_sta.csv')

#Drop variable
library(dplyr)
dataset <- select(dataset, -X)

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

#Histogram
#Hist freq
hist(dataset$Profit)
#Hist density
hist(dataset$Profit,freq=FALSE, col="chartreuse")
#Addm title
hist(dataset$Profit,freq=FALSE, col="chartreuse", main="Histogram of profit", xlab="")

lines(density(dataset$Profit),col="red",lwd=2)

curve(dnorm(x,mean=mean(dataset$Profit),sd=sd(dataset$Profit)), from=0,to=200000, 
      add=TRUE, col="blue", lwd=2)

legend("topleft",col=c("blue","red"),legend =c("Estimated normal density","Density core estimator"),lwd=2, bty = "n")

#Comparison
plot(density(dataset$Administration), xlim = c(0, 250000), col = "blue", main="Comparison")
lines(density(dataset$Quality.Spend), col = "red")