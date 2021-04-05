### Veri Çerçevesi Birleşimi(merge)

#R programlama dilinde merge() fonks ile tam veya kısmi eşleşme ile birleşim işlemleri yapılabilir.
?merge
# Kaynak Veri çercevimiz
Basketbolcular <- data.frame(
  Ad = c("Atınç","Görkem","Sevil","Şakir","Cem","Arda","Halil İbrahim","Doğukan","Tugay","Batuhan"),
  Takım = c("Fenerbahçe","Fenerbahçe","Fenerbahçe","Fenerbahçe",
            "Fenerbahçe","Galatasaray","Galatasaray","Beşiktaş","Galatasaray","Beşiktaş"),
    stringsAsFactors = FALSE)

#Hedef veri çercevemizi oluşturduk 
Kadro <- data.frame(
  Ad = c("Atınç","Görkem","Sevil","Şakir","Cem","Arda","Halil İbrahim","Doğukan","Tugay","Batuhan"),
  Numara = c(7,10,23,11,1,40,4,81,85,6),
  stringsAsFactors = FALSE
)

birlestir_takım <- merge(Basketbolcular,Kadro,by.x = "Ad")
birlestir_takım
#####################################
Ad       Takım      Numara
1           Arda Galatasaray     40
2          Atınç  Fenerbahçe      7
3        Batuhan    Beşiktaş      6
4            Cem  Fenerbahçe      1
5        Doğukan    Beşiktaş     81
6         Görkem  Fenerbahçe     10
7  Halil İbrahim Galatasaray      4
8          Sevil  Fenerbahçe     23
9          Şakir  Fenerbahçe     11
10         Tugay Galatasaray     85
######################################
dim(birlestir_takım)
#[1] 10  3

#Hedef veri çerçevesinin hedef sütununun ismini değiştirelim
colnames(Kadro)[colnames(Kadro) == "Ad"] <- "İsim"
#Farklı anahtar değeri ile birleştir
yeni_takim <- merge(Basketbolcular,Kadro,by.x = "Ad", by.y = "İSim")
#Yeni takım kadrosunu görüntüleyelim.
head(yeni_takim,6)
###############################
Ad       Takım Numara
1    Arda Galatasaray     40
2   Atınç  Fenerbahçe      7
3 Batuhan    Beşiktaş      6
4     Cem  Fenerbahçe      1
5 Doğukan    Beşiktaş     81
6  Görkem  Fenerbahçe     10
###############################
?head#verdiğim sayıya kadar bana sütunları getir
# Yeni basketbol oyuncusu tanımlansın 

yeni_basketbolcu <- c("Erkut","Beşiktaş")
# Basketbolcular veri çercevesine yeni oyuncu ekleyelim 
Basketbolcular <- rbind(Basketbolcular,yeni_basketbolcu)
#kısmi birleşme
takim_son<-merge(Basketbolcular,Kadro,by.x = "Ad",by.y = "İSim",all.x = TRUE)

takim_son
######################################
Ad       Takım Numara
1           Arda Galatasaray     40
2          Atınç  Fenerbahçe      7
3        Batuhan    Beşiktaş      6
4            Cem  Fenerbahçe      1
5        Doğukan    Beşiktaş     81
6          Erkut    Beşiktaş     NA
7         Görkem  Fenerbahçe     10
8  Halil İbrahim Galatasaray      4
9          Sevil  Fenerbahçe     23
10         Şakir  Fenerbahçe     11
11         Tugay Galatasaray     85
########################################