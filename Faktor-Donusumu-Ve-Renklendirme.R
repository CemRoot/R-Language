###FAKTOR DÖNÜŞÜMÜ VE RENKLENDİRME 
yakit<-veri
yakit$class=as.factor(yakit$class)

sehiricituketim<-ggplot(yakit, aes(displ, cty)) + geom_boxplot(aes(fill = class), color =
  "red") +ggtitle("Sehir ici tuketim") + fill_palette("jco")

sehiricituketim

otobantuketim<-ggplot(yakit, aes(displ, hwy)) + geom_boxplot(aes(fill = class), color =
  "red") + ggtitle("Otoban tuketimi") + fill_palette("jco")

otobantuketim

ggarrange(sehiricituketim,otobantuketim, ncol = 2, nrow = 1)