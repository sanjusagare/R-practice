# insurance data imported
data <-read.csv(file.choose())

# Removing the irrelavent variable

data$region<-NULL
 
# CHECKINIG THE DATATYPE
names(data)
str(data)

# count of level in a variable
table(data$smoker)
table(data$sex)

# converting converting data to numeric
data$smoker_flag <- ifelse(data$smoker=='yes',1,2)
data$sex_flag<- ifelse(data$sex=='male',1,2)

# Data conversion
data$age<- as.numeric(data$age)
data$children<-as.numeric(data$children)
data$smoker_flag<- as.numeric(data$smoker_flag)
data$sex_flag<- as.numeric(data$sex_flag)
data$Month<-as.numeric(data$Month)

#checking the datatype
str(data)

# to identify outlier
boxplot(data$age)
boxplot(data$bmi)
boxplot(data$children)
boxplot(data$charges)
boxplot(data$Month)

# treatment of outlier for bmi
summary(data$bmi)
upper<-34.69+1.5*IQR(data$bmi);upper
data$bmi[data$bmi>upper]<-upper
boxplot(data$bmi)
summary(data$bmi)

# treatment of outleir for charges
summary(data$charges)
upper<-16640+1.5*IQR(data$charges);upper
data$charges[data$charges>upper]<-upper
boxplot(data$charges)
summary(data$charges)

# data subset
abc<-data[,-c(2,5)]

# data partition
library(caret)
Train <- createDataPartition(abc$charges, p=0.70,list= FALSE)

training <- abc[ Train, ]
testing <- abc[ -Train, ]

# model building and may leads to overfitting
cor(training)
model <-lm(charges~.,data = training)
summary(model)

# identifying  the solution to overfitting with the help of transformation
hist(training$charges)
hist((1/training$charges))
hist(log(training$charges))

# model 2
model2 <- step(lm(log(charges)~.,data = training),direction = "backward")
summary(model2)

#collinearity or multicollinearity
library(car)
vif(model2)

# ASSUMPTION OF LINEAR REGRESSION

par(mfrow=c(2,2))
plot(model2)

#model error assumption
library(lmtest)
dwtest(model2)

# constant variance assumption in term of numerica method
ncvTest(model2)

# PREDICTION
testing$fitted<-predict(model2,testing)

# transforming log values to real value
testing$Original<-exp(testing$fitted)
 

