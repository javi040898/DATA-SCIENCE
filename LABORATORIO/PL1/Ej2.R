library(foreign)

install.packages("pastecs")
install.packages("xlsx")
install.packages("modeest")

cardata<-read.spss("cardata.sav")

library(xlsx)
library(modeest)

cardata_excel<-read.xlsx("cardata.xlsx",1)

mpg=cardata$mpg

source("frecrel.R")

frecrelmpg<-frecrel(mpg)

mpg<-mpg[!is.na(mpg)]

m_mpg<-mean(mpg)
modaMpg<-mfv(mpg)

source("var_nuestra.R")
source("sd_nuestra.R")

varR<-var(mpg)
varN<-var_nuestra(mpg)

sdR<-sd(mpg)
sdN<-sd_nuestra(mpg)

mdn_mpg<-median(mpg)

q1<-quantile(mpg,0.25)
q2<-quantile(mpg,0.5)
q3<-quantile(mpg,0.75)

dec1<-quantile(mpg,0.1)
dec2<-quantile(mpg,0.2)
dec3<-quantile(mpg,0.3)
dec4<-quantile(mpg,0.4)
dec5<-quantile(mpg,0.5)
dec6<-quantile(mpg,0.6)
dec7<-quantile(mpg,0.7)
dec8<-quantile(mpg,0.8)
dec9<-quantile(mpg,0.9)

rangompg<-max(mpg)-min(mpg)

rangintercuart<-q3-q1

ranginterdecil<-dec9-dec1

mintchebychev <- m_mpg-2*sdN

maxtchebychev <- m_mpg+2*sdN

mpg_agrupado<-cut(mpg, breaks=c(0,10,20,30,40,50))
mpg_agrupado_etiqueta<-cut(mpg, breaks=c(0,10,20,30,40,50), labels = c("Consumo muy bajo", "Consumo bajo", "Consumo medio", "Consumo alto", "Consumo muy alto"))

mpg_ordenado<-mpg[order(mpg)]



plot(frecrelmpg, type="h", xlab="mpg", xlim=c(min(mintchebychev, min(unique(mpg))),max(mintchebychev, max(unique(mpg)))), main="Datos cardata (mpg)")

abline (v=c(m_mpg, mdn_mpg, mintchebychev, maxtchebychev, rangintercuart, ranginterdecil), 
          col=c("purple","yellow","green","orange", "pink", "magenta"), lty=c(2,2,2,2), lwd=c(2,2,2,2))

legend("topright", legend=c("media", "mediana", "min tchebychev", "max tchebychev", "r. intercuartilico", "r. interdecilico"), fill=c("purple","yellow","green","orange", "pink", "magenta"))




