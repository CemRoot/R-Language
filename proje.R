#Titanik veri seti ile KAGGLE
#veriyi birle�tirelim. �ncelikle verileri e�itlemek laz�m. Bu y�zden test'e survive s�tunu ekleyelim

test$Survived = NA #s�tunlar e�itlendi 


tam.veri = rbind(train,test)

str(tam.veri)

install.packages("dplyr")
library(dplyr)

#veri Transformansyonlar�

?mutate #mutate () yeni de�i�kenler ekler ve mevcut olanlar� korur; transmute () 
        #yeni de�i�kenler ekler ve mevcut olanlar� ��kar�r.
        #Yeni de�i�kenler ayn� ada sahip mevcut de�i�kenlerin �zerine yaz�l�r. 
        #De�i�kenler, de�erleri NULL olarak ayarlanarak kald�r�labilir.
tam.veri<-tam.veri %>% mutate(Survived=factor(Survived),Pclass=factor(Pclass),Name=factor(Name),
                              Sex=factor(Sex))

tam.veri<-tam.veri%>% mutate(Name=as.character(Name))

library(ggplot2)
gorsel.veri<-ggplot(tam.veri[1:891,])
rm(gorsel.veri)#silmek i�in

#S�n�fa g�re hayatta kal�p kalmama 
p1= ggplot(tam.veri[1:891,]) + geom_bar(mapping = aes(x = Pclass, fill = Survived),
                                        position = "fill")
#yas ile hayatta kal�p kalmama
summary(tam.veri)
p2= ggplot(tam.veri[1:891,]) + geom_freqpoly(mapping = aes(x = Age, color = Survived),
                                             bins = 50)+theme(legend.position = "none")
#bilet fiyatlar� ile hayatta kal�p kalmama
p3=ggplot(tam.veri[1:891,]) + geom_freqpoly(mapping = aes(x = Fare, color = Survived),
                                            bins = 100)+theme(legend.position = "none")
#aile ile ve yanl�z ki�ilerin hayatta kal�p kalmama verisi
p4=ggplot(tam.veri[1:891,]) + geom_bar(mapping = aes(x = SibSp+Parch, color = Survived),
                                       position = "fill")+theme(legend.position = "none")

#b�t�n verileri bir karede incelemek istiyorum 
library(ggpubr)
ggarrange(p1,p2,p3,p4)

#NA yaz�l� h�creleri nas�l doldurabiliriz ? 

?is.na#Herhangi bir fonksiyonun NA de�eri ta�ay�p ta��mad���n� d�nd�r�r. 1=TRUE 0=FALSE

sum(is.na(tam.veri$Sex))#Hepsinin sonucu g�rd�m 

?apply #Bir dizi veya matrisin kenar bo�luklar�na bir i�lev uygulanarak elde edilen bir
       # vekt�r veya dizi veya de�erler listesi d�nd�r�r.Sat�r bazl� veya s�tu bazl� i�lem yapar
       # 1 yazarsak sat�r, 2 yazarsak s�tun bazl� olur 

apply(tam.veri, 2, function(x) sum(is.na(x)))#tablonun ka�tane NA i�erdi�ini g�rmek istedim.

median(tam.veri[!is.na(tam.veri$Age),]$Age)#! i�areti ile tersine d�nd�rerek say�sal de�erleri getirtiyorum NA'lar gelmiyor 

##      Regular Expressions (D�zenli �fadeler)       ##


Unvan<- sub(".*,.([^.]*)\\..*","\\1",tam.veri$Name)
# . herhangi bir karakteri kapsar
#  * yan�na y�ld�z burdaki karakterin birden �ok tekrar etti�i
#  , virg�l koydum ay�rd�m ��nk� bir �o�unda virg�l vard� ve ay�rd�m
#  . tekrar koydum bo�lu�u kapsamakta
#   ([]) se�im grubu olu�turdum.
#    \\noktan�n kendisi gelecek dedim
#    .* geriye kalan t�m karakterleri ifade etmek i�in 
#    \\1 sadece bu grubu �ekmek istiyorum dedim 
#    tam.veri$Name s�tununa uygulacam dedim 
#https://cheatography.com/davechild/cheat-sheets/regular-expressions/ adresine bak�larak semboller anla��labilir.

