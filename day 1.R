##Variable Assignment
# = or <- means assign
x=1
x
###Function and c is combining values into a vector or list
c(1,2,3)
a=c(1,2,3)
##comment
1 + 1     # this is a comment


##to understand what is c function
help(c)
##If you are not sure about the name of the function you are looking
#you can perform a fuzzy search with the apropos function.
apropos("nova")

Type of Data in r
1)numeric
2)integer
3)Complex
4)logical
5)character

##Numeric
x = 10.5      #assign a decimal value
 x            # print the value of x
[1] 10.5
 ###To check the class of x
 class(x)     # print the class name of x, class fn helps to identify datatype
 [1] "numeric"
 
 k=1
  k           #print the value of k
  [1] 1
  class(k)    #print the class name of k
  [1] "numeric"
  
  
  ###to CONFIRM whether it is integer or not
   is.integer(k)   # is k an integer?
   
   
   ### integer
   # In order to create an integer variable in R,
   #we invoke the as.integer function.we can be assured that
   #y is indeed an integer by applying the is.integer function.
   
   y = as.integer(3)
   y           
   [1] 3
   
   class(y)
   [1] "integer"
   is.integer(y)
   
   
   
   
as.integer(3.14)


z= 1 + 2i
z
[1] 1+2i
class(z)
[1] "complex"



x = 1; y = 2
z = x>y
z
[1] FALSE
class(z)
[1] "logical"

u = TRUE; v = FALSE
u & v
[1] FALSE
u | v
[1] TRUE
!u
[1] FALSE



x = as.character(3.14)
x
[1] "3.14"
class(x)
[1] "character"


fname= "Joe" ; lname = "Smith"
paste(fname,lname)
[1] "Joe Smith"





substr("Mary has a little lamb.", start=3, stop=12)
[1] "ry has a l"




sub("little","big","Mary has a little lamb.")
[1] "Mary has a big lamb."



a = c(1,3,5,7)
b = c(1,2,4,8)
a+b
a-b
a*b
a/b
a>b
a<b
a==b      
a<=b
a>=b


u= c(10,20,30)
v= c(1,2,3,4,5,6,7,8,9)
u+v


s= c("aa","bb","cc","dd","ee")
s[3]

s[-3]
##out-of-Range Index
#If an index is out-of-range, a missing
#value will be reported via the symbol NA.

s[10]

##Numeric Index Vector
s = c("aa","bb","cc","dd","ee")
s[c(2,3)]

# Duplicate
s[c(2,3,3)]
[1] "bb" "cc""cc"




