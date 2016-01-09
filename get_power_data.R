# Exploratory Data Analysis, Project 1

library(data.table)

fetch_power_data <- function() {
  fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata-data-household_power_consumption.zip'
  destfile='exdata-data-household_power_consumption.zip'
  download.file(fileURL,destfile=destfile,method='curl')
  unzip(destfile)
}

readthis <- function(fileURL,destfile) {
  temp <- tempfile()
  download.file(fileURL,temp,mode="wb")
  data <- read.table(unz(temp, destfile))
  unlink(temp)
}

read_power_data <- function() {
  # FUNCTION read_power_data(), returns a data.table of the specific power profile
  # on dates Feb 1-2, 2007
  
  # set working directory to the current source file directory
  script.dir <- '.'
  try(script.dir <- dirname(sys.frame(1)$ofile))
  setwd(script.dir)
  
  # fetch the file from the internet if needed
  filename <- 'household_power_consumption.txt'
  if (!file.exists(filename)) {
    fetch_power_data()
  }
  
  options(warn=-1) # turn off warnings
  pwr_all <- fread(input=filename, sep=";")
  options(warn=0) # turn warnings on
  
  # subset the two days needed
  pwr <- subset(pwr_all,Date=="1/2/2007" | Date=="2/2/2007")
  # we need realtime later on, so bind it to the table
  realtime <- as.POSIXct(strptime(paste(pwr$Date,pwr$Time), "%d/%m/%Y %H:%M:%S"))
  
  return(cbind(pwr,realtime))
}

# get the power data into variable pwr
pwr <- read_power_data()
