### multiple regression
### mtcars data

## where are taking specific column to predict mpg car
input <- mtcars[,c("mpg","disp","hp","wt")]

# column names
names(input)

# behaviour and missing value and univariate analysis
summary(input)

## another way missing value-------
sapply(input, function(x) sum(is.na(x)))


# correlation matrix and plot(scatter plot), colinearity and multicolinarity
attach(input)
cor(input)
plot(hp,mpg)

# model building
model <- lm(mpg~disp+hp+wt, data = input)
summary(model)

# removing variable based on p value
model2<- lm(mpg~hp+wt, data = input)
summary(model2)

# assumption of model
par(mfrow=c(2,2))
plot(model2)

# prediction on test data
y=37.22727-0.03177*110-3.87783*3.435
y
