#Titanik veri seti ile KAGGLE
#veriyi birleþtirelim. öncelikle verileri eþitlemek lazým. Bu yüzden test'e survive sütunu ekleyelim

test$Survived = NA #sütunlar eþitlendi 


tam.veri = rbind(train,test)

str(tam.veri)

install.packages("dplyr")
library(dplyr)

#veri Transformansyonlarý

?mutate #mutate () yeni deðiþkenler ekler ve mevcut olanlarý korur; transmute () 
        #yeni deðiþkenler ekler ve mevcut olanlarý çýkarýr.
        #Yeni deðiþkenler ayný ada sahip mevcut deðiþkenlerin üzerine yazýlýr. 
        #Deðiþkenler, deðerleri NULL olarak ayarlanarak kaldýrýlabilir.
tam.veri<-tam.veri %>% mutate(Survived=factor(Survived),Pclass=factor(Pclass),Name=factor(Name),
                              Sex=factor(Sex))

tam.veri<-tam.veri%>% mutate(Name=as.character(Name))

library(ggplot2)
gorsel.veri<-ggplot(tam.veri[1:891,])
rm(gorsel.veri)#silmek için

#Sýnýfa göre hayatta kalýp kalmama 
p1= ggplot(tam.veri[1:891,]) + geom_bar(mapping = aes(x = Pclass, fill = Survived),
                                        position = "fill")
#yas ile hayatta kalýp kalmama
summary(tam.veri)
p2= ggplot(tam.veri[1:891,]) + geom_freqpoly(mapping = aes(x = Age, color = Survived),
                                             bins = 50)+theme(legend.position = "none")
#bilet fiyatlarý ile hayatta kalýp kalmama
p3=ggplot(tam.veri[1:891,]) + geom_freqpoly(mapping = aes(x = Fare, color = Survived),
                                            bins = 100)+theme(legend.position = "none")
#aile ile ve yanlýz kiþilerin hayatta kalýp kalmama verisi
p4=ggplot(tam.veri[1:891,]) + geom_bar(mapping = aes(x = SibSp+Parch, color = Survived),
                                       position = "fill")+theme(legend.position = "none")

#bütün verileri bir karede incelemek istiyorum 
library(ggpubr)
ggarrange(p1,p2,p3,p4)

#NA yazýlý hücreleri nasýl doldurabiliriz ? 

?is.na#Herhangi bir fonksiyonun NA deðeri taþayýp taþýmadýðýný döndürür. 1=TRUE 0=FALSE

sum(is.na(tam.veri$Sex))#Hepsinin sonucu gördüm 

?apply #Bir dizi veya matrisin kenar boþluklarýna bir iþlev uygulanarak elde edilen bir
       # vektör veya dizi veya deðerler listesi döndürür.Satýr bazlý veya sütu bazlý iþlem yapar
       # 1 yazarsak satýr, 2 yazarsak sütun bazlý olur 

apply(tam.veri, 2, function(x) sum(is.na(x)))#tablonun kaçtane NA içerdiðini görmek istedim.

median(tam.veri[!is.na(tam.veri$Age),]$Age)#! iþareti ile tersine döndürerek sayýsal deðerleri getirtiyorum NA'lar gelmiyor 

##      Regular Expressions (Düzenli Ýfadeler)       ##


Unvan<- sub(".*,.([^.]*)\\..*","\\1",tam.veri$Name)
# . herhangi bir karakteri kapsar
#  * yanýna yýldýz burdaki karakterin birden çok tekrar ettiði
#  , virgül koydum ayýrdým çünkü bir çoðunda virgül vardý ve ayýrdým
#  . tekrar koydum boþluðu kapsamakta
#   ([]) seçim grubu oluþturdum.
#    \\noktanýn kendisi gelecek dedim
#    .* geriye kalan tüm karakterleri ifade etmek için 
#    \\1 sadece bu grubu çekmek istiyorum dedim 
#    tam.veri$Name sütununa uygulacam dedim 
#https://cheatography.com/davechild/cheat-sheets/regular-expressions/ adresine bakýlarak semboller anlaþýlabilir.

tam.veri$Unvan<-Unvan
  
  
str(tam.veri$Unvan)

#Unvaný faktore ceviriyorum 

tam.veri<- tam.veri%>%mutate(Unvan=factor(Unvan))

levels(tam.veri$Unvan)

