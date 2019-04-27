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