tam.veri$Unvan<-Unvan
  
  
str(tam.veri$Unvan)

#Unvan� faktore ceviriyorum 

tam.veri<- tam.veri%>%mutate(Unvan=factor(Unvan))

levels(tam.veri$Unvan)

install.packages("forcats")#faktorleri manip�le etmek i�in 

library(forcats)
library(dplyr)
library(ggplot2)
?fct_collapse #Collapse factor levels into manually defined groups
#fct_collapse ile k���k bir gruba indirgedik 
tam.veri=tam.veri%>%mutate(Unvan=
                              fct_collapse(Unvan,"Miss" = c("Mlle","Ms"),"Mrs" = "Mme",
                                              "Ranked"= c("Major", "Dr","Capt","Col","Rev"),
                           "Royalty" = c("Lady","Dona","the Countess","Don","Sir","Jonkheer")))
levels(tam.veri$Unvan)

ggplot(tam.veri[1:839,])+ geom_bar(mapping = aes(x = Unvan,fill = Survived),position = "fill")


##NA s�tunlar� doldural�m 
tam.veri=tam.veri%>% group_by(Unvan)%>% #na.rm=sil 'NA' demek  #1 olmas�n�n sebebi bir 0' a izin veriyoruz 22.0 gibi 2 olsayd� 22.00 olurud
  mutate(Age = ifelse(is.na(Age),round(median(Age, na.rm = T),1),Age))
            #e�er T ise NA d�nd�r(round = yuvarlama (22.3 � 22 yapar))

sum(is.na(tam.veri$Age))#NA kontrolu yap�yorum 
##Kabinler biliniyor mu bilinmiyor mu ? 

kabinBiliniyor = ifelse(is.na(tam.veri$Cabin) == TRUE , FALSE,TRUE)
tam.veri$kabinBiliniyor <- kabinBiliniyor

ggplot(tam.veri[1:891,]) + geom_bar(mapping = aes(x = kabinBiliniyor,
                                                  fill = Survived),position = "fill")


#Ben bu bilgiden kabinlerinin bilinmeyenlerin fakir olduklar� i�in kay�t tutulmad���, �nemsenmedi�i sonucunu ��kar�yorum.

#Fare s�tundaki NA s�tununu doldural�m. En yak�n de�erle doldural�m.
tam.veri%>% filter(is.na(Fare))
# Tek bir ki�iymi�\ 3.s�n�f bir ki�i oldu�unu d���n�yorum 
######################################################################################################
#PassengerId Survived Pclass Name        Sex     Age SibSp Parch Ticket  Fare Cabin Embarked Unvan
#<dbl> <fct>    <fct>  <chr>       <fct> <dbl> <dbl> <dbl> <chr>  <dbl> <chr> <chr>    <fct>
#  1        1044 NA       3      Storey, Mr~ male   60.5     0     0 3701      NA NA    S        Mr
#######################################################################################################

Fare = ifelse(is.na(tam.veri$Fare),round(median(tam.veri$Fare, na.rm = T),1),tam.veri$Fare)

tam.veri$Fare <- Fare

#veri ger�ek verilere aktar�yorum 
train<-tam.veri[1:891,]
test<-tam.veri
## Validation
#verinin %80 ile algoritma e�itimi i�in , %20si ile test olu�turuyoruz.
891*0.8 #%80 = 0.8  ->[1] 712.8

train.1<-train[1:710,]
test.1<-train[711:891,]

#Random Forest -Karar A�a� Algoritmas� 

library(randomForest)
?randomForest

rf<-randomForest(Survived ~ Pclass + Sex +
                   Age + SibSp + Parch + Fare +Unvan+kabinBiliniyor,
                 data = train.1, mtry = 3, ntree = 1000)#ka�tane a�a� istiyorum = 1000 adet
#mtry = x -> ka�ar tane de�i�ken (say�n�n kare k�k� kadar say� 
# girilmesi gerekli 7 de�ilken tan�mlad���m�z i�in x yerine 3 rakam�n� koydum)

tahminler <- predict(rf,test.1[,c(3,5,6,7,8,10,13,14)])
#ger�ek verilere ekliyorum 
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
























