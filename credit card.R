Credit<-read.csv("C:/Users/ROHAN/Desktop/multipl reg/Credit_Card.csv")
View(Credit)
str(Credit)
names(Credit)
attach(Credit)
Credit$target_30<-as.factor(ifelse(Credit$DPD>30,1,0))
Credit$target_60<-as.factor(ifelse(Credit$DPD>60,1,0))
Credit$target_90<-as.factor(ifelse(Credit$DPD>90,1,0))
table(Credit$target_30) # to count good and bad
4922/10000

table(Credit$target_60)
333/10000

table(Credit$target_90)
162/10000

Credit<-Credit[-c(4,5,7)]
## simple logistics regression
logit <- glm(target_60 ~ balance,data = Credit,family = 'binomial')
summary(logit)
anova(logit,test='Chisq')
### prediction try with 2000
testing<-data.frame(balance=2000)
testing.probs <-predict(logit, testing, type='response')
testing.probs


### different way
## simple logistics regression

library(caret)
Train <- createDataPartition(Credit$target_60, p=0.7, list = FALSE)
training <- Credit[ Train, ]
testing <- Credit[ -Train, ]
logit <- glm(target_60 ~ balance, data=training, family='binomial')
summary(logit)
#concordance and discordance
Acc(logit)


# prediction
testing$probs <-predict(logit, testing, type='response')
testing$Predict<-as.factor(ifelse(testing$probs>0.70,1,0))
table(testing$Predict, testing$target_60)
library(e1071)
confusionMatrix(testing$Predict, testing$target_60)
### ROC CURVE
library(ROCR)
# MAKE PREDICTION ON TESTING SET
predictTrain = predict(logit,testing, type="response")
# prediction function
ROCRpred = prediction(predictTrain, testing$target_60)
# performance function
ROCRperf = performance(ROCRpred, "tpr","fpr")
# plot ROC curve
plot(ROCRperf)
library(ROCR)
pred = prediction(testing$probs, testing$target_60)
as.numeric(performance(pred, "auc")@y.values)

#create a new dummy variable for gender
Credit<-read.csv("C:/Users/ROHAN/Desktop/multipl reg/Credit_Card.csv")
Credit$target_60<-as.factor(ifelse(Credit$DPD>60,1,0))
Credit$Dummy<-as.factor(ifelse(Credit$Gender=='M',1,0))
Credit$DPD<-NULL
Credit$Gender<-NULL

##MULTIPLE LOGISTIC REGRESSION
library(caret)
Train <- createDataPartition(Credit$target_60, p=0.7, list= FALSE)
training <- Credit[ Train, ]
testing <- Credit[ -Train, ]
logit <- glm(target_60 ~ income+balance+Dummy,family ='binomial',data =training)
summary(logit)


#model including alll variable
logit2 <- step(glm(target_60 ~ income+balance+Dummy,family ='binomial',
                   data = training),direction = "both")
summary(logit2)
anova(logit2,test='Chisq')

# accuracy of model
Acc(logit2)

#concordance test (second method)
#library(InformationValue)
#library(caret)
#Concordance(training$target_60,logit2$fitted.values)

# odds ratio applicable for categorical data
exp(coef(logit2))
logit2$coefficient
# males have higher chances to get default as females 1.9 times
#mathematical calculation check manually
y=-11.473478629+0.005758201*825.5133+0.643398130*1
a<-exp(-y)
b<-1+a
c<-1/b
c

y=-10.673006590+0.005316505*2343.786+0.580975737*0
a<-exp(-y)
b<-1+a
c<-1/b
c

## prediction
testing$probs <-predict(logit2, testing, type='response')
testing$Predict<-as.factor(ifelse(testing$probs>0.70,1,0))

# accuracy of testing data
table(testing$Predict, testing$target_60)
confusionMatrix(testing$target_60,testing$Predict)

# concordance(testing$target_60,testing$probs)

##ROC CURVE
library(ROCR)
#MAKE predictions on training set
predictTrain = predict(logit2,testing, type="response")
# prediction functin
ROCRpred = prediction(predictTrain, testing$target_60)
# performance fn
ROCRperf = performance(ROCRpred,"tpr","fpr")
# plot ROC curve
plot(ROCRperf)
library(ROCR)
pred = prediction(testing$probs, testing$target_60)
as.numeric(performance(pred,"auc")@y.values)


