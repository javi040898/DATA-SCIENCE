install.packages("pastecs")
install.packages("xlsx")
install.packages("arulesViz")
library(arulesViz)
library(pastecs)
library(xlsx)
library(arules)

#Leer datos del excel
datosExcelT<-Matrix(as.matrix(read.xlsx("tecnologia.xlsx", 1)),byrow=TRUE, sparse=TRUE )
datosExcelngCMatrixT<-as(datosExcelT,"nsparseMatrix")
trspDatosExcelngCMatrixT<-t(datosExcelngCMatrixT)
trspDatosExcelngCMatrixT

#Algoritmo a priori con excel
transaccionesExcelT<-as(trspDatosExcelngCMatrixT,"transactions")
summary(transaccionesExcelT)
asociacionesExcelT<-apriori(transaccionesExcelT, parameter=list(support=0.3, confidence=0.5))
inspect(asociacionesExcelT) #Para ver el resultado


itemsetsT <- eclat(transaccionesExcelT, parameter = list(supp = 0.3, maxlen = 5))
itemsetsT

rulesT <- ruleInduction(itemsetsT, transaccionesExcelT, confidence = 0.5)
inspect(rulesT)


plot(asociacionesExcelT,method = "graph")
plot(asociacionesExcelT,method = "scatterplot")

plot(rulesT,method = "graph")
plot(rulesT,method = "scatterplot")


