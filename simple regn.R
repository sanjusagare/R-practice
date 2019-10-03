View(faithful)
attach(faithful)     # attach the data frame
names(faithful)
str(faithful)
head(faithful,10)
# behaviour and missing value and univariate analysis
summary(faithful)
## another way missing value....
sapply(faithful, function(x) sum(is.na(x)))
### scatter plot and correlation
plot(waiting,eruptions)
plot(eruptions~waiting)
cor(faithful)
input<-faithful
### Regression model
eruption.lm = lm(eruptions ~ waiting , data= input)
summary(eruption.lm)
anova(eruption.lm)
### assumption of regression model
## below command will plot all the assumption plot in 2*2 format
par(mfrow=c(2,2))
plot(eruption.lm)

library(lmtest)
dwtest(eruption.lm)
### linearity
plot(eruption.lm)
# prediction of 80 waiting
y=-1.87402+0.07563*80
y

## JUST TO CHECK MATHEMATICALLY of linear model
input<-faithful
Probability<-data.frame(eruption.lm$fitted.values)
Residual<-data.frame(eruption.lm$residuals)
input$Fitted_value<-Probability$eruption.lm.fitted.values
input$Residual<-Residual$eruption.lm.residuals
summary(eruption.lm)
plot(eruptions~waiting)
abline(eruption.lm,col="red")

#Prediction method on entire testing dataset
newdata = data.frame(waiting=80)
predict(eruption.lm,newdata)

