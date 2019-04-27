# Organice Setwd
setwd("C:/Users/BIO/Desktop/Data_Analysis_Comparation/Clase_Datos")
# Importing the dataset

#Hay que traer a la misma carpeta el documento original
dataset = read.csv('Data_raw.csv')

#Install dplyr
library(dplyr)
#Borrar una columna
dataset <- select(dataset, -X)

colnames(dataset)[colnames(dataset)=="Q.Spend"] <- "Quality.Spend"

write.csv(dataset, "Data_des_sta.csv")