complete<-function(directory,id=1:332){
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
  
  filename<-list.files(workingdir)
  obs<-numeric(length(id))
  j<-1
  
  for(single_file in filename[id]){
    
    f<-read.csv(single_file,sep = ",",header = T)
    obs[j]<-length(complete.cases(f)[complete.cases(f)==TRUE])
    j<-j+1
    
  }
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  data.frame(id = id,nobs=obs)
  
}