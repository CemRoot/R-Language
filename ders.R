##K-Means Yöntemi ile Kümeleme
install.packages("cluster")
install.packages("FoctoMineR")
install.packages("factoextra")
install.packages("ggthemes")
library(cluster)
?kmeans
#kmeans(data,K,iterasyon,nstart)
library(ggplot2)
cerceve <- data.frame(yas=c(43,12,54,23,6,5,23,52,25,38,43,45,26,28,31),
                      harcamalar = c(423,23,1232,432,143,65,357,325,75,123,654,76,23,745,723))
ggplot(cerceve,aes(x=yas,y=harcamalar)) + geom_point()

#Algoritma ve yöntemin nasýl çalýþtýralacaðý detaylandýrdýkdan sonra YÝHUÝ tarafýndan oraya
#konan amimation paketi sayesinde her adým grafiksel olarak çizilebilir.
install.packages("animation")

##Random Forest(Rastgale Orman)
packages=c("dplyr","tibble","ggplot2","formattable","readr","readxl","xlsx",
"pastecs","randomForest","aod","DescTools","performanceEstimation","yardstick","MASS")
#paketler install.packages("") fonks ile kurularak;
#library() fonks ile de import edilir.

sapply(packages,require,character.only = TRUE)
library(readr)
dia <- read_csv("diabetes.csv")
#eksik verilerin belirlenmesi 
eksik<-sapply(dia,function(x) sum(is.na(x))) %>% as_tibble()
eksik<-cbind(Deðiþken=names(dia),n=eksik)%>%as_tibble()
formattable(eksik)
#Eksik verilerin veri setinden temizlenmesi 
dia1<-na.omit(dia)
eksik1<-sapply(dia1,function(x) sum(is.na(x))) %>% as_tibble()
eksik1<-cbind(Deðiþken=names(dia1),n=eksik1)%>%as_tibble()
formattable(eksik1)
#yenilenmiþ veri setinin ilk 10 örnk
formattable(head(dia1,10))
str(dia1)
#verisetindeki tüm özellikler ve örnek sayýlarýn gösterimi
#######################################################################################
tibble[,9] [768 x 9] (S3: tbl_df/tbl/data.frame)
$ Pregnancies             : num [1:768] 6 1 8 1 0 5 3 10 2 8 ...
$ Glucose                 : num [1:768] 148 85 183 89 137 116 78 115 197 125 ...
$ BloodPressure           : num [1:768] 72 66 64 66 40 74 50 0 70 96 ...
$ SkinThickness           : num [1:768] 35 29 0 23 35 0 32 0 45 0 ...
$ Insulin                 : num [1:768] 0 0 0 94 168 0 88 0 543 0 ...
$ BMI                     : num [1:768] 33.6 26.6 23.3 28.1 43.1 25.6 31 35.3 30.5 0 ...
$ DiabetesPedigreeFunction: num [1:768] 0.627 0.351 0.672 0.167 2.288 ...
$ Age                     : num [1:768] 50 31 32 21 33 30 26 29 53 54 ...
$ Outcome                 : num [1:768] 1 0 1 0 1 0 1 0 1 1 ...
#######################################################################################
t<-describe(dia1[,-1])
