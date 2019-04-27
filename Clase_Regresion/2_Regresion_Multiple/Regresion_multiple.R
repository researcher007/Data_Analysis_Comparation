# Multiple Linear Regression

setwd("C:/Users/BIO/Desktop/Data_Analysis_Comparation/Clase_Regresion/2_Regresion_Multiple")

# Importing the dataset

dataset = read.csv('Data_Mul_Reg.csv')

#Eliminar una columna
library(dplyr)
dataset <- select(dataset, -X)

#Rename variables
colnames(dataset)[colnames(dataset)=="Q.Spend"] <- "Quality.Spend"

# Encoding categorical data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,
               data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

summary(regressor)

# Plot the actual points
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(regressor)
# Plot the actual points
layout(matrix(c(1),1,1)) # optional 1 graphs/page 

#Prediction vs actual behavior
plot(predict(regressor),training_set$Profit,
     col = "blue", pch=1,
     xlab="Prediction",ylab="Real", main="Prediction vs actual behavior")
abline(a=0,b=1, col=153, lty=5)

#Predict residuals
residuals<-rstandard(regressor)
hist(residuals) 
boxplot(residuals, boxwex = 0.5, col = c("blue", "red"),
        main = "Box",
        xlab = "Error", ylab = "length",
        sep = ":", lex.order = TRUE, ylim = c(-3, 3), yaxs = "i")

#Residuals
par(mfrow = c(1,1))
adjusted_values_rmul <- fitted(regressor)
plot(adjusted_values_rmul, residuals)

#Normality test Kolmogorov-Smirnov
ks.test(x = residuals,"pnorm", mean(residuals), sd(residuals))
#Normality test Kolmogorov-Smirnov modification test Lilliefors
library("nortest")
lillie.test(x = residuals)
#Jarque Bera Test
library("tseries")
jarque.bera.test(x = residuals)