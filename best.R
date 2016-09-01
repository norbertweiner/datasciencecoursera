best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  setwd("C:/Users/Zhang Zhang/datasciencespecialization")
  if(!file.exists("RProgrammingAssignment3.zip")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip"
    download.file(fileUrl,"RProgrammingAssignment3.zip")
    unzip("RProgrammingAssignment3.zip")
    
  }
  
  care_measure_data<-"outcome-of-care-measures.csv"
  hospital_data<-"hospital-data.csv"
  
  result <- read.csv(care_measure_data, colClasses = "character")
  
  Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
  Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
  Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
  
}
