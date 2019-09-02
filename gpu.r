library(ggplot2)
library(data.table)
library(reshape2)
gpuData<-fread("gpuData.csv", sep=",",header=TRUE)
df1<-gpuData[,c("Game","Resoultion", "2080S","2080","2070S","1070")]
df1<-melt(df1,id.var=c("Game","Resoultion"))
setnames(df1,old=c("variable","value"),new=c("GFX_Card","FPS"))
df2k<-df1[Resoultion=="2k",]
df4k<-df1[Resoultion=="4k",]
#g<-ggplot(df2k,aes(x=Game,y=value,fill=variable))+geom_bar(stat="identity",position="identity")
barwidth = 0.35
g<-ggplot()+
  geom_bar(df2k,mapping=aes(x=Game,y=FPS,fill=GFX_Card),
           stat="identity",position="identity")+
  geom_bar(df4k,mapping=aes(x=Game,y=FPS,fill=GFX_Card),
           stat="identity",position="identity")

g2<-ggplot()+
  geom_bar(df1,mapping=aes(x=Resoultion,y=FPS,fill=GFX_Card),
           stat="identity",position="identity")+facet_wrap(~Game,nrow=1)

h<-60 
g3<-ggplot(df1,mapping=aes(x=Resoultion,y=FPS,fill=GFX_Card, label=FPS))+
  geom_bar(stat="identity",position="identity")+facet_wrap(~Game,nrow=1)+
  geom_hline(aes(yintercept=h),linetype="dashed", color="red")+
  #geom_label(size = 1.5, colour="white", fontface="bold", position="identity")
  #geom_label(size = 4, colour="white", fontface="bold", position = "identity",vjust=0.5)
  #geom_text(size = 3, position = position_stack(vjust = 0.001))
ggsave("gpu.png", width=8,height=3.13, scale=1)
