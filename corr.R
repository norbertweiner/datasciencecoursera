corr<-function(directory,threshold=0){
  
  library(curl)
  library(zipfR)
  
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  
  fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
  if(!file.exists("specdata.zip")){
    download.file(fileUrl,"specdata.zip")
    unzip("specdata.zip")
  }
  
  
  workingdir<-paste(getwd(),"/",directory,sep="")
  setwd(workingdir)
  filename<-list.files(workingdir)
  j=1
  cor_vec<-numeric(length(filename))
  
  for(i in 1:length(filename)){
    
    f<-read.csv(filename[i],sep = ",",header = T)
    if(length(complete.cases(f)[complete.cases(f)==TRUE])>threshold){
      tidy<-f[complete.cases(f),]
      cor_z<-cor(tidy$nitrate,tidy$sulfate)
      cor_vec[j]<-cor_z
      j=j+1
    }
  }
  
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  cor_vec[cor_vec!=0]

}