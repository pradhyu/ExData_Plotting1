# current working directory should be the repo which has the R files for this project 

library(httr) 

data.Url<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# create data directory if it doesn't exists.
data.folder <- "data"
if(!file.exists(data.folder)){
  dir.create(data.folder)
} 

data.zip <- paste(getwd(), "/", data.folder,"/household_power_consumption.zip", sep = "")
if(!file.exists(data.zip)){
  download.file(data.Url, data.zip, method="curl", mode="wb")
}

data.txt<- paste(getwd(),"/", data.folder, "/household_power_consumption.txt", sep = "")
if(!file.exists(data.txt)){
  unzip(data.zip, list = FALSE, overwrite = FALSE, exdir = data.folder)
}

data.summaryFile<- paste(getwd(), "/", data.folder, "/data_summary.rds", sep = "")

if(!file.exists(data.summaryFile)){
  data.loaded <- read.table(data.txt, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  data.loaded$Time <- strptime(paste(data.loaded$Date, data.loaded$Time), "%d/%m/%Y %H:%M:%S")
  data.loaded$Date <- as.Date(data.loaded$Date, "%d/%m/%Y")
  data.dateRange <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  data.loaded <- subset(data.loaded, Date %in% data.dateRange)
  saveRDS(data.loaded, data.summaryFile)
} else {
  data <- "data/data_summary.rds"
  data.loaded <- readRDS(data)
}
  
  