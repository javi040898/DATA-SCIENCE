install.packages("pastecs")
install.packages("xlsx")
install.packages("arulesViz")

library(arulesViz)
library(pastecs)
library(xlsx)
library(arules)

#Leer datos del excel
datosExcel<-Matrix(as.matrix(read.xlsx("ropa.xlsx", 1)),byrow=TRUE, sparse=TRUE )
datosExcelngCMatrix<-as(datosExcel,"nsparseMatrix")
trspDatosExcelngCMatrix<-t(datosExcelngCMatrix)

#Algoritmo a priori con excel
transaccionesExcel<-as(trspDatosExcelngCMatrix,"transactions")
summary(transaccionesExcel)
asociacionesExcel<-apriori(transaccionesExcel, parameter=list(support=0.5, confidence=0.8))
inspect(asociacionesExcel) #Para ver el resultado

#Leer datos de txt
datostxt<-Matrix(as.matrix(read.table("ropa.txt")),byrow=TRUE, sparse=TRUE )
datosTxtngCMatrix<-as(datostxt,"nsparseMatrix")
trspDatosTxtngCMatrix<-t(datosTxtngCMatrix)

#Algoritmo a priori con txt
transaccionesTxt<-as(trspDatosTxtngCMatrix,"transactions")
summary(transaccionesTxt)
asociacionesTxt<-apriori(transaccionesTxt, parameter=list(support=0.4, confidence=0.7))
inspect(asociacionesTxt) #Para ver el resultado


itemsets <- eclat(transaccionesExcel,
		parameter = list(supp = 0.5, maxlen = 5))

## Create rules from the itemsets
rules <- ruleInduction(itemsets, transaccionesExcel, confidence = 0.8)
inspect(rules)


plot(asociacionesTxt,method = "graph")
plot(asociacionesTxt,method = "scatterplot"))

plot(rules,method = "graph")
plot(rules,method = "scatterplot")






