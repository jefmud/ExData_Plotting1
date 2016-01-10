# Exploratory Data Analysis, Project 1

library(data.table)

# FUNCTION: fetch_power_data() - downloads/unzips a specific file from internet URL
# note: it is somewhat sensitive to operating system on which the code is run

fetch_power_data <- function() {
  fileURL <- 'https://d396qusza40orc.cloudfront.net/exdata-data-household_power_consumption.zip'
  destfile='exdata-data-household_power_consumption.zip'
  download.file(fileURL,destfile=destfile,method='curl')
  unzip(destfile)
}

# FUNCTION: read_power_data(start_date,end_date) - returns a data.table
#             of the specific power readings for specific dates, defaults to project specifications
# note - start_date and end_date are in the format DAY/MONTH/YEAR

read_power_data <- function(start_date="1/2/2007",end_date="3/2/2007") {
  # FUNCTION read_power_data(), returns a data.table of the specific power profile
  # the defaults are set for out project on dates Feb 1-2, 2007
  
  options(warn=-1) # turn off warnings
  
  # set working directory to the current source file directory
  script.dir <- '.'
  try(script.dir <- dirname(sys.frame(1)$ofile))
  setwd(script.dir)
  
  # fetch the file from the internet if needed
  filename <- 'household_power_consumption.txt'
  if (!file.exists(filename)) {
    fetch_power_data()
  }
  
  # find where in the file to get the daily readings
  start_line <- grep(start_date,readLines(filename))[1]
  end_line <- grep(end_date, readLines(filename))[1]
  
  # get the daily readings
  pwr <- fread(input=filename, sep=";", skip=start_line-1, nrows=end_line-start_line,header=F)
  names(pwr) <- names(fread(input=filename, sep=";",nrows=0)) # get just the header
  
  #pwr_all <- fread(input=filename, sep=";")
  options(warn=0) # turn warnings on
  
  # we need realtime later on, so bind it to the table and return
  realtime <- as.POSIXct(strptime(paste(pwr$Date,pwr$Time), "%d/%m/%Y %H:%M:%S"))
  return(cbind(pwr,realtime))
}

# get the power data into variable pwr
pwr <- read_power_data()
