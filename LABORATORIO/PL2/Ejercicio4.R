install.packages("pastecs")
install.packages("xlsx")
install.packages("arulesViz")

library(arulesViz)
library(pastecs)
library(xlsx)
library(arules)

#Leer datos del excel
datosExcelP<-Matrix(as.matrix(read.xlsx("papeleria.xlsx", 1)),byrow=TRUE, sparse=TRUE )
datosExcelngCMatrixP<-as(datosExcelP,"nsparseMatrix")
trspDatosExcelngCMatrixP<-t(datosExcelngCMatrixP)
trspDatosExcelngCMatrixP

#Algoritmo a priori con excel
transaccionesExcelP<-as(trspDatosExcelngCMatrixP,"transactions")
summary(transaccionesExcelP)
asociacionesExcelP<-apriori(transaccionesExcelP, parameter=list(support=0.5, confidence=0.8))
inspect(asociacionesExcelP) #Para ver el resultado



itemsetsP <- eclat(transaccionesExcelP,
		parameter = list(supp = 0.5, maxlen = 5))

## Create rules from the itemsets
rulesP <- ruleInduction(itemsetsP, transaccionesExcelP, confidence = 0.8)
inspect(rulesP)

plot(asociacionesExcelP,method = "graph")
plot(asociacionesExcelP,method = "scatterplot")

plot(rulesP,method = "graph")
plot(rulesP,method = "scatterplot")

Sweave("Memoria.Rnw")
tools::texi2pdf("Memoria.tex")



