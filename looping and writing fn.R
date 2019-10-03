## if and if else statement
x=7
if(x<10){
  x<-x+1
  cat("decrease")
} else {
  x<-x-1
  cat("increase")
}

## for loop
# it is used when iteration is required through a list
# for numeric vector
for(i in (1:10)-3){
  print(c(i,i*i))
}
## for character vector
car<-c("hyundai","tata","honda")
for(j in car){
  print(paste(j,"ALLvariats"))
}
## while loop
# it is used when iteration is required
# as long as a specific condition is met#
i<-2.999
while (i<=4.999) {
  i<-i+0.999
  print(c(i,i-2,i*i))}

##repeat loop
## the repeat loop is an infinite loop and used in
#association with a break statement

a<-1
repeat{
  print(a)
  a<-a+1
  if(a>3)
    break
}

## a break statement is used in a loop to stop
# the iteration and flow the control outside
# of the loop

x<-1:10
for(i in x){
  if (i==2){
    break
  }
  print(i)
}

## next statement
##its enable to skip the current iteration
# of a loop without terminating
x<-1:4
for(i in x){
  if (i==2){
    next
  }
  print(i)
}
## writing fn , sep is for removing space

addingpercent<-function(x){percent<-round(x*100,digits = 2)
output<-paste(percent,"%",sep="")
return(output)
}
x<-c(0.678,2.99999,0.7678,0.3343)
addingpercent(x)




