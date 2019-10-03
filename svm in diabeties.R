# data importing
data<-read.csv(file.choose())
# data conversion as per the model requirement
data$Outcome<-as.factor(data$Outcome)

#data partition
library(caret)
Train <- createDataPartition(data$Outcome, p=0.7, list=FALSE)
training <- data[Train,]
testing <- data[-Train,]

# model 
library(e1071)
svm_model1 <- svm(Outcome~., data=training)
summary(svm_model1)
training$fiited<-svm_model1$fitted

#Accuracy on training data set
#table(ypred , training$outcome)
#actual values vs predicted values
confusionMatrix(svm_model1$fitted,training$Outcome)

# Accuracy on testing dataset 7783
ypred1=predict(svm_model1,testing)
#table (ypred1 , testing$Outcome)
confusionMatrix(ypred1,testing$Outcome)

# deleting column
training$fiited<- NULL

# Second model
svm_model2 <- svm(Outcome~., data=training,kernel="linear")
summary(svm_model2)

# Accuracy on training dataset
confusionMatrix(svm_model2$fitted,training$Outcome)

# ACCURACY ON TESTING dataset 7783
ypred1=predict(svm_model2,testing)
#table (ypred1,testing$Outcome)
confusionMatrix(ypred1,testing$Outcome)

