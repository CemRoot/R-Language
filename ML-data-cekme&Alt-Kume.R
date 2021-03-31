ML data(internet üzerinde R'a veri çekmek)


banan<-read.csv("C:/Users/eminc/Documents/file1.csv",header= TRUE, sep = ";")
sarap <- read_delim("C:/Users/eminc/Documents/file1.csv",";", escape_double = FALSE, trim_ws = TRUE)
class(banan)
banan$chlorides

str(banan)

plot(sarap)

?cor#2 numaretic 2 sayısal değerin birbirisi arasında ilişkisi var mı bunu ölçer.

cor(banan$pH,banan$quality)

banan$alcohol<- as.numeric(banan$alcohol) #aynı degere sahip olması gerektiği için çevirdim
sarap$quality<- as.numeric(banan$quality)
str(banan$alcohol)
class(banan$alcohol)

#########################
#DATAFRAM'DE ALT KÜME ALMAK OLUŞTURMAK

banan[1,1]
banan[,1]
df<- banan[,1:3]
df2<-sarap[,c(8,11,12)]
plot(df2)
cor(df2$alcohol,df2$density)
na.omit(sarap)->sarap