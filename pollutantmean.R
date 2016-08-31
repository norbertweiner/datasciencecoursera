pollutantmean<-function(directory,pollutant,id=1:332){
  library(zipfR)
  if(!file.exists("specdata.zip")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
    download.file(fileUrl,"specdata.zip",method = "curl")
    unzip("specdata.zip")
  }
  
  fileloc <- paste(getwd(),"/",directory,"/",sep="")
  files<-list.files(fileloc)
  datamean<-numeric(length(id))
  j=1
  for(i in files[id])
  {
    data<-read.csv(paste(fileloc,i,sep=""),sep=",")
    #isna = is.na(data$pollutant)     #it is standard error for column choose!!!!
    isna <- is.na(data[,pollutant])
    datamean[j]<-mean(data[,pollutant][!isna])
    j<-j+1
  }
  mean(datamean)
}