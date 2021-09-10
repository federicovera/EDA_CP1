## Load libraries
 library(dplyr)
library(lubridate)

# Load Packages and get the Data

path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")


## files downloaded and uncompressed

## loading table into R

power_table <- read.table(file = "household_power_consumption.txt", sep = ";", 
                          header=TRUE)

## subsetting the file with the dates 2007-02-01 and 2007-02-02

subpower <- subset(power_table,Date=="1/2/2007" | Date =="2/2/2007")

## Start png file output

png(file="plot1.png",width=480, height=480)

#calling the basic plot function
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

##ending plotting to png
dev.off()