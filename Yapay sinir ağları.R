#YAPAY SÝNÝR AÐLARI


# Boston veri seti icin

install.packages("MASS")

library(MASS)

# neural networks fonksiyonu icin

install.packages("neuralnet")

library(neuralnet)

# yapay sinir aglarini kullanmak icin verimizi olceklendirmemiz gerekiyor. 

# tahmin edecegimiz degiskeni tam olarak 0 ile 1 arasina cekmemiz gerekiyor.

# tum degerleri 0 ile 1 arasina cekmek icin minumum degerlerinden cikartip

# maximum ile minumum'un farkina boluyoruz.

# diger degerleri ise ortalama degerlerinden cikartip standard sapmalarina boluyoruz.

Boston.scaled <- as.data.frame(scale(Boston))

min.medv <- min(Boston$medv)

max.medv <- max(Boston$medv)

Boston.scaled$medv <- scale(Boston$medv
                            
                            , center = min.medv
                            
                            , scale = max.medv - min.medv)

# tahmin edecegimiz degisken olan medv degiskeni bu sekilde olceklendirildi.

# Train-test ayrimi

Boston.train.scaled <- Boston.scaled[1:400, ]

Boston.test.scaled <- Boston.scaled[401:506, ]

# neural networks fonksiyonunun kullaniminda butun degiskenleri tek tek yazmamiz gerekiyor.

# !!! NEURAL NETWORKS KULLANIRKEN TUM DEGISKENLER SAYISAL OLMALIDIR !!!!

# eger birden cok kategoriye sahip bir degiskeniniz var ise model.matrix fonksiyonunu

# kullanin. ?model.matrix yazarak detaylari inceleyebilirsiniz.

Boston.nn.5.3 <- neuralnet(medv~crim+zn+indus+chas+nox+rm+age+dis+rad+tax+ptratio+black+lstat
                           
                           , data=Boston.train.scaled
                           
                           , hidden=c(5,3)
                           
                           , linear.output=TRUE)

plot(Boston.nn.5.3)

# plot fonksiyonu ile kolayca yarattigimiz yapay sinir agini gorsellestirebiliriz.

Boston.nn.8 <- neuralnet(Boston.nn.fmla
                         
                         , data=Boston.train.scaled
                         
                         , hidden=8
                         
                         , linear.output=TRUE)

plot(Boston.nn.8)

# boylece iki farkli sinir agi olusturduk.

# sonucu eski formatinda gormek icin sadece olceklendirmeyi tersine uygulamamiz gerekiyor.

