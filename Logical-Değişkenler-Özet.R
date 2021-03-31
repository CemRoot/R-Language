# Logical Değişkenler

TRUE veya FALSE değerlerini alırlar. Bunları 1 ve 0 olarak da düşünebiliriz.
Herhangi bir sayının TRUE ile çarpımı o sayının kendisini verirken FALSE ile
çarpımı 0 döndürür.
x <- TRUE
y <- FALSE
z <- T
q <- F
x + y
z + q
if(x){
 print(“degiskenin degeri true”)
}else {
 print(“degiskenin degeri false")
}
if(y){
 print(“degiskenin degeri true”)
}else {
 print(“degiskenin degeri false")
}
OR ve AND
OR operatörü ‘veya' anlamına gelir. Örnek üzerinden gidersek
 A or B
Şeklinde bir işleme sahipsek eğer bu işlemin sonucu A ve B’nin alacağı değerlere
göre değişecektir. A’nın değeri 1, B’nin değeri 0 olursa bu işlemin sonucu 1
olacaktır, çünkü OR operatörünün 1 sonucunu alması için değişkenlerden sadece
1’inin 1 değerine sahip olması yeterlidir. Bu işlemin 0’a eşit olması yalnızca iki
değişkenin de 0 değerine sahip olması durumunda görülür.
AND operatörü ‘ve’ anlamına gelir. Örnek üzerinden gidersek
 A and B 
Şeklinde bir işleme sahipsek eğer bu işlemin sonucu yine A ve B’nin alacağı
değerlere göre değişecektir. A’nın değeri 1, B’nin değeri 0 olursa bu işlemin
sonucu 0 olacaktır, çünkü AND operatörünün 1 sonucunu alması için iki
değişkenin de 1 değerine sahip olması gerekmektedir. Bu işlemin 0’a eşit olması
iki değişkenin de 0 değerine sahip olması veya herhangi bir tanesinin 0’a eşit
olması durumlarında görülür.
Örnek kod
x <- c(1:10)
x[ (x>8) | (x<5) ]
# 1 2 3 4 9 10
x <- c(1:10)
x
x > 8
F F F F F F F F T T
x < 5
T T T T F F F F F F
x > 8 | x < 5
T T T T F F F F T T
x[c(T,T,T,T,F,F,F,F,T,T)]
1 2 3 4 9 10
x <- 5
y <- 16
x<y
[1] TRUE
x>y
[1] FALSE
x<=5
[1] TRUE
y>=20
[1] FALSE
y == 16 
[1] TRUE
x != 5
[1] FALSE
WHILE -FOR- IF
While döngüsü belirli bir mantıksal (logical) operatörün değerine bağlı olarak
duran veya devam eden bir döngü çeşididir.
x = TRUE
while(x){
 ….
 if(…){
 x = FALSE
}
}
Yukarıdaki döngü x değişkeni FALSE olana kadar devam edecektir ve döngü
içindeki işlemleri yapacaktır. if operatörü herhangi bir değişken üzerinde bulunan
koşulları kontrol eder. Örneğin while döngüsü içinde bir Y değişkenimiz olsun. Bu
Y değişkeni 5’ten büyük olduğu durumda da WHILE döngüsünden çıkalım. Bu
durumda
x = TRUE
y = 0
while(x){
 # buradaki islemler y degerini arttirip sonunda 5’ten buyuk bir degere getiriyor.
ornek olarak basitce y = y + 1 diyebiliriz
 ….
 if(y > 5){
 x = FALSE
}
}
FOR DONGUSU
Bir diğer döngü çeşidimizse for döngüsü. while döngüsünde döngüden çıkma
koşulu mantıksal değişkenin değerinin değişmesiydi, burada ise döngüyü
oluştururken bir değişken yaratıp onun kaç adımlık bir döngüyü yöneteceğini 
ayarlıyoruz. Örneğin ‘i’ değişkenimiz olsun. Biz i değişkenine 1’den 100’a kadar
değerleri sıra ile al diyelim.
for( i in 1:100 ) {
 print(i)
}
Burada i in 1:100 kodu yukarıdaki i değişkenine 1’den 100’a kadar değerleri sıra
ile al diyelim demenin R’daki yöntemi. Biz i değişkenine 1’den 100’e kadar olan
değerleri sıra ile atadık ve onu ekrana print komutu ile yazdırdık. Fakat onu
yazdırmak yerine başka şeyler de yapabilirdik. Döngümüzü tanımladıktan sonra
içeride istediğimizi yapmakta özgürüz. Yapacağımız şey i’ye bağlı olmak zorunda
da değil. Örneğin
x <- 1
for( i in 1:100 ) {
 x <- x + 1
}
x
Burada i’ye bağlı herhangi bir işlem gerçekleştirmedik. For döngüsüne girmeden
önce bir x değişkeni yaratıp onu for döngüsü içinde 100 kere döndürüp her
seferinde ona 1 ekledik. 
