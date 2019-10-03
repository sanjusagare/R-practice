# sorting examples using the mtcars dataset
data()
mtcars<-mtcars
names(mtcars)
View(mtcars)
#it is used to fixed dataset
mpg
attach(mtcars)
mpg
#data visual
head(mtcars)
head(mtcars,10)
tail(mtcars)
summary(mtcars)
boxplot(mtcars)
boxplot(mtcars$hp)
summary(mpg)
summary(mtcars$mpg)
# sort by mpg
newdata <- mtcars[order(mpg),]  #doubt

#sort by mpg and cyl
newdata <- mtcars[order(mpg,cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(-mpg),]
detach(mtcars)
detach(mtcars)
#subsetting Data
myvars <- c("mpg","cyl","disp")
newdata1 <- mtcars[myvars]

newdata2 <- mtcars[c(1,5:10)]
## Dropping variable
# Excluding (DROPPING) variables

# delete one variables
newdata$mpg <-NULL
newdata<-mtcars
# exclude 3rd and 5th variable
newdata1 <- newdata[c(-3,-5)]
# using subset function
newdata2 <- subset(mtcars, mpg >=20 & wt< 10,
     select=c(gear , qsec))
     