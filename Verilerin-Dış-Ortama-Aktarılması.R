# VER�LER�N DI� ORTAMA AKTIRIMI 
#-> d��a aktar�m iki �ekilde olur 1)sabit s�r�c� 2)bulut taban� 
#->temel olarak .xlsx, .csv, .sas, .stata vb formata d���t�r�l�r

#elde edilmi� .csv format�nda d��ar� aktarmak i�in "write.csv()" fonks kullan�l�r.
#csv'deki ilk parametre csv format�na aktar�lacak olan verinin ismi, di�er parametre ise
#dizin �zerinde kaydedelicek olan csv format�ndaki belgenin ismidir.

write.csv(takim_son,"Basketbol_Tak�m.csv")
write.csv2(takim_son,"Basketbol_Tak�m.csv")

# Elde edilmi� olan veri �er�evesinin .xlsx format�nda d��ar�ya aktarmak i�in ise "xlsx paketi y�klenir.

install.packages("xlsx")
library(xlsx)

write.xlsx(takim_son,"Basketbol_Tak�m.csv")

#bunun yan�nda analiz edilen veriler,Google Drive �zerine de kaydedilebilir
install.packages("googledrive")
library(googledrive)
drive_upload("Basketbol_Tak�m.csv",name = "Takim_son")


#dropbox'da aktarabilinmektedir. Bunun i�in "rdrop2" paketi y�klenir
install.packages("rdrop2")
library(rdrop2)

 



