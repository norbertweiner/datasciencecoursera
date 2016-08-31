pollutantmean<-function(directory,pollutant,id=1:332){
<<<<<<< HEAD
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
=======
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  library(curl)
  library(zipfR)
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
  if(!file.exists("specdata.zip")){
    download.file(fileUrl,"specdata.zip")
    unzip("specdata.zip")
  }
  workingdir<-paste(getwd(),"/",directory,sep="")
  setwd(workingdir)
  print(workingdir)
  
  filename<-list.files(workingdir)
  meanvector<-numeric(length(id))
  sum<-0
  divider<-0
  
  for(single_file in filename[id]){
    
    f<-read.csv(single_file,sep = ",",header = T)
    sum<-sum(f[,pollutant],na.rm = T)+sum
    divider<-length(f[,pollutant][!is.na(f[,pollutant])])+divider
    
  }
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  sum/divider
  
>>>>>>> 180ecfbbe69e959c334d590faccaf52c1af59955
}