install.packages("forcats")#faktorleri manipüle etmek için 

library(forcats)
library(dplyr)
library(ggplot2)
?fct_collapse #Collapse factor levels into manually defined groups
#fct_collapse ile küçük bir gruba indirgedik 
tam.veri=tam.veri%>%mutate(Unvan=
                              fct_collapse(Unvan,"Miss" = c("Mlle","Ms"),"Mrs" = "Mme",
                                              "Ranked"= c("Major", "Dr","Capt","Col","Rev"),
                           "Royalty" = c("Lady","Dona","the Countess","Don","Sir","Jonkheer")))
levels(tam.veri$Unvan)

ggplot(tam.veri[1:839,])+ geom_bar(mapping = aes(x = Unvan,fill = Survived),position = "fill")


##NA sütunlarý dolduralým 
tam.veri=tam.veri%>% group_by(Unvan)%>% #na.rm=sil 'NA' demek  #1 olmasýnýn sebebi bir 0' a izin veriyoruz 22.0 gibi 2 olsaydý 22.00 olurud
  mutate(Age = ifelse(is.na(Age),round(median(Age, na.rm = T),1),Age))
            #eðer T ise NA döndür(round = yuvarlama (22.3 ü 22 yapar))

sum(is.na(tam.veri$Age))#NA kontrolu yapýyorum 
##Kabinler biliniyor mu bilinmiyor mu ? 

kabinBiliniyor = ifelse(is.na(tam.veri$Cabin) == TRUE , FALSE,TRUE)
tam.veri$kabinBiliniyor <- kabinBiliniyor

ggplot(tam.veri[1:891,]) + geom_bar(mapping = aes(x = kabinBiliniyor,
                                                  fill = Survived),position = "fill")


#Ben bu bilgiden kabinlerinin bilinmeyenlerin fakir olduklarý için kayýt tutulmadýðý, önemsenmediði sonucunu çýkarýyorum.

#Fare sütundaki NA sütununu dolduralým. En yakýn deðerle dolduralým.
tam.veri%>% filter(is.na(Fare))
# Tek bir kiþiymiþ\ 3.sýnýf bir kiþi olduðunu düþünüyorum 
######################################################################################################
#PassengerId Survived Pclass Name        Sex     Age SibSp Parch Ticket  Fare Cabin Embarked Unvan
#<dbl> <fct>    <fct>  <chr>       <fct> <dbl> <dbl> <dbl> <chr>  <dbl> <chr> <chr>    <fct>
#  1        1044 NA       3      Storey, Mr~ male   60.5     0     0 3701      NA NA    S        Mr
#######################################################################################################

Fare = ifelse(is.na(tam.veri$Fare),round(median(tam.veri$Fare, na.rm = T),1),tam.veri$Fare)

tam.veri$Fare <- Fare

#veri gerçek verilere aktarýyorum 
train<-tam.veri[1:891,]
test<-tam.veri
## Validation
#verinin %80 ile algoritma eðitimi için , %20si ile test oluþturuyoruz.
891*0.8 #%80 = 0.8  ->[1] 712.8

train.1<-train[1:710,]
test.1<-train[711:891,]

#Random Forest -Karar Aðaç Algoritmasý 

library(randomForest)
?randomForest

rf<-randomForest(Survived ~ Pclass + Sex +
                   Age + SibSp + Parch + Fare +Unvan+kabinBiliniyor,
                 data = train.1, mtry = 3, ntree = 1000)#kaçtane aðaç istiyorum = 1000 adet
#mtry = x -> kaçar tane deðiþken (sayýnýn kare kökü kadar sayý 
# girilmesi gerekli 7 deðilken tanýmladýðýmýz için x yerine 3 rakamýný koydum)

tahminler <- predict(rf,test.1[,c(3,5,6,7,8,10,13,14)])
#gerçek verilere ekliyorum 
tahminler.1 <- predict(rf,test[,c(3,5,6,7,8,10,13,14)])

table(tahminler,test.1$Survived)
sum(test.1$Survived == 1)

length(tahminler.1)

Finish.Titanic <- test$PassengerId
Finish.Titanic <- as.data.frame(Finish.Titanic)
colnames(Finish.Titanic) <- c("PassengerId")
Finish.Titanic$Survived <- tahminler.1


write.csv2(Finish.Titanic,"Titanic1.csv",row.names = T)


###################
























