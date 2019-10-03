## data importing
data1<-read.csv(file.choose())

data2<-read.csv(file="C:/Users/ROHAN/Desktop/multipl reg/Book1.csv",header = TRUE)

# 4 methods done for importing csv file
dta3<-read.csv("mydata.csv")

## data export into csv
data<-faithful
write.csv(data, file = "C:/Users/ROHAN/Desktop/multipl reg/Book3.csv")
