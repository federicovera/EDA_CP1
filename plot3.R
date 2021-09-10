## Load libraries
 library(dplyr)

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


power_table1 <- subset(power_table,Date=="1/2/2007" | Date =="2/2/2007")

##Merge date and time

power_table2 <- mutate(power_table1, DateTime = paste(Date,Time))

## changes DateTime  to time classes

power_table3 <- mutate(power_table2, DateTime= strptime(DateTime, format ="%e/%m/%Y %H:%M:%S")) 


## changes dates to date classes

power_table4 <- mutate(power_table3, Date = as.Date(Date, format ="%d/%m/%Y"))

## Start png file output

png(file="plot3.png",width=480, height=480)


## Calling plot function

plot(power_table4$DateTime,power_table4$Sub_metering_1,type="n", xlab="", 
     ylab="Energy sub metering")

## filling in
with(power_table4, lines(DateTime, as.numeric(as.character(Sub_metering_1))))
with(power_table4, lines(DateTime, as.numeric(as.character(Sub_metering_2)), col="red"))
with(power_table4, lines(DateTime, as.numeric(as.character(Sub_metering_3)), col="blue"))
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


## adding Title
title(main="Energy sub metering")

        
##ending plotting to png
dev.off()





