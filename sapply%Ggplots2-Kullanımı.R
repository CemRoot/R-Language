##SAPPLY -> birden çok işlem için kullanmaya yarar SATIRBAZLI ÇALIŞIR

?mean
mean(banan$fixed.acidity)
?sapply

sapply(banan, function(x){mean(x)})

sapply(banan,function(x){x/10})
#########GORSELLEŞTİREMEYE GİRİŞ#############3

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
     ylab = "Galon başına Mil",main="Motor Hacmi Ve Yakıt Tüketimi")

############################################
##############GGPLOTS2 KULLANIMI ###########

ggplot(data = veri) + geom_function(x = ?, y = ?)

ggplot(data = veri) + geom_point(mapping = aes(x = displ , y = cty))



##ayrı 
p1 <- ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot(aes(fill = Species), color =
                                                                "white")
p2 <- ggplot(iris, aes(Species, Sepal.Length)) + geom_boxplot(aes(fill = Species), color =
                                                                "white") + fill_palette("jco")
p2

ggarrange(p1,p2, ncol = 2, nrow = 1)

ggarrange(p1,p2, ncol = 1, nrow = 2)