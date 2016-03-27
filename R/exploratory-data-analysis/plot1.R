library(lubridate)
library(dplyr)
setwd("/Users/AmirKh/Documents/R/exploratory-data-analysis")
elect<- read.table("household_power_consumption.txt",sep=";",header = TRUE)
elect<- tbl_df(elect)
elect<- as.data.frame(elect)
elect<-elect[elect$Date %in% c("1/2/2007","2/2/2007"),]
elect$Global_active_power<-as.numeric(as.character(elect$Global_active_power))

elect$Date<-dmy(elect$Date)
png("plot1.png", width = 480, height = 480)
hist(elect$Global_active_power,col="red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()
