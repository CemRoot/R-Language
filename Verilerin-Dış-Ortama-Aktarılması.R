# VERÝLERÝN DIÞ ORTAMA AKTIRIMI 
#-> dýþa aktarým iki þekilde olur 1)sabit sürücü 2)bulut tabaný 
#->temel olarak .xlsx, .csv, .sas, .stata vb formata döüþtürülür

#elde edilmiþ .csv formatýnda dýþarý aktarmak için "write.csv()" fonks kullanýlýr.
#csv'deki ilk parametre csv formatýna aktarýlacak olan verinin ismi, diðer parametre ise
#dizin üzerinde kaydedelicek olan csv formatýndaki belgenin ismidir.

write.csv(takim_son,"Basketbol_Takým.csv")
write.csv2(takim_son,"Basketbol_Takým.csv")

# Elde edilmiþ olan veri çerçevesinin .xlsx formatýnda dýþarýya aktarmak için ise "xlsx paketi yüklenir.

install.packages("xlsx")
library(xlsx)

write.xlsx(takim_son,"Basketbol_Takým.csv")

#bunun yanýnda analiz edilen veriler,Google Drive üzerine de kaydedilebilir
install.packages("googledrive")
library(googledrive)
drive_upload("Basketbol_Takým.csv",name = "Takim_son")


#dropbox'da aktarabilinmektedir. Bunun için "rdrop2" paketi yüklenir
install.packages("rdrop2")
library(rdrop2)

 



