# Simple Linear Regression
setwd("C:/Users/BIO/Desktop/Data_Analysis_Comparation/Clase_Regresion/1_Regresion_Simple")



# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Simple Linear Regression to the Training set
R_lineal = lm(formula = Salary ~ YearsExperience,
               data = training_set)
R_lineal
#Info
summary(R_lineal)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(R_lineal, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualising the Test set results
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(R_lineal, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of experience') +
  ylab('Salary')

#Residuals
par(mfrow = c(1,1))
residuals_rlin <- rstandard(R_lineal)
adjusted_values_rlin <- fitted(R_lineal)
plot(adjusted_values_rlin, residuals_rlin)

#Revisar normalidad de los errores
qqnorm(residuals_rlin)
qqline(residuals_rlin)

#Normality test Kolmogorov-Smirnov
ks.test(x = residuals_rlin,"pnorm", mean(residuals_rlin), sd(residuals_rlin))
#Normality test Kolmogorov-Smirnov modification test Lilliefors
library("nortest")
lillie.test(x = residuals_rlin)
#Jarque Bera Test
library("tseries")
jarque.bera.test(x = residuals_rlin)