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

#Descriptive Statistics
summary(dataset)
#Correlation
pairs(dataset)

# Using Pairs
pairs(dataset, labels = colnames(dataset), main = "Pairs matrix", 
      pch = 21, bg = c("red", "blue", 
                       "yellow")[unclass(dataset$State)], 
      upper.panel = NULL)

#Many ways
dataset_draff <- dataset
# Or 
#dataset_draff = dataset[, c("Quality.Spend", "Administration", "Marketing.Spend", "Profit")]
#Drop variable
dataset_draff <- select(dataset_draff, -State)
#Correlation
pairs(dataset_draff)
# Using Pairs
pairs(dataset_draff, labels = colnames(dataset_draff), main = "Pairs matrix", pch = 21,
      bg = c("red", "blue", "yellow")[unclass(dataset$State)], upper.panel = NULL)

