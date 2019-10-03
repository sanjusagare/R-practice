Age<-c(56,34,67,33,25,28)
Weight<-c(78,67,56,44,56,89)
Height<-c(165,171,167,167,166,181)

BMI_df<-data.frame(Age,Weight,Height)
BMI_df
# row wise sum up of dataframe using apply fn in r,for summarizing data
apply(BMI_df,1,sum)
# column wise sum up of dataframe using apply fn in r
apply(BMI_df,2,sum)
# column wise mean of dataframe using apply fn in r
apply(BMI_df,2,mean)

#lapply fn in R:
#lapply fn takes list, vector or dataframe as input and returns on
#returns only list as output.
lapply(BMI_df, mean)

# sapply fn in r  column
sapply(BMI_df,mean)

#tapply():
#tapply() is a very powerful fn that lets you break a vector into pieces
#and then apply some fn to each of the pieces
str(mtcars$cyl)
levels(as.factor(mtcars$cyl))
tapply(mtcars$mpg,mtcars$cyl,mean)

