##Vector##

vector1<-c(100,40,50,67,95,233,454)
vector2<-c(128,83,12,34,5,1,45,32)
is.numeric(vector1)
typeof(vector1)

vector1[1:3]#1 to 3
vector1[-3]#except this

mean(vector1)
sd(vector1)
 
vec<-c(0,1,3,0,0,5,5,0,1,3,4,2,5)
sd(vec)
mean(vec)
vector5 <- rnorm(1000,mean=0,sd=1)
vector6 <- rnorm(1000,mean=0,sd=1)
system.time(vector5 + vector6)

#Fonksiyonlar

funksiyon<-function(a,b)
{
  if(is.numeric(a)==TRUE&is.numeric(b)==TRUE)
  {
    return(a+b)
  }
  else if (is.character(a)==TRUE&is.character(b)==TRUE)
  {
    return(paste(a,b,sep=" "))
  }
  else{
    ("Doðru koþullar saðlanmadý")
  }
}

funksiyon(18,15)
funksiyon("Merhaba","Herkese")
funksiyon(15,"Selam")
######Faktorler
cevap=c(T,F,T,T,T,F,T)

cevap2=c("Dogru","Yanlýs","Dogru","Dogru","Bos","Yanlýs","Dogru")

cevapFactor<-factor(cevap2,levels=c("Dogru","Yanlýs","Bos"))
cevap2
cevapFactor
v1<-c(1,2,3,4,5)
summary(v1)
summary(cevap2)
summary(cevapFactor)
cevapFactor2<-factor(cevap2)
cevapFactor2

plot(cevapFactor2)#Grafik vermeye yarýyor,
##Listeler

degisken<-5
is.double(degisken)
is.vector(degisken)

 degisken<-c(1,2,3,4,5)

sayisal<-c(2,3,5)
karakter<- c("aa","bb","cc")
logical<-c(T,F,T)
liste<-list(sayisal,karakter,logical)


liste[[3]]

#Paketler#

install.packages("ggplot2")

library(ggplot2)

ggplot2::

  ?geom_point

#matrisler
a<-1:3
b<-2:4
c<-3:6

matrix<-cbind(a,b,c)

colnames(matrix)<-c("1.sutun","2.sutun","3.Sutun")

mtrx<-matrix(c(1,2,3,4,5,6,7,8,9))
matirx2<-matrix(c(1,2,3,4,5,6,7,8,9),nrow<-3,ncol<-3,byrow<-TRUE)
matirx4<-matrix(c(1,2,3,4,5,6,7,8,9),nrow<-3,ncol<-3,bycol<-TRUE)


matirx5<-matrix(c(1,2,3,4,5,6,7,8,9),nrow<-3,ncol<-3,byrow<-TRUE,dimnames<-list(c("row1","row2","row3"),c("c1","c2","c3")))


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

dfT$y #dataframe'in vektörlerine ulaþmada $ sembolü kullanýyoruz

##DATAFRAME-VERÝ DÖNÜÞÜMLERÝ

str(dfT)


dfT$z<-as.logical(dfT$z)


dfT$y<-as.character(dfT$y)

dfT$x2<-as.numeric(dfT$x)

#faktorden numariye geçerken önce karaktere inmemiz gerekli
#dfT$x<-is.numberic(is.character(dft$x)) gibi 
###################################################

#ML data(internet üzerinde R'a veri çekmek)


banan<-read.csv("C:/Users/eminc/Documents/file1.csv",header= TRUE, sep = ";")
sarap <- read_delim("C:/Users/eminc/Documents/file1.csv",";", escape_double = FALSE, trim_ws = TRUE)
class(banan)
banan$chlorides

str(banan)

plot(sarap)

?cor#2 numaretic 2 sayýsal deðerin birbirisi arasýnda iliþkisi var mý bunu ölçer.

cor(banan$pH,banan$quality)

banan$alcohol<- as.numeric(banan$alcohol) #ayný degere sahip olmasý gerektiði için çevirdim
sarap$quality<- as.numeric(banan$quality)
str(banan$alcohol)
class(banan$alcohol)

#########################
#DATAFRAM'DE ALT KÜME ALMAK OLUÞTURMAK

