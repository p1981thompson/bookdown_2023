#read Calder individual sheets and reformat
library(here)
here("data", "file_i_want.csv")

myfile <- here('data','calder','jslhr_ed.csv')
ed <- read.csv(myfile)

myfile <- here('data','calder','jslhr_3s.csv')
s3<- read.csv(myfile)

myfile <- here('data','calder','jslhr_poss.csv')
poss <- read.csv(myfile)

alldat <- cbind(ed,s3,poss)

alldat2 <- rbind(ed,s3,poss)

colnames(alldat2)[2:8] <- paste0('T',1:7)

w<-which(alldat2[,1] %in% c('GROUP1','GROUP 2','MEAN','SD'))

alldat2<-alldat2[-w,]

alldat2$group <- 1

gp2 <- c("P3", "P4", "P6", "P7", "P11", "P13", "P15", "P17", "P19", "P20", "P21") 
w<-which(alldat2$GROUP.1 %in% gp2)
alldat2$group[w]<-2

colnames(alldat2)[1]<-'ID'

alldat2$morph <- 'ed'
alldat2$morph[22:42]<-'s3'
alldat2$morph[43:63]<-'poss'

alldat2[,2:8]<-as.numeric(unlist(alldat2[,2:8]))

mymeans <- aggregate(alldat2[,2:8],by=list(alldat2$morph,alldat2$group),FUN=mean, na.rm=T)
