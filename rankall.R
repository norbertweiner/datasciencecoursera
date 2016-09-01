rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  
  #set directory and download the necessary data
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  if(!file.exists("RProgrammingAssignment3.zip")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
    download.file(fileUrl,"RProgrammingAssignment3.zip")
    unzip("RProgrammingAssignment3.zip")
    
  }
  
  care_measure_data<-"outcome-of-care-measures.csv"
  hospital_data<-"hospital-data.csv"
  parameter2<-c("heart attack","heart failure","pneumonia")
  
  result <- read.csv(care_measure_data, colClasses = "character")
  source('rankhospital.R')
  
  ##check parameters
  if(!(outcome %in% parameter2)){stop("invalid outcome")}
  
  AllStates<-unique(result$State)
  
  hospitals<-sapply(AllStates,rankhospital,num=num,outcome=outcome)
  
  final<-data.frame(hospital=hospitals,state=AllStates)
  final[order(final$state),]
  
  
}
