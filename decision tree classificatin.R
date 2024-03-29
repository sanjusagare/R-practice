library(tree)
## creating a dependance variable base on sales
salesdata<-read.csv(file.choose())
summary(salesdata$Sales)
salesdata$High=as.factor(ifelse(salesdata$Sales<=8,0,1))
salesdata$Sales<-NULL
data<-salesdata
rm(salesdata)
sapply(data, function(x)sum(is.na(x)))
## data partition
library(caret)
split<- createDataPartition(y=data$High, p=0.7,list = FALSE)
train <- data[split,]
test <- data[-split,]
#Building model
tree.data =tree(High~.,data=train)
plot(tree.data)
text(tree.data,pretty=0)
tree.data
tree.pred=predict (tree.data,test,type="class")
table(tree.pred ,test$High)
library(caret)
confusionMatrix(tree.pred,test$High)
#the funtion cv.tree() performs cross validation in order to
#cv.tree()
#determine the optimal level of tree complexity
#cost complexity pruning is used in order to select a
#sequence of trees for consideration
#we use the argument FUN=prune.misclass in order to indicate for
#that we want the
#classification error rate to guide the crossvalidation
#and pruning process
cv.data= cv.tree(tree.data ,FUN=prune.misclass)
names(cv.data)
plot(cv.data$size ,cv.data$dev ,type="b")
prune.data = prune.misclass (tree.data , best=12)
plot(prune.data)
text(prune.data ,pretty=0)
tree.pred=predict(prune.data,test,type="class")
table(tree.pred ,test$High)
confusionMatrix(tree.pred,test$High)


