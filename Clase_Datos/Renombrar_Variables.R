# Multiple Linear Regression

setwd("C:/Users/BIO/Desktop/LeoWork/Curso_Esp_Calidad_ICESI/Clase_Datos")
# Importing the dataset

#Hay que traer a la misma carpeta el documento original
dataset = read.csv('50_Startups.csv')

colnames(dataset)[colnames(dataset)=="R.D.Spend"] <- "Q.Spend"

write.csv(dataset, "50_Startups_c5.csv")