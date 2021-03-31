#Fonksiyonlar

funksiyon<-function(a,b)
{
  if(is.numeric(a)==TRUE&is.numeric(b)==TRUE)
  {
    return(a+b)
  }
  else if (is.character(a)==TRUE&is.character(b)==TRUE)
  {
    return(paste(a,b,sep=" "))
  }
  else{
    ("Doğru koşullar sağlanmadı")
  }
}

funksiyon(18,15)
funksiyon("Merhaba","Herkese")
funksiyon(15,"Selam")