#matrisler
a<-1:3
b<-2:4
c<-3:6

matrix<-cbind(a,b,c)

colnames(matrix)<-c("1.sutun","2.sutun","3.Sutun")

mtrx<-matrix(c(1,2,3,4,5,6,7,8,9))
matirx2<-matrix(c(1,2,3,4,5,6,7,8,9),nrow<-3,ncol<-3,byrow<-TRUE)
matirx4<-matrix(c(1,2,3,4,5,6,7,8,9),nrow<-3,ncol<-3,bycol<-TRUE)


matirx5<-matrix(c(1,2,3,4,5,6,7,8,9),nrow<-3,ncol<-3,byrow<-TRUE,dimnames<-list(c("row1","row2","row3"),c("c1","c2","c3")))S