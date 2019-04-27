#Set wd
setwd("C:/Users/BIO/Desktop/Data_Analysis_Comparation/Clase_Datos")

# Import csv
dataset = read.csv('Data_Missing.csv')

#Add the average 
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)