banan[1,1]
banan[,1]
df<- banan[,1:3]
df2<-sarap[,c(8,11,12)]
plot(df2)
cor(df2$alcohol,df2$density)
na.omit(sarap)->sarap


##################################################
##SAPPLY -> birden çok iþlem için kullanmaya yarar SATIRBAZLI ÇALIÞIR

?mean
mean(banan$fixed.acidity)
?sapply

sapply(banan, function(x){mean(x)})

sapply(banan,function(x){x/10})
#########GORSELLEÞTÝREMEYE GÝRÝÞ#############3

install.packages("ggplot2")

library(ggplot2)

ggplot2::mpg
plot(mpg)

veri<-mpg

?mpg

plot(veri$displ,veri$hwy)
plot(x=veri$displ, y=veri$hwy,col = "red")
plot(x=veri$displ, y=veri$hwy,col = "red",
     xlab="Motor Hacmi",
     ylab = "Galon baþýna Mil",main="Motor Hacmi Ve Yakýt Tüketimi")

############################################
##############GGPLOTS2 KULLANIMI ###########

ggplot(data = veri) + geom_function(x = ?, y = ?)

ggplot(data = veri) + geom_point(mapping = aes(x = displ , y = cty))



##ayrý 
p1 <- ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot(aes(fill = Species), color =
                                                                "white")
p2 <- ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot(aes(fill = Species), color =
                                                                "white") + fill_palette("jco")
p2

ggarrange(p1,p2, ncol = 2, nrow = 1)

ggarrange(p1,p2, ncol = 1, nrow = 2)

###FAKTOR DÖNÜÞÜMÜ VE RENKLENDÝRME 
yakit<-veri
yakit$class=as.factor(yakit$class)

sehiricituketim<-ggplot(yakit, aes(displ, cty)) + geom_boxplot(aes(fill = class), color =
  "red") +ggtitle("Sehir ici tuketim") + fill_palette("jco")

sehiricituketim

otobantuketim<-ggplot(yakit, aes(displ, hwy)) + geom_boxplot(aes(fill = class), color =
  "red") + ggtitle("Otoban tuketimi") + fill_palette("jco")

otobantuketim

ggarrange(sehiricituketim,otobantuketim, ncol = 2, nrow = 1)

##########SÝZE/ALPHA/SHAPE########################

ggplot(data=yakit)+ geom_point(mapping=aes(displ,hwy,size = class)) #size 

ggplot(data=yakit)+ geom_point(mapping=aes(displ,hwy,alpha = class)) #alpha 

ggplot(data=yakit)+ geom_point(mapping=aes(x = displ,y = hwy,shape = class,color = class))+
  ggtitle("Otoban yakýt performansý") #shape(sadece max6 parametre atar )

###########FACETS=>katagorik deðiþkenleri daha ayrýntlý gosterme aracýdýr.####

 ?facet_wrap
ggplot(data=yakit)+geom_point(mapping = aes(displ,hwy))+
  facet_wrap(~class,nrow = 2)

###Sutun grafikleri geom_bar() fonkisyonu##############

##elmas verisi

elmas<-ggplot2::diamonds
?diamonds

x=c("Fair", "Good", "Very Good", "Premium", "Ideal")
siraliX<- factor(x,levels = c("Fair", "Good", "Very Good", "Premium", "Ideal"),
                 ordered = TRUE)
siraliX
is.ordered(siraliX)
#####
##fill,color,position
ggplot(data = elmas) + geom_bar(mapping = aes(x = cut))

ggplot(data = elmas) + geom_bar(mapping = aes(x = clarity))

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,color = cut))

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,color = cut))+ 
  theme(legend.position = "none" )

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = cut))+ 
  theme(legend.position = "none" )

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = clarity))+ 
  theme(legend.position = "none" )
ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = clarity),
                                position = "stack") #positýon
  
ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = clarity),
                                position = "fill")
                                
#stat = "identity") komudu geom_bar ile 


elmas <- diamonds[1:3,]

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut, y = carat),stat = "identity")
#identity yazmamýzýn sebebi y deðeri dolu geldiði için sürekli onu boþ göstererk
#y eksenine bir komut atamak oluyor.


