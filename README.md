# # R-Language
 Merhaba,
Bu yazıda, sıkça karşılaşılan 'easyggplot2' paket yükleme sorunu için alternatif
paket olarak önerdiğimiz 'ggpubr' paketi hakkındaki bilgiler yer almaktadır.

'ggpubr' paketi, 'easyggplot2' paketi ile aynı ekip tarafından geliştirilmiştir ve bize çeşitli
fonksiyonlar aracılığıyla görsellerimiz üzerinde daha çok kontrole sahip olma imkanı
tanımaktadır.

Aşağıdaki kodlar 2 adet görselin aynı panelde nasıl gösterileceği hakkındadır. Fakat 'ggarrange'
fonksiyonu içine daha fazla görsel (p1, p2, p3, p4, .. ) koyarak ve ncol ve nrow parametrelerini
değiştirerek çok daha fazla görseli tek bir panele yerleştirebilirsiniz.

İlk olarak "ggpubr" paketini yüklüyoruz, burada iki farklı yöntem kullanılabilir. 

Bunlar;

>install.packages("ggpubr")

ve

>install.packages('devtools')

>library(devtools)

>devtools::install_github("kassambara/ggpubr") yöntemleridir.

>>library(ggpubr)

>library(ggplot2)


Bu örnekte 'iris' veri seti ile çalışacağız. Şimdi iki farklı görsel oluşturalım.

>p1 <- ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot(aes(fill = Species), color =
"white")

>p2 <- ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot(aes(fill = Species), color =
"white") + fill_palette("jco")

Görsellerimizi oluşturduk. Aralarındaki fark birisinde ggpubr paketine ait 'fill_palette'
fonksiyonunu kullanmamız oldu.
Şimdi bu iki görseli tek bir panelde gösterelim.

>ggarrange(p1,p2, ncol = 2, nrow = 1)

Bu kod ile görselleri yan yana bastırdık, bir de alt alta bastıralım.

>ggarrange(p1,p2, ncol = 1, nrow = 2)


# Daha fazlası için http://www.sthda.com/english/articles/24-ggpubr-publication-ready-plots/81-ggplot2-easy-way-to-mix-multiple-graphs-on-the-same-page/ linkine bakmanızı tavsiye ederim.
