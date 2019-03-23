# Multiple Linear Regression

setwd("C:/Users/BIO/Desktop/LeoWork/Curso_Esp_Calidad_ICESI/Clase_Datos")

# Importing the dataset

dataset = read.csv('50_Startups_c5.csv')

#Eliminar una columna
library(dplyr)
dataset <- select(dataset, -X)

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))