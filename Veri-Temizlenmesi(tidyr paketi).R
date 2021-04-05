# VERİ TEMİZLEMESİ (tidyr paketi)

# veri seti sütunlarının genişletilmesi,daralması,bölünmesi,
# veya birleştirilmesi işlemlerini yapılabilmesidir. 
# Bunu "tidyr paketiyle yapabiliriz.

install.packages("tidyr")
library(tidyr)

#                           gather()                     #

# Tindyr paketinin içersinde örnek olarak gösterilecek işlevlerin ilki "gather()"
# fonksiyonu olacaktır. gather() fonks. veri seti içerisinde daraltma yapar
# ve sutunları satır olarak göstererek diğer sütunda ise bu satırlara karşılık 
# gelmesi gereken değer belirtilniş olur.

veri_cerceve<-data.frame(Yas=c(41,25,35,45,30),Cinsiyet =c("Erkek","Kadın","Erkek",
                                                           "Kadın","Kadın"),
                         Sehir=c("İstanbul","Ankara","Kocaeli","Antalya","İzmir"))

yeni_veri_cerceve<-veri_cerceve %>% gather(Birlesik_Sutun,Yeni_Sutun,Cinsiyet:Sehir)

yeni_veri_cerceve
#################################
Yas Birlesik_Sutun Yeni_Sutun
1   41       Cinsiyet      Erkek
2   25       Cinsiyet      Kadın
3   35       Cinsiyet      Erkek
4   45       Cinsiyet      Kadın
5   30       Cinsiyet      Kadın
6   41          Sehir   İstanbul
7   25          Sehir     Ankara
8   35          Sehir    Kocaeli
9   45          Sehir    Antalya
10  30          Sehir      İzmir
#################################

#                      spread()                         #

# NOT: tidyr paketi içersinde yer alan bir diğer fonksiyon ise "spread()" fonks
#      gather() fonks. aksi yönde davranış göstermektedir. Dolayısıy ile bir önce
#      örnekte gather() fonks ile oluşturulan veri çerçeve üzerinde spread() fonks
#      uygulandığında ilk başlangıç haline geri dönülmüş olur.

yeni_veri_cerceve2<-yeni_veri_cerceve %>% spread(Birlesik_Sutun,Yeni_Sutun)

yeni_veri_cerceve2
#########################
Yas Cinsiyet    Sehir
1  25    Kadın   Ankara
2  30    Kadın    İzmir
3  35    Erkek  Kocaeli
4  41    Erkek İstanbul
5  45    Kadın  Antalya
#########################

#                         separate()                       #

#  tidyr paketi içersinde yer alan bir diğer fonksiyon ise "separate()" fonks
#   ilgili sütunun ikiye bölünmesini sağlar ayrım yapılırken sep parametresi
#   ile ayırmak için kullanılacak olan sembol gösterilir.

bolunmus_yeni_cerceve<-yeni_veri_cerceve %>% 
  separate(Birlesik_Sutun,c("Cinsiyet","Sehir"),sep = "")

bolunmus_yeni_cerceve
#################################
Yas Cinsiyet Sehir Yeni_Sutun
1   41              C      Erkek
2   25              C      Kadın
3   35              C      Erkek
4   45              C      Kadın
5   30              C      Kadın
6   41              S   İstanbul
7   25              S     Ankara
8   35              S    Kocaeli
9   45              S    Antalya
10  30              S      İzmir
#################################

#                    unit()                    #

# veri temizlemeye yarayan fonksiyonlardan birtanesidir.
# bu fonksiyon ile iki sütun tek sütunda birleştirilir.

# isimlendireceği sütün ilk parametrisi sonra ki parametre ise birleştirme
# yapılacak sütunları ifade eder diyoruz.Son parametresi olan sep parametresi
# ise veriler birleştiğinde ayraç olarak hangi karakter kullanılması gerektiği belirtir.

birlestir_yeni_cerceve<- bolunmus_yeni_cerceve %>% 
  unite(Yeni_Birlestir,Cinsiyet,Yeni_Sutun, sep = ":")


birlestir_yeni_cerceve