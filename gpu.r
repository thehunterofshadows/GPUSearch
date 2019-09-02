library(data.table)
library(reshape2)
gpuData<-fread("gpuData.csv", sep=",",header=TRUE)
DF1<-melt(gpuData,id.var=c("Game","Res"))