### mtcars data
## where are taking specific column to predict mpg car
library(car)
input <- mtcars
names(input)
cor(input)
model <- lm(mpg~.,data = input) # Dot means all columns
summary(model)
vif(model)
## removing disp based on vif value
model <- lm(mpg~.-disp, data = input) ### enter method
summary(model)
vif(model)
## removing disp and cyl based on vif value
model <- lm(mpg~.-disp-cyl, data = input) ### enter method
summary(model)
vif(model)

## doing forward and backward and stepwise regression
model1 <- lm(mpg~., data = input) ### enter method
summary(model1)
vif(model1)
## backward method
model2 <- step(lm(mpg~., data = input),direction = "backward")
summary(model2)
vif(model2)
par(mfrow=c(2,2))
plot(model2)
library(lmtest)
dwtest(model2)
ncvTest(model2)
## stepwise method
model3 <- step(lm(mpg~., data = input),direction = "both")
summary(model3)
vif(model3)
# forward method
model4 <- step(lm(mpg~.,data = input),direction = "forward")
summary(model4)
vif(model4)

