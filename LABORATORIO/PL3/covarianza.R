covarianza <-
function(x,y) {
media_x<-mean(x)
media_y<-mean(y)
len<- lenght(x)
res<-0
for(i in 1:len){
res<-res+x[i]*y[i]
}
res/len-media_x*media_y
}
