###Sutun grafikleri geom_bar() fonkisyonu##############

##elmas verisi

elmas<-ggplot2::diamonds
?diamonds

x=c("Fair", "Good", "Very Good", "Premium", "Ideal")
siraliX<- factor(x,levels = c("Fair", "Good", "Very Good", "Premium", "Ideal"),
                 ordered = TRUE)
siraliX
is.ordered(siraliX)
#####
##fill,color,position
ggplot(data = elmas) + geom_bar(mapping = aes(x = cut))

ggplot(data = elmas) + geom_bar(mapping = aes(x = clarity))

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,color = cut))

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,color = cut))+ 
  theme(legend.position = "none" )

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = cut))+ 
  theme(legend.position = "none" )

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = clarity))+ 
  theme(legend.position = "none" )
ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = clarity),
                                position = "stack") #positıon
  
ggplot(data = elmas) + geom_bar(mapping = aes(x = cut,fill = clarity),
                                position = "fill")
                                
#stat = "identity") komudu geom_bar ile 


elmas <- diamonds[1:3,]

ggplot(data = elmas) + geom_bar(mapping = aes(x = cut, y = carat),stat = "identity")
#identity yazmamızın sebebi y değeri dolu geldiği için sürekli onu boş göstererk
#y eksenine bir komut atamak oluyor.