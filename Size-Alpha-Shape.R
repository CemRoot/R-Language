##########SİZE/ALPHA/SHAPE########################

ggplot(data=yakit)+ geom_point(mapping=aes(displ,hwy,size = class)) #size 

ggplot(data=yakit)+ geom_point(mapping=aes(displ,hwy,alpha = class)) #alpha 

ggplot(data=yakit)+ geom_point(mapping=aes(x = displ,y = hwy,shape = class,color = class))+
  ggtitle("Otoban yakıt performansı") #shape(sadece max6 parametre atar )

###########FACETS=>katagorik değişkenleri daha ayrıntlı gosterme aracıdır.####

 ?facet_wrap
ggplot(data=yakit)+geom_point(mapping = aes(displ,hwy))+
  facet_wrap(~class,nrow = 2)