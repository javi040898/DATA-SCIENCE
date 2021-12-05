
install.packages("pastecs")
install.packages("xlsx")
install.packages("modeest")

s<-read.table("satelites.txt")

library(xlsx)
library(modeest)

s_excel<-read.xlsx("satelites.xlsx",1)



radio=s$Radio

frecabsradio<-table(radio)

frecabsacumradio<-cumsum(frecabsradio)

frecrel<-function(x){table(x)/length(x)}

frecrelradio<-frecrel(radio)


dump("frecrel",file="frecrel.R");
source("frecrel.R")

frecrelacumradio<-cumsum(frecrelradio)

mr<-mean(radio)

modar<-mfv(radio)

sdr<-sd(radio)

varr<-var(radio)

sd_nuestra=function(x){sqrt((sd(x)^2)*(length(x)-1)/length(x))}

dump("sd_nuestra",file="sd_nuestra.R");
source("sd_nuestra.R")

var_nuestra=function(x){sd_nuestra(x)^2}

dump("var_nuestra",file="var_nuestra.R");
source("var_nuestra.R")

sdn<-sd_nuestra(radio)

varn<-var_nuestra(radio)

medianr<-median(radio)

cuar1r<-quantile(radio,0.25) 

cuar2r<-quantile(radio,0.5) 

cuar3r<-quantile(radio,0.75) 

cuan54<-quantile(radio,0.54)

dec1<-quantile(radio,0.1)

dec2<-quantile(radio,0.2)

dec3<-quantile(radio,0.3)

dec4<-quantile(radio,0.4)

dec5<-quantile(radio,0.5)

dec6<-quantile(radio,0.6)

dec7<-quantile(radio,0.7)

dec8<-quantile(radio,0.8)

dec9<-quantile(radio,0.9)

rangintercuart<-cuar3r-cuar1r

ranginterdecil<-dec9-dec1

rangor<-max(radio)-min(radio)

so<-s[order(radio),]

soi<-s[rev(order(radio)),]

radio_ordenado<-radio[order(radio)]

radio_ordenadorev<-radio[rev(order(radio))]

radio_agrupado<-cut(radio, breaks = c(0,10,20,30,40,50))


radio_agrupado_etiqueta<-cut(radio, breaks = c(0,10,20,30,40,50),labels = c("Muy pequeño", "Pequeño", "Mediano", "Grande","Muy grande"))


frecAbsAgr<-table(radio_agrupado)

frecAbsAcumAgr<-cumsum(frecAbsAgr)


frecRelAgr<-frecrel(radio_agrupado)

frecRelAcumAgr<-cumsum(frecRelAgr)


mintchebychev <- mr-2*sdn

maxtchebychev <- mr+2*sdn

plot(frecrelradio, type="h", xlab="radio", xlim=c(min(mintchebychev, min(unique(radio))),max(mintchebychev, max(unique(radio)))), main="Datos satélites Urano (radio)")

abline (v=c(mr, medianr, mintchebychev, maxtchebychev, rangintercuart, ranginterdecil), 
          col=c("purple","yellow","green","orange","pink","magenta"), lty=c(2,2,2,2), lwd=c(2,2,2,2))

legend("topright", legend=c("media", "mediana", "min tchebychev", "max tchebychev","r. intercuartilico", "r. interdecilico"), fill=c("purple","yellow","green","orange", "pink", "magenta"))








