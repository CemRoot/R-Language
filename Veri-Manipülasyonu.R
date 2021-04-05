##Veri Manipülasyonu 
install.packages("dplyr")##Veri birşetirmek için 
library(dplyr)
install.packages("ggplot2")##veri görselleştirmek için
library(ggplot2)


ilk_veri<-tribble(
  ~Kimlik, ~Ad,
  123, "Ali",
  456, "Cem",
  789, "Fatma",
  345, "Ahmet",
  678, "Emine",
)

ikinci_veri<-tribble(
  ~Kimlik, ~Yas,
  123, "34",
  456, "23",
  789, "19",
  345, "89",
  678, "82",
)

?dplyr # A Grammar of Data Manipulation

left_join(ilk_veri,ikinci_veri,by='Kimlik')
#a tibble: 5x3
####################
Kimlik Ad    Yas   #
<dbl> <chr> <chr>  #
1    123 Ali   34  # 
2    456 Cem   23  #
3    678 Fatma 82  # 
4    345 Ahmet 89  #
5    678 Emine 82  #
####################

ilk_veri2<-tribble(
  ~Kimlik, ~Ad,
  123, "Ali",
  456, "Cem",
  789, "Fatma",
  345, "Ahmet",
  678, "Emine",
  125, "Nuriye",
)

ikinci_veri2<-tribble(
  ~Kimlik, ~Yas,
  123, "34",
  456, "23",
  789, "19",
  345, "89",
  678, "82",
  633, "37",
  172, "12",
)

left_join(ilk_veri2,ikinci_veri2,by='Kimlik')
# A tibble: 6 x 3
##################### Kimlik sütununa göre eşleştirme yaptığından 
Kimlik Ad     Yas   # dolayı ilk veri setinde olup ikinci veri setinde
<dbl> <chr>  <chr>  # olmayan veri varsa o sütünun değerini NA olarak;
1    123 Ali    34  # ikinci veri setinde olup ilk veri setinde olmayan
2    456 Cem    23  # veriler sonuca eklenmez.
3    789 Fatma  19  # 
4    345 Ahmet  89  # 
5    678 Emine  82  # 
6    125 Nuriye NA  #
##################### Fakat bunu right_join ile yaparsak tam tersi olacaktır

right_join(ilk_veri2,ikinci_veri2,by='Kimlik')
##################### 
# A tibble: 7 x 3   # 
Kimlik Ad    Yas    # 
<dbl> <chr> <chr>   # 
1    123 Ali   34   # 
2    456 Cem   23   # 
3    789 Fatma 19   # 
4    345 Ahmet 89   # 
5    678 Emine 82   # 
6    633 NA    37   # 
7    172 NA    12   # 
##################### 
inner_join(ilk_veri2,ikinci_veri2,by='Kimlik')
#################### 
# A tibble: 5 x 3   # inner_join => right ve left fonksiyonlarından farkı 
Kimlik Ad    Yas    # ise birleştirme yapılacak
<dbl> <chr> <chr>   # tüm veri setlerinin ortak kayıtlarını getirir.
1    123 Ali   34   #
2    456 Cem   23   #
3    789 Fatma 19   #
4    345 Ahmet 89   #
5    678 Emine 82   #
#####################
full_join(ilk_veri2,ikinci_veri2,by='Kimlik')
#####################
# A tibble: 8 x 3   # full_join ise tüm veri setlerinde bulunan tüm
Kimlik Ad     Yas   # kayıtlı fonksiyon sonucu olarak getirmektedir.
<dbl> <chr>  <chr>  #
1    123 Ali    34  # 
2    456 Cem    23  # 
3    789 Fatma  19  # 
4    345 Ahmet  89  # 
5    678 Emine  82  # 
6    125 Nuriye NA  # 
7    633 NA     37  # 
8    172 NA     12  #
#####################