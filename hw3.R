setwd("C:/Users/Zhang Zhang/datasciencespecialization")
if(!file.exists("RProgrammingAssignment3.zip")){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
  download.file(fileUrl,"RProgrammingAssignment3.zip")
  unzip("RProgrammingAssignment3.zip")
  
}

care_measure_data<-"outcome-of-care-measures.csv"
hospital_data<-"hospital-data.csv"

outcome <- read.csv(care_measure_data, colClasses = "character")
outcome[, 11] <- as.numeric(outcome[, 11])