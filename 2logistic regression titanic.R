train<-read.csv(file.choose())
names(train)
str(train)

##pclass from into categorical variable
train$pclass<-as.factor(train$pclass)
train$survived<-as.factor(train$survived)
train$sibsp<-as.numeric(train$sibsp)
train$parch<-as.numeric(train$parch)
str(train)

#missing value and univariate anaylsis
summary(train)
sapply(train, function(x) sum(is.na(x)))

#fill in missing value of age
train$age[is.na(train$age)]=mean(train$age,na.rm = TRUE)
names(train)

#missing values

sapply(train, function(x) sum(is.na(x)))


#treatment of outlier for fare ,it is for numeric
boxplot(train$fare)
summary(train$fare)
upper<-31+1.5*IQR(train$fare);upper
train$fare[train$fare>upper]<-upper



boxplot(train$fare)
summary(train$fare)



#treatment of outlier of age
boxplot(train$age)
summary(train$age)
upper<-34+1.5*IQR(train$age);upper
train$age[train$age>upper]<-upper
lower<-22.00-1.5*IQR(train$age);lower
train$age[train$age<lower]<-lower
boxplot(train$age)
summary(train$age)
##multiple logistic regression
data<-train[-3]
library(caret)
  partition<-createDataPartition(data$survived,p=0.7,list = FALSE)
training<-data[partition,]
test1<-data[-partition,]

#model building
model = glm(survived~., family = 'binomial',data = training)
summary(model)


rig.model=glm(survived~.,family = 'binomial',data = training)
summary(rig.model)


#way of giving own refrence
table(training$pclass)
table(training$sex)
table(training$embarked)

#model building

rig.model1=step(glm(survived~relevel(pclass,ref=2)
                   +relevel(sex,ref = 'female')
                   +relevel(embarked,ref = 'Q')
                   +age+fare+sibsp+parch,
                   family = 'binomial',data = training),direction = "both")
summary(rig.model1)

Acc(rig.model1)

#tocheck multi colinearity
library(car)
vif(rig.model1)

#to get odds ratio
exp(coef(rig.model1))

##prediction 
test1$prob <-predict(rig.model1,test1,type='response')
test1$Predict<-as.factor(ifelse(test1$prob>0.70,1,0))
table(test1$survived,test1$Predict)

confusionMatrix(test1$survived,test1$Predict)

library(ROCR)
library(ggplot2)
#make prediction ontest set
predictTrain=predict(rig.model1,test1,type='response')
#prediction function 
ROCRpred=prediction(predictTrain,test1$survived)
#performance finction is to fetch
ROCRperf=performance(ROCRpred,'tpr','fpr')
#plotting roc curve
plot(ROCRperf)
#add colour
plot(ROCRperf,colorize='TRUE')
#auc

pred=prediction(test1$prob,test1$survived)
as.numeric(performance(pred,"auc")@y.values)


                                  