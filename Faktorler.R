#####Faktorler
cevap=c(T,F,T,T,T,F,T)

cevap2=c("Dogru","Yanlıs","Dogru","Dogru","Bos","Yanlıs","Dogru")

cevapFactor<-factor(cevap2,levels=c("Dogru","Yanlıs","Bos"))
cevap2
cevapFactor
v1<-c(1,2,3,4,5)
summary(v1)
summary(cevap2)
summary(cevapFactor)
cevapFactor2<-factor(cevap2)
cevapFactor2

plot(cevapFactor2)#Grafik vermeye yarıyor,