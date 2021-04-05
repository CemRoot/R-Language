##ML E GÝRÝÞ 


Tahmin Edilecel Deger = Etki Miktari * Etki Eden Deger + Kesisim

Tahmin Edilen Ev Fiyati = Etki Miktari * Ev Buyuklugu + Kesisim

#Regilasyon

ev = data.frame(
  EvBuyuklugu = c(80,83,76,60,90,100,120,200,45,140,140,180,190,
                  190,200,220,250,160,200,190,300,270,245,100,120),
  Fiyat = c(150000,153000,140000,120000,150000,160000,
            160000,160000,200000,150000,170000,180000,175000,
            180000,200000,230000,260000,150000,200000,195000,280000,255000,
            230000,110000,130000)
)

ggplot(data=ev) + geom_point(mapping = aes(x = EvBuyuklugu,y =Fiyat))+
  coord_cartesian(ylim = c(70000,250000))


?lm #dogrusal paneller


regresyon.sonuc=lm(formula = Fiyat ~ EvBuyuklugu,data = ev)


ggplot(data = ev) + geom_point(mapping = aes(x = EvBuyuklugu, y = Fiyat)) +
  coord_cartesian(ylim = c(70000,500000)) + 
  geom_smooth(mapping = aes(x = EvBuyuklugu, y = Fiyat), method = "lm", formula = y ~ x,se=F)

plot(x = ev$EvBuyuklugu, y = ev$Fiyat)
abline(lm(formula = Fiyat ~., data = ev), col = "red")
####Regrasyon 

?predict

yeni.ev = data.frame(
  EvBuyuklugu = c(90,111,123,234)
)

sonuc = predict(regresyon.sonuc, yeni.ev)

sonuc


yeni.ev$Tahmin = sonuc

###Karar aðaçlarý
install.packages("tree")
library(tree)

?tree()

karar.agaci<-tree(Degerlendirme ~ .,data = car)


karar.agaci
########################
#k-(KNN) k'a en yakýn komsu algoritmasý 


boy = c(160,163,168,175,180,190,165,170,185,184,191,168,178,163,176)
kilo = c(50,52,70,59,80,85,51,63,79,70,72,57,60,70,90)
z= c("K","K","E","K","E","E","K","E","E","K","K","E","K","E","E")
CÝNSÝYET = as.factor(z)
veri <- data.frame(boy = boy, kilo = kilo, CÝNSÝYET = CÝNSÝYET)

library(ggplot2)
ggplot(veri) + geom_point(aes(boy,kilo,color = CÝNSÝYET))

#K- NEAREST Neighbor KNN #calýþmasý için class kütüphanes?i lazýmdýr.

sonuc <- knn(cbind(boy,kilo),c(180,65),CÝNSÝYET)
sonuc
?knn
####Train ve Test Ayýrma

sonuc <- knn(cbind(boy,kilo),c(180,65),CÝNSÝYET)

sonuc <- knn(train.X,test.X, train.Y, k = 1 )


####KNN ÝLE EV SÝGORTASI 

install.packages("ISLR")
library(ISLR)
?Caravan

dim(Caravan) #kaç satýr kaç sütün 

karavan = Caravan

summary(Caravan$Purchase)

348/5822

karavan2 <- scale(karavan[,-86])
var(Caravan[,2])
sqrt(var(Caravan[,2]))
mean(Caravan[,2])

test=1:1000
train.X = karavan2[-test,]
test.X <- karavan2[test,]
train.Y <- karavan$Purchase[-test]
test.Y = karavan$Purchase[test]
library(class)
tahmin <- knn(train.X,test.X,train.Y,k = 1)
mean(test.Y != tahmin)

mean(test.Y != "No")


4/(4+11)
