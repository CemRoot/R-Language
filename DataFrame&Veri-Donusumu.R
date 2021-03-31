##DATA.FRAME

x<-1:10
y<-c("a","b","c","d","e","f","g",,"h","i","j")
z<-c(T,F,T,F,T,F,T,F,T,T)

#cbind matrix'e çevirir

t<-cbind(x,y,z)
class(t)

t


dfT<-data.frame(t)


t[1,]

dfT$y #dataframe'in vektörlerine ulaşmada $ sembolü kullanıyoruz

##DATAFRAME-VERİ DÖNÜŞÜMLERİ

str(dfT)


dfT$z<-as.logical(dfT$z)


dfT$y<-as.character(dfT$y)

dfT$x2<-as.numeric(dfT$x)

#faktorden numariye geçerken önce karaktere inmemiz gerekli
#dfT$x<-is.numberic(is.character(dft$x)) gibi 
###################################################