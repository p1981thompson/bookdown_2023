
require(tidyverse)
swain1<-read.csv("swaindat1.csv")
swain2<-read.csv("swaindat2.csv")
swain3<-read.csv("swaindat3.csv")

swainall <- swain1
swainall$x[1:3]<-swainall$y[15:17]
swainall$x[4:17]<-NA
swainall$y[3:17]<-c(swainall$y[1:14],NA)
swainall$y[1:2]<-NA
colnames(swainall)<-c('Session','Control','Probe1')
swainall$Control[8]<-swainall$Control[2]
swainall$Control[14]<-swainall$Control[3]
swainall$Control[2:3]<-NA

swainall$Probe2<-NA
swainall$Probe2[3:16]<-swain2$y[1:14]
swainall$Probe3<-swain3$y

plot(swainall$Session,swainall$Control,type='p',pch=8,ylim=c(0,100),
      xlim = c(1,17),xlab='Session',ylab='% Correct',main='Jason')
lines(swainall$Session,swainall$Probe1,type='b',pch=16,col='red')
abline(v=7.5,col='red')
text(5.5,85,'Phonics-->',col='red')
text(12,85,"* Control probe")
plot(swainall$Session,swainall$Control,type='p',pch=8,ylim=c(0,100),
     xlim = c(1,17),xlab='Session',ylab='% Correct')
lines(swainall$Session,swainall$Probe2,type='b',pch=16,col='blue')
abline(v=10.5,col='blue')
text(8.5,90,'Morphology-->',col='blue')
plot(swainall$Session,swainall$Control,type='p',pch=8,ylim=c(0,100),
     xlim = c(1,17),xlab='Session',ylab='% Correct')
lines(swainall$Session,swainall$Probe3,type='b',pch=16,col='darkgreen')
abline(v=13.5,col='darkgreen')
text(11.5,95,'Vocabulary-->',col='darkgreen')



