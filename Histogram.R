rm(list = ls()) #Clears environment

setwd("C:/College materials/Softwares/R software/Datasets") #Set corresponding dir
dataset=read.csv("Data.csv",header=T)

dataset$Age=ifelse(is.na(dataset$Age),ave(dataset$Age,FUN=function(x)
    mean(x,na.rm = TRUE)),dataset$Age) #to fill empty cell in age

dataset$Salary=ifelse(is.na(dataset$Salary),ave(dataset$Salary,FUN=function(x)
    mean(x,na.rm = TRUE)),dataset$Salary) #to fill empty cell in salary

dataset$Country=factor(dataset$Country,
    levels = c('France','Spain','Germany'),labels=c(1,2,3)) #categorical values for country

dataset$Purchased=factor(dataset$Purchased,
    levels = c('No','Yes'),labels=c(0,1)) #categorical values for purchased

#install.packages("caTools") #If caTools package not installed
library(caTools) 

set.seed(70) #To lock the code
split=sample.split(dataset$Purchased,SplitRatio=0.8)
training_set=subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

training_set[,c(2,3)]=scale(training_set[,c(2:3)]) #Feature Scaling
test_set[,c(2,3)]=scale(test_set[,c(2:3)])


#Results
training_set
test_set



