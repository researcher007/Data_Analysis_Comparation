# Multiple Linear Regression

setwd("C:/Users/BIO/Desktop/LeoWork/Curso/Clase_Regresion/2_Regresion_Multiple")
# Importing the dataset

dataset = read.csv('50_Startups.csv')

colnames(dataset)[colnames(dataset)=="R.D.Spend"] <- "Q.Spend"

write.csv(dataset, "50_Startups_c5.csv")