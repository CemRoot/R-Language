##Vector##

vector1<-c(100,40,50,67,95,233,454)
vector2<-c(128,83,12,34,5,1,45,32)
is.numeric(vector1)
typeof(vector1)

vector1[1:3]#1 to 3
vector1[-3]#except this

mean(vector1)
sd(vector1)
 
vec<-c(0,1,3,0,0,5,5,0,1,3,4,2,5)
sd(vec)
mean(vec)
vector5 <- rnorm(1000,mean=0,sd=1)
vector6 <- rnorm(1000,mean=0,sd=1)
system.time(vector5 + vector6)