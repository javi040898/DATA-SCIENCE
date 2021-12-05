install.packages("LearnClust")
library(LearnClust)

m<-matrix(c(4,4, 3,5, 1,2, 5,5, 0,1, 2,2, 4,5, 2,1),2,8)
agglomerativeHC(m,'EUC','MAX')
agglomerativeHC.details(m,'EUC','MAX')

lst<-toList(m)
m

x <- c(1,2)
y <- c(1,3)
octileDistance(x,y)
canberradistance(x,